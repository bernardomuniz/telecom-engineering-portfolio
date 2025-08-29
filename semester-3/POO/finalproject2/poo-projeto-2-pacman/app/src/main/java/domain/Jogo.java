package domain;

import domain.comestiveis.Cereja;
import domain.comestiveis.Pontinhos;
import domain.entidades.Fantasma;
import domain.entidades.PacMan;
import ifsc.poo.PacManGame;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;


import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import static domain.Constantes.*;

public class Jogo extends JPanel implements ActionListener, KeyListener{
    //Atributos quanto ao jogo
    private final InterfaceGrafica interface_grafica;
    private Mapa mapa;

    //Atributos quanto ao jogador em si
    private PacMan player1;
    private PacMan player2;
    private int score_total;

    private boolean game_over;
    private boolean ehCoop;

    private Timer gameLoop;
    private Random random = new Random();
    private ScheduledExecutorService scheduler = Executors.newSingleThreadScheduledExecutor();

    //Atributos inimigos
    private List<Fantasma> fantasmas = new LinkedList<>();

    public Jogo(InterfaceGrafica interfaceGrafica, Mapa mapa, boolean coop){
        this.interface_grafica = interfaceGrafica;
        this.mapa = mapa;
        this.game_over = false;
        this.ehCoop = coop;
        this.player1 = mapa.getPacmans_list().getFirst();
        if(ehCoop) this.player2 = mapa.getPacmans_list().getLast();
    }

    public void iniciaJogo(){
        setPreferredSize(new Dimension(LARGURA_TELA, ALTURA_TELA));
        setBackground(Color.BLACK);
        addKeyListener(this);
        setFocusable(true);

        interface_grafica.inicializaInterfaceJogo(this);

        for (int i = 0; i < mapa.getFantasmas_list().size(); i++) {
            mapa.getFantasmas_list().get(i).getVelocidade().setDirecao(mapa.getFantasmas_list().get(i), DIRECOES_DISP[random.nextInt(4)], mapa.getParedes_list());
        }

        gameLoop = new Timer(50, this); //20fps (1000/50)
        gameLoop.start();
    }

    public void reiniciaJogo(){
        this.mapa = new Mapa(mapa.getPrimordial_cerejas_list(), mapa.getPrimordial_paredes_list(), mapa.getPrimordial_fantasmas_list(), mapa.getPrimordial_pacmans_list(), mapa.getPrimordial_pontinhos_list());
        reiniciaPosicaoEntidades();
        gameLoop.start();
    }

    public void reiniciaPosicaoEntidades(){
        for (int i = 0; i < mapa.getPacmans_list().size(); i++) {
            mapa.getPacmans_list().get(i).setPosicaoAtual(mapa.getPacmans_list().get(i).getPontoOrigem()); //Seta a posição do fantasma atual para sua posição de origem
            mapa.getPacmans_list().get(i).getVelocidade().parar();
        }
        for (int i = 0; i < mapa.getFantasmas_list().size(); i++) {
          mapa.getFantasmas_list().get(i).setPosicaoAtual(mapa.getFantasmas_list().get(i).getPontoOrigem()); //Seta a posição do fantasma atual para sua posição de origem
        }

    }

