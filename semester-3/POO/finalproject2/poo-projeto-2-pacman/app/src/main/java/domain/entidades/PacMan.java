package domain.entidades;

import domain.Mapa;
import domain.Parede;
import domain.Ponto;
import domain.comestiveis.Comestiveis;
import ifsc.poo.PacManGame;

import java.awt.*;
import static domain.Constantes.*;

public class PacMan extends Entidade implements Comer {
    private boolean mortal;          //Dita se ele pode morrer ou viver
    private int qtd_vidas;           //Dita a quantidade de vidas disponíveis do PacMan

    public PacMan(Ponto ponto, Image imagem, int altura, int largura){
        super(ponto, imagem, VELOCIDADE, altura, largura);
        this.qtd_vidas = QTD_VIDAS;
        this.mortal = true;
    }

    public void setMortal(boolean mortalidade){
        this.mortal = mortalidade;
    }

    public void setQtd_vidas(int qtd_vidas){
        this.qtd_vidas = qtd_vidas;
    }

    public boolean getMortal(){
        return this.mortal;
    }

    public int getQtd_vidas(){
        return this.qtd_vidas;
    }

    public void wrapAround(){
        //Quando chegar no limite inicial do eixo x é teletransportado para o final do mapa
        if (this.ponto_atual.getX() == 0){
            this.ponto_atual.setX(LARGURA_TELA);
            //Quuando chegar no limite final do eixo x é teletransportado para o inicio do mapaa
        } else if (this.ponto_atual.getX() == LARGURA_TELA) {
            this.ponto_atual.setX(0);
        }else if (this.ponto_atual.getY() == 0){ //Mesma ideia para o eixo y
            this.ponto_atual.setY(ALTURA_TELA);
        }else if (this.ponto_atual.getY() == ALTURA_TELA) {
            this.ponto_atual.setY(0);
        }
    }

    @Override
    public void mover(String direcao, Mapa mapa){ //Depois colocar um if para ver se este pode mudar a sua direção!

        for (int i = 0; i < mapa.getParedes_list().size(); i++) {
            Parede parede = mapa.getParedes_list().get(i);

        }

    }

    @Override
    public void comer(Comestiveis comestivel){ //Ainda não implementado!

    }
}
