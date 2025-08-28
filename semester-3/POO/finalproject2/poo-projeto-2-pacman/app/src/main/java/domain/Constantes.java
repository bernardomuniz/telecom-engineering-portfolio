package domain;

import javax.swing.*;
import java.awt.*;
import java.io.IOException;
import java.util.Objects;

public final class Constantes {
    //Constantes da Interface Gráfica
    public static final String NOME_JOGO = "Pac-Man";
    public static final int NUM_LINHAS = 21;
    public static final int NUM_COLUNAS = 19;
    public static final int TAM_BLOCO = 32;
    public static final int LARGURA_TELA = NUM_COLUNAS * TAM_BLOCO;
    public static final int ALTURA_TELA = NUM_LINHAS * TAM_BLOCO;

    //Imagens da aplicação

    //Imagens do mapa
    public static final String NOME_ARQ_PAREDE = "./wall.png";
    public static final Image PAREDE = CapturaImagem(NOME_ARQ_PAREDE);
    //Imagens do fantasma
    public static final String NOME_ARQ_FANTASMA1 = "./orangeGhost.png";
    public static final String NOME_ARQ_FANTASMA2 = "./pinkGhost.png";
    public static final String NOME_ARQ_FANTASMA3 = "./redGhost.png";
    public static final Image FANTASMA1 = CapturaImagem(NOME_ARQ_FANTASMA1);
    public static final Image FANTASMA2 = CapturaImagem(NOME_ARQ_FANTASMA2);
    public static final Image FANTASMA3 = CapturaImagem(NOME_ARQ_FANTASMA3);

    //Imagens dos Pac-Mans
    public static final String NOME_ARQ_PACMAN_UP = "./pacmanUp.png";
    public static final String NOME_ARQ_PACMAN_LEFT = "./pacmanLeft.png";
    public static final String NOME_ARQ_PACMAN_RIGHT = "./pacmanRight.png";
    public static final String NOME_ARQ_PACMAN_DOWN = "./pacmanDown.png";
    public static final Image PACMAN_UP = CapturaImagem(NOME_ARQ_PACMAN_UP);
    public static final Image PACMAN_LEFT = CapturaImagem(NOME_ARQ_PACMAN_LEFT);
    public static final Image PACMAN_RIGHT = CapturaImagem(NOME_ARQ_PACMAN_RIGHT);
    public static final Image PACMAN_DOWN = CapturaImagem(NOME_ARQ_PACMAN_DOWN);

    //DEPOIS OLHAR COM CALMA
    //Captura a imagem de acordo com o nome arquivo
    private static Image CapturaImagem(String nome_arquivo) {
        return new ImageIcon(Objects.requireNonNull(Constantes.class.getClassLoader().getResource(nome_arquivo))).getImage();
    }
    private Constantes(){}
}