    public void move(){
        this.player1.incrementaPosicaoAtual(this.player1.getVelocidade().getVelocidade_x(), this.player1.getVelocidade().getVelocidade_y());

        this.player1.wrapAround();

        //Pacman interagindo com as paredes
        for (int i = 0; i < mapa.getParedes_list().size(); i++) {
            if(this.player1.detectaColisao(this.player1, this.mapa.getParedes_list().get(i))){
                this.player1.incrementaPosicaoAtual(-this.player1.getVelocidade().getVelocidade_x(), -this.player1.getVelocidade().getVelocidade_y());
                break;
            }
        }

        //Pacman interagindo com os fantasmas
        if(this.player1.getMortal()){ //Se pode morrer
            for (int i = 0; i < mapa.getFantasmas_list().size(); i++) {
                if(player1.detectaColisao(mapa.getFantasmas_list().get(i), player1)){
                    player1.setQtd_vidas(player1.getQtd_vidas() - 1);
                    if(player1.getQtd_vidas() == 0){
                        game_over = true;
                        return;
                    }
                    reiniciaPosicaoEntidades();
                }
            }
        }

        //Fantasmas se movimentando
        for (int i = 0; i < mapa.getFantasmas_list().size(); i++) {
            Fantasma fantasma = mapa.getFantasmas_list().get(i);
            if (fantasma.getPosicaoAtual().getX() == TAM_BLOCO * 9 && !fantasma.getVelocidade().getDirecao().equals(UP) && !fantasma.getVelocidade().getDirecao().equals(DOWN)) {
                fantasma.getVelocidade().setDirecao(fantasma, UP, mapa.getParedes_list());
            }
            fantasma.incrementaPosicaoAtual(fantasma.getVelocidade().getVelocidade_x(), fantasma.getVelocidade().getVelocidade_y());
            for (int j = 0; j < mapa.getParedes_list().size(); j++) {
                if (fantasma.detectaColisao(fantasma, mapa.getParedes_list().get(j)) || fantasma.getPosicaoAtual().getX() <= 0 || fantasma.getPosicaoAtual().getX() + fantasma.getLargura() >= LARGURA_TELA) {
                    fantasma.incrementaPosicaoAtual(-fantasma.getVelocidade().getVelocidade_x(), -fantasma.getVelocidade().getVelocidade_y());
                    String nova_direcao = DIRECOES_DISP[random.nextInt(DIRECOES_DISP.length)];
                    fantasma.getVelocidade().setDirecao(fantasma, nova_direcao, mapa.getParedes_list());
                }
            }
        }

        //Pacman interagindo com os pontinhos
        Pontinhos pontinho_comido = null;
        for (int i = 0; i < mapa.getPontinhos_list().size(); i++) {
            if(this.player1.detectaColisao(this.player1, this.mapa.getPontinhos_list().get(i))){
                pontinho_comido = mapa.getPontinhos_list().get(i);
                this.score_total += PONTO_SCORE;
            }
        }
        this.mapa.getPontinhos_list().remove(pontinho_comido);

        //Pacman interagindo com a cereja
        Cereja cereja_comida = null;
        for (int i = 0; i < mapa.getCerejas_list().size(); i++) {
            if(this.player1.detectaColisao(player1,mapa.getCerejas_list().get(i))){
                cereja_comida = mapa.getCerejas_list().get(i);
                this.score_total += CEREJA_SCORE;
                cereja_comida.powerUp(this.player1, this.mapa);
                scheduler.schedule(()-> {
                    this.player1.setMortal(true);
                    for (int j = 0; j < mapa.getFantasmas_list().size(); j++) {
                        mapa.getFantasmas_list().get(j).setImagem(mapa.getFantasmas_list().get(j).getImagemFantasmaNormal());
                    }
                }, 10, TimeUnit.SECONDS);
            }
        }
        this.mapa.getCerejas_list().remove(cereja_comida);

        if(mapa.getPontinhos_list().isEmpty()){ //Fim do jogo
            reiniciaJogo();
        }
    }

