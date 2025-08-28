package domain.entidades;

import domain.ComponenteMapa;

import java.awt.*;

public class Entidade extends ComponenteMapa {
    private int x_atual;
    private int y_atual;
    private double velocidade;
    private String direcao;

    public Entidade(int x_inicial, int y_inicial, Image imagem){
        super(x_inicial, y_inicial, imagem);
    }
}
