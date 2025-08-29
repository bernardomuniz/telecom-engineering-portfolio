package domain.entidades;

import domain.ComponenteMapa;
import domain.Mapa;
import domain.Parede;
import domain.Ponto;

import java.util.List;

import static domain.Constantes.*;

import java.awt.*;

//Entidade seria como os "seres vivos" do jogo, são objetos que se comportam e principalmente, se movimentam pelo mapa
public class Entidade extends ComponenteMapa implements Mover {
    private Velocidade velocidade; //Determina a velocidade atual

    public Entidade(int x_inicial, int y_inicial, Image imagem, int velocidade, int altura, int largura){
        super(x_inicial, y_inicial, imagem, altura, largura);
        this.velocidade = new Velocidade(velocidade, PARADO);        //Atribuindo velocidade, apesar de no jogo todos possuírem a mesma velocidade, faço isso para possíveis alterações onde seja interessante terem entidades em velocidades diferentes
    }

    public Entidade(Ponto ponto, Image imagem, int velocidade, int altura, int largura){
        super(ponto, imagem, altura, largura);
        this.velocidade = new Velocidade(velocidade, PARADO);        //Atribuindo velocidade, apesar de no jogo todos possuírem a mesma velocidade, faço isso para possíveis alterações onde seja interessante terem entidades em velocidades diferentes
    }

    public void setPosicaoAtual(int x, int y){
        this.ponto_atual = new Ponto(x, y);
    }

    public void incrementaPosicaoAtual(int x, int y){
//        Ponto ponto = this.ponto_atual;
//        ponto.setX(ponto.getX() + x);
//        ponto.setY(ponto.getY() + y);
//        this.ponto_atual = ponto;
        this.ponto_atual.setX(ponto_atual.getX() + x);
        this.ponto_atual.setY(ponto_atual.getY() + y);
    }

    public void setPosicaoAtual(Ponto ponto){
        this.ponto_atual = new Ponto(ponto.getX(), ponto.getY());
    }

    public Velocidade getVelocidade(){
        return this.velocidade;
    }


    public boolean detectaColisao(ComponenteMapa algo1, ComponenteMapa algo2){
        return algo1.getPosicaoAtual().getX() < algo2.getPosicaoAtual().getX() + algo2.getLargura() && //Topo esquerdo de algo 1 toca topo direito do algo 2
               algo1.getPosicaoAtual().getX() + algo1.getLargura() > algo2.getPosicaoAtual().getX() && //Topo direito de algo 1 toca topo esquerdo do algo 2
               algo1.getPosicaoAtual().getY() < algo2.getPosicaoAtual().getY() + algo2.getAltura() && //Topo esquerdo de algo 1 toca canto inferior esquerdo do algo 2
               algo1.getPosicaoAtual().getY() + algo1.getAltura() > algo2.getPosicaoAtual().getY(); //Canto inferior esquerdo de algo 1 toca canto inferior direito do algo 2
    }
    @Override
    public void mover(String direcao, Mapa mapa){}
}