    //Quando a tecla for liberada
    @Override
    public void keyReleased(KeyEvent e) {
        if (this.game_over) { //Usuário precisa precionar qualquer tecla para reiniciar o jogo
            reiniciaJogo();
            this.game_over = false;
            gameLoop.start();
            for (int i = 0; i < mapa.getPacmans_list().size(); i++) {
                mapa.getPacmans_list().get(i).setQtd_vidas(QTD_VIDAS);
            }
            return;
        }

        switch (e.getKeyCode()){ //Movimentos do player 1
            case KeyEvent.VK_UP://Move o p1 pra cima
                this.player1.getVelocidade().setDirecao(this.player1, UP, mapa.getParedes_list());
                break;
            case KeyEvent.VK_DOWN://Move o p1 pra baixo
                this.player1.getVelocidade().setDirecao(this.player1, DOWN, mapa.getParedes_list());
                break;
            case KeyEvent.VK_LEFT://Move o p1 pra esquerda
                this.player1.getVelocidade().setDirecao(this.player1, LEFT, mapa.getParedes_list());
                break;
            case KeyEvent.VK_RIGHT://Move o p1 pra direita
                this.player1.getVelocidade().setDirecao(this.player1, RIGHT, mapa.getParedes_list());
                break;
        }

        if(this.ehCoop) { //Movimentos do player2
            switch (e.getKeyCode()) {
                case KeyEvent.VK_W://Move o p2 pra cima
                    this.player2.getVelocidade().setDirecao(this.player2, UP, mapa.getParedes_list());
                    break;
                case KeyEvent.VK_S://Move o p2 pra baixo
                    this.player2.getVelocidade().setDirecao(this.player2, DOWN, mapa.getParedes_list());
                    break;
                case KeyEvent.VK_A://Move o p2 pra esquerda
                    this.player2.getVelocidade().setDirecao(this.player2, LEFT, mapa.getParedes_list());
                    break;
                case KeyEvent.VK_D://Move o p2 pra direita
                    this.player2.getVelocidade().setDirecao(this.player2, RIGHT, mapa.getParedes_list());
                    break;
            }
        }

        switch (player1.getVelocidade().getDirecao()){
            case UP:
                player1.setImagem(IMAGEM_PACMAN_UP);
                break;
            case DOWN:
                player1.setImagem(IMAGEM_PACMAN_DOWN);
                break;
            case LEFT:
                player1.setImagem(IMAGEM_PACMAN_LEFT);
                break;
            case RIGHT:
                player1.setImagem(IMAGEM_PACMAN_RIGHT);
                break;
        }
    }

    //Sempre que uma ação acontecer
    @Override
    public void actionPerformed(ActionEvent e) {
        move();
        repaint();
        if (game_over) {
            gameLoop.stop();
        }
    }

    //Responsável por ficar redesenhando os elementos na tela
    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.drawImage(this.player1.getImage(), this.player1.getPosicaoAtual().getX(), this.player1.getPosicaoAtual().getY(), TAM_BLOCO, TAM_BLOCO, null);


        for (int i = 0; i < mapa.getFantasmas_list().size(); i++) { //Desenha os fantasmas
            Fantasma fantasma = mapa.getFantasmas_list().get(i);
            g.drawImage(fantasma.getImage(), fantasma.getPosicaoAtual().getX(), fantasma.getPosicaoAtual().getY(), TAM_BLOCO, TAM_BLOCO, null);
        }

        for (int i = 0; i < mapa.getParedes_list().size(); i++) { //Desenha as paredes
            Parede parede = mapa.getParedes_list().get(i);
            g.drawImage(parede.getImage(), parede.getPosicaoAtual().getX(), parede.getPosicaoAtual().getY(), TAM_BLOCO, TAM_BLOCO, null);
        }

        for (int i = 0; i < mapa.getCerejas_list().size(); i++) { //Desenha as cerejas
            Cereja cereja = mapa.getCerejas_list().get(i);
            g.drawImage(cereja.getImage(), cereja.getPosicaoAtual().getX(), cereja.getPosicaoAtual().getY(), TAM_BLOCO, TAM_BLOCO, null);
        }

        g.setColor(Color.WHITE);

        for (int i = 0; i < mapa.getPontinhos_list().size(); i++) { //Desenha os pontinhos
            Pontinhos pontinhos = mapa.getPontinhos_list().get(i);
            g.fillRect(pontinhos.getPosicaoAtual().getX(), pontinhos.getPosicaoAtual().getY(), PONTINHO_DIMENSOES, PONTINHO_DIMENSOES);
        }

        //score
        g.setFont(new Font("Arial", Font.PLAIN, 18));
        if (game_over) {
            g.drawString("Game Over: " + String.valueOf(score_total), TAM_BLOCO/2, TAM_BLOCO/2);
        }
        else {
            g.drawString("x" + String.valueOf(player1.getQtd_vidas()) + " Score: " + String.valueOf(score_total), TAM_BLOCO/2, TAM_BLOCO/2);
        }
    }


    //Métodos vazios, ocorre pois precisamos sobrescrever estes métodos por conta do implements
    @Override
    public void keyTyped(KeyEvent e) {}

    @Override
    public void keyPressed(KeyEvent e) {}
}
