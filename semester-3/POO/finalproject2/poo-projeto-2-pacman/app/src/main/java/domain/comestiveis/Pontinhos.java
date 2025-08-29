package domain.comestiveis;

import domain.Ponto;

import java.awt.*;

import static domain.Constantes.*;

public class Pontinhos extends Comestiveis {

    public Pontinhos(Ponto ponto, Image imagem, int altura, int largura){
        super(ponto, imagem, PONTO_SCORE, altura, largura);
    }
}
