package domain;

import java.awt.*;
import static domain.Constantes.*;


public class Parede extends ComponenteMapa {
    private int x;
    private int y;
    private int altura;
    private int largura;

    public Parede(int x, int y, int altura, int largura){
        super(x, y, IMAGEM_PAREDE, altura, largura);
    }

    public Parede(Ponto ponto, Image imagem, int altura, int largura){
        super(ponto, imagem, altura, largura);
    }
}
