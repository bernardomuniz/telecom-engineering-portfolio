package domain.entidades;

import domain.Mapa;
import domain.Ponto;

import java.awt.*;
import java.util.Random;

import static domain.Constantes.*;

public class Fantasma extends Entidade implements Atacar{

    private final Random random = new Random();
    private Image fantasma_normal;

    public Fantasma(Ponto ponto, Image imagem, int altura, int largura, String direcao){
        super(ponto, imagem, VELOCIDADE, altura, largura);
        getVelocidade().inicializaDirecao(direcao);
        this.fantasma_normal = imagem;
    }

    @Override
    public void mover(String direcao, Mapa mapa){
        if(this.getPosicaoAtual().getX() == TAM_BLOCO*9 && !this.getVelocidade().getDirecao().equals(UP) && !this.getVelocidade().getDirecao().equals(DOWN)){
            this.getVelocidade().setDirecao(this, UP, mapa.getParedes_list());
        }
        this.incrementaPosicaoAtual(this.getVelocidade().getVelocidade_x(), this.getVelocidade().getVelocidade_y());
        for (int j = 0; j < mapa.getParedes_list().size(); j++) {
            if(this.detectaColisao(this, mapa.getParedes_list().get(j)) || this.getPosicaoAtual().getX() <= 0 || this.getPosicaoAtual().getX() + this.getLargura() >= LARGURA_TELA){
                this.incrementaPosicaoAtual(-this.getVelocidade().getVelocidade_x(), -this.getVelocidade().getVelocidade_y());
                String nova_direcao = DIRECOES_DISP[random.nextInt(DIRECOES_DISP.length)];
                this.getVelocidade().setDirecao(this, nova_direcao, mapa.getParedes_list());
            }
        }

    }

    public Image getImagemFantasmaNormal(){
        return this.fantasma_normal;
    }

    @Override
    public void atacar(){ //Ainda não implementado

    }
}