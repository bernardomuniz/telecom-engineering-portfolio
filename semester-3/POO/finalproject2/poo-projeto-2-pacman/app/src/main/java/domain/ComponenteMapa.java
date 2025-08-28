package domain;

import java.awt.*;
import static domain.Constantes.*;

public abstract class ComponenteMapa {
    private int x_inicial; //Posição adiquirida de acordo com o arquivo que descreve o mapa
    private int y_inicial; //Posição adiquirida de acordo com o arquivo que descreve o mapa
    private final static int altura = TAM_BLOCO;
    private final static int largura = TAM_BLOCO;
    private Image imagem;

    public ComponenteMapa(int x_inicial, int y_inicial, Image imagem){
        this.x_inicial = x_inicial;
        this.y_inicial = y_inicial;
        this.imagem = imagem;
    }
}
