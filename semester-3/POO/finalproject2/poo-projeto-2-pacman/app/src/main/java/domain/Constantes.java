package domain;

import javax.swing.*;
import java.awt.*;
import java.util.Objects;

public final class Constantes {
    //Constantes da Interface Gráfica
    public static final String NOME_JOGO = "Pac-Man";
    public static final int NUM_LINHAS = 21;
    public static final int NUM_COLUNAS = 19;
    public static final int TAM_BLOCO = 32;
    public static final int LARGURA_TELA = NUM_COLUNAS * TAM_BLOCO;
    public static final int ALTURA_TELA = NUM_LINHAS * TAM_BLOCO + TAM_BLOCO;
    public static final Color COR_FUNDO = Color.BLACK;

    //Imagens da aplicação

    //Atributos do mapa
    public static final String NOME_ARQ_PAREDE = "./wall.png";
    public static final Image IMAGEM_PAREDE = CapturaImagem(NOME_ARQ_PAREDE);
    public static final int ALTURA = 21;
    public static final int LARGURA = 19;
    public static final String CARACTERE_RED_GHOST = "r";
    public static final String CARACTERE_BLUE_GHOST = "b";
    public static final String CARACTERE_PINK_GHOST = "p";
    public static final String CARACTERE_ORANGE_GHOST = "o";
    public static final String CARACTERE_PACMAN1 = "P";
    public static final String CARACTERE_PACMAN2 = "M";
    public static final String CARACTERE_PAREDE = "X";
    public static final String CARACTERE_CEREJA = "c";
    public static final String CARACTERE_PONTINHOS = " ";
    public static final String CARACTERE_NADA = "O";

    //Imagens do fantasma
    public static final String NOME_ARQ_FANTASMA_LARANJA = "./orangeGhost.png";
    public static final String NOME_ARQ_FANTASMA_ROSA = "./pinkGhost.png";
    public static final String NOME_ARQ_FANTASMA_VERMELHO = "./redGhost.png";
    public static final String NOME_ARQ_FANTASMA_AZUL = "./blueGhost.png";
    public static final String NOME_ARQ_FANTASMA_ASSUSTADO = "./scaredGhost.png";
    public static final Image IMAGEM_FANTASMA_LARANJA = CapturaImagem(NOME_ARQ_FANTASMA_LARANJA);
    public static final Image IMAGEM_FANTASMA_ROSA = CapturaImagem(NOME_ARQ_FANTASMA_ROSA);
    public static final Image IMAGEM_FANTASMA_VERMELHO = CapturaImagem(NOME_ARQ_FANTASMA_VERMELHO);
    public static final Image IMAGEM_FANTASMA_AZUL = CapturaImagem(NOME_ARQ_FANTASMA_AZUL);
    public static final Image IMAGEM_FANTASMA_ASSUSTADO = CapturaImagem(NOME_ARQ_FANTASMA_ASSUSTADO);

    //Imagens dos Pac-Mans
    public static final String NOME_ARQ_PACMAN_UP = "./pacmanUp.png";
    public static final String NOME_ARQ_PACMAN_LEFT = "./pacmanLeft.png";
    public static final String NOME_ARQ_PACMAN_RIGHT = "./pacmanRight.png";
    public static final String NOME_ARQ_PACMAN_DOWN = "./pacmanDown.png";
    public static final Image IMAGEM_PACMAN_UP = CapturaImagem(NOME_ARQ_PACMAN_UP);
    public static final Image IMAGEM_PACMAN_LEFT = CapturaImagem(NOME_ARQ_PACMAN_LEFT);
    public static final Image IMAGEM_PACMAN_RIGHT = CapturaImagem(NOME_ARQ_PACMAN_RIGHT);
    public static final Image IMAGEM_PACMAN_DOWN = CapturaImagem(NOME_ARQ_PACMAN_DOWN);

    //Atributos de entidades
    public static final int VELOCIDADE = TAM_BLOCO / 4;
    public static final String UP = "U";
    public static final String DOWN = "D";
    public static final String LEFT = "L";
    public static final String RIGHT = "R";
    public static final String PARADO = "";
    public static final String[] DIRECOES_DISP = {UP, DOWN, LEFT, RIGHT};

    //Atributos do PacMan
    public static final int QTD_VIDAS = 3;

    //Atributos de comestiveis
    public static final String NOME_CEREJA = "./cherry.png";
    public static final Image IMAGEM_CEREJA = CapturaImagem(NOME_CEREJA);
    public static final int PONTO_SCORE = 10;
    public static final int PONTINHO_FATOR_DE_CORRECAO_POS = 14;
    public static final int PONTINHO_DIMENSOES = 4;
    public static final int CEREJA_SCORE = 50;
    public static final int TEMPO_DURACAO_POWERUP_CEREJA = 10;

    //Configurações
    public static final String COOP = "coop";

    //DEPOIS OLHAR COM CALMA
    //Captura a imagem de acordo com o nome arquivo
    private static Image CapturaImagem(String nome_arquivo) {
        return new ImageIcon(Objects.requireNonNull(Constantes.class.getClassLoader().getResource(nome_arquivo))).getImage();
    }
    private Constantes(){}
}