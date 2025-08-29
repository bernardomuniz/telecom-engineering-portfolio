package domain.entidades;

import domain.Parede;
import ifsc.poo.PacManGame;

import java.util.List;

import static domain.Constantes.*;

public class Velocidade {
    private int velocidade_passo;      //velocidade com que se move pelo mapa
    private int velocidade_x; //velocidade no eixo x
    private int velocidade_y; //velocidade no eixo y
    private String direcao;   //U => Cima, D => Baixo, L => Esquerda, R => Direita, "" => Parado

    public Velocidade(int velocidade_passo, String direcao){ //Velocidade inicial de qualquer entidade
        setVelocidadePasso(velocidade_passo);
        this.velocidade_x = 0;
        this.velocidade_y = 0;
    }

    public void setVelocidadePasso(int velocidade){
        if(velocidade < 0) return;                         //Apenas não permitindo velocidades negativas
        this.velocidade_passo = velocidade;
    }

    private void setVelocidade_x(int velocidade_x){
        this.velocidade_x = velocidade_x;
    }

    private void setVelocidade_y(int velocidade_y){
        this.velocidade_y = velocidade_y;
    }

    public int getVelocidade_passo() {
        return this.velocidade_passo;
    }

    public int getVelocidade_x() {
        return this.velocidade_x;
    }

    public int getVelocidade_y() {
        return this.velocidade_y;
    }

    public void inicializaDirecao(String direcao){
        this.direcao = direcao;
    }


    public String getDirecao() {
        return this.direcao;
    }

    public void setDirecao(Entidade entidade,String direcao, List<Parede> paredes){ //Garanto que os caracteres que chegarem serão válidos
        String direcao_anterior = this.direcao;
        this.direcao = direcao;
        atualizaVelocidade(direcao);
        entidade.incrementaPosicaoAtual(this.velocidade_x, this.velocidade_y);
        for (int i = 0; i < paredes.size(); i++) {
            if(entidade.detectaColisao(entidade, paredes.get(i))){
                entidade.incrementaPosicaoAtual(-this.velocidade_x, -this.velocidade_y);
                this.direcao = direcao_anterior;
                atualizaVelocidade(direcao_anterior);
            }
        }
    }

//    void updateDirection(char direction) { //Implementado no novo código
//        char prevDirection = this.direction;
//        this.direction = direction;
//        updateVelocity();
//        this.x += this.velocityX;
//        this.y += this.velocityY;
//        for (PacManGame.Block wall : walls) {
//            if (detectCollision(this, wall)) {
//                this.x -= this.velocityX;
//                this.y -= this.velocityY;
//                this.direction = prevDirection;
//                updateVelocity();
//            }
//        }
//    }

    public void atualizaVelocidade(String direcao){
        switch (direcao){
            case UP:
                this.velocidade_x = 0;
                this.velocidade_y = -getVelocidade_passo();
                break;
            case DOWN:
                this.velocidade_x = 0;
                this.velocidade_y = getVelocidade_passo();
                break;
            case LEFT:
                this.velocidade_y = 0;
                this.velocidade_x = -getVelocidade_passo();
                break;
            case RIGHT:
                this.velocidade_y = 0;
                this.velocidade_x = getVelocidade_passo();
                break;
        }
    }

    public void parar(){
        this.velocidade_x = 0;
        this.velocidade_y = 0;
    }
}
