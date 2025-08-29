package domain.comestiveis;

import domain.ComponenteMapa;
import domain.Ponto;

import java.awt.*;

public class Comestiveis extends ComponenteMapa {
    private int score_gerado;

    public Comestiveis(Ponto ponto, Image imagem, int score_gerado, int altura, int largura){
        super(ponto, imagem, altura, largura);
        this.score_gerado = score_gerado;
    }
}
