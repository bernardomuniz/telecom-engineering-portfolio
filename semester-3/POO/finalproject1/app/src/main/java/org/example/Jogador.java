package org.example;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

public class Jogador {
    private String nome;
    private int vitorias;
    private Tabuleiro tabuleiroJogador;
    private Interface interfaceGrafica;
    private List<String> jogadas = new LinkedList<>();
    private boolean ehRobo;

    public Jogador(Interface Interface, Tabuleiro tabuleiro, boolean robo) {
            this.ehRobo = robo;
            this.interfaceGrafica = Interface;
            this.tabuleiroJogador = tabuleiro;
    }

    public boolean setNome(String nome){
        if (nome == null || nome.isEmpty()){
            System.out.println("Nome inválido");
            return false;
        }
        this.nome = nome;
        return true;
    }

    public boolean jaJogou(String posicao) {
        if (jogadas.contains(posicao)){
            if(!isEhRobo()){
              System.out.println("Já foi realizado este disparo!");  
            }
            return true;
        }
        return false;
    }

    public void registrarJogada(String posicao) {
        jogadas.add(posicao);
    }


    public void incrementaVitorias(){
        this.vitorias++;
    }

    public int getVitorias(){
        return this.vitorias;
    }

    public String getNome(){
        return this.nome;
    }

    public boolean isEhRobo() {
        return ehRobo;
    }

    public boolean posicionarNavio(int coluna, String l, int tamanho, String orientacao){
        int linha = Tabuleiro.traduzLinha(l);
        Navio navio = new Navio(coluna, linha, tamanho, orientacao);
        if(tabuleiroJogador.podePosicionarNavio(navio, true)){
            interfaceGrafica.desenhaNavios(navio, tabuleiroJogador);
            tabuleiroJogador.registraPosicoesOcupadas(navio.getPosicoesOcupadas());
            tabuleiroJogador.addNAvio(navio);
            return true;
        }
        return false;
    }

    public void posicionarNaviosAleatorio(){
        Navio portaAvioes =  novaFrotaAleatoria(5);
        Navio encouracado = novaFrotaAleatoria(4);
        Navio cruzador = novaFrotaAleatoria(3);
        Navio submarino = novaFrotaAleatoria(3);
        Navio contratorpedeiro = novaFrotaAleatoria(2);

        tabuleiroJogador.addNAvio(portaAvioes);
        tabuleiroJogador.addNAvio(encouracado);
        tabuleiroJogador.addNAvio(cruzador);
        tabuleiroJogador.addNAvio(submarino);
        tabuleiroJogador.addNAvio(contratorpedeiro);

        if (!this.ehRobo){
            interfaceGrafica.desenhaNavios(portaAvioes, tabuleiroJogador);
            interfaceGrafica.desenhaNavios(encouracado, tabuleiroJogador);
            interfaceGrafica.desenhaNavios(cruzador, tabuleiroJogador);
            interfaceGrafica.desenhaNavios(submarino, tabuleiroJogador);
            interfaceGrafica.desenhaNavios(contratorpedeiro, tabuleiroJogador);
        }
    }

    public boolean realizarBombardeio(int coluna, String l, Tabuleiro tabuleiro){
        int linha = Tabuleiro.traduzLinha(l);
        String posicao = Tabuleiro.formataPosicao(linha, coluna); // Corrigido aqui

        if (jaJogou(posicao)) {
            return false;
        }

        registrarJogada(posicao);

        if (tabuleiro.acertouNavio(posicao, this.nome, linha, coluna)){
            interfaceGrafica.desenhaAcertoDeTiro(linha, coluna, tabuleiro);
            return true;
        } else {
            interfaceGrafica.desenhaErroDeTiro(linha, coluna, tabuleiro);
            return false;
        }
    }
    
    public boolean realizarBombardeioAleatorio(Tabuleiro tabuleiro){
        String posicao;
        int linha, coluna;

        do {
            Random r = new Random();
             linha = r.nextInt(10);
             coluna = r.nextInt(10);
            posicao = Tabuleiro.formataPosicao(linha,coluna);
        } while(jaJogou(posicao));

        return realizarBombardeio(coluna, tabuleiro.getCaracteresLegenda()[linha], tabuleiro);

    }

    private Navio novaFrotaAleatoria(int tamanho){
        Random r = new Random();
        int linha = r.nextInt(10);
        int coluna = r.nextInt(10);


        boolean orientacao = r.nextBoolean();
        Navio navio = new Navio(coluna, linha, tamanho, (orientacao ? "horizontal" : "vertical"));

        while (!tabuleiroJogador.podePosicionarNavio(navio, false)){
            linha = r.nextInt(10);
            coluna = r.nextInt(10);
            orientacao = r.nextBoolean();
            navio = new Navio(coluna, linha, tamanho, (orientacao ? "horizontal" : "vertical"));
        }

        tabuleiroJogador.registraPosicoesOcupadas(navio.getPosicoesOcupadas());
        return navio;
    }

    public void limparJogadas(){
        jogadas.clear();
    }

    public Tabuleiro getTabuleiro() {
        return tabuleiroJogador;
    }
    
    public List<String> getJogadas(){
        return this.jogadas;
    }

}
