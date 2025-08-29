package domain;

import domain.comestiveis.Cereja;
import domain.comestiveis.Pontinhos;
import domain.comestiveis.PowerUp;
import domain.entidades.Fantasma;
import domain.entidades.PacMan;

import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.Scanner;
import static domain.Constantes.*;

public class Mapa {
    private final List<Cereja> primordial_cerejas_list = new LinkedList<>();
    private final List<Parede> primordial_paredes_list = new LinkedList<>();
    private final List<PacMan> primordial_pacmans_list = new LinkedList<>();
    private final List<Pontinhos> primordial_pontinhos_list = new LinkedList<>();
    private final List<Fantasma> primordial_fantasmas_list = new LinkedList<>();
    private  List<Cereja> cerejas_list = new LinkedList<>();
    private  List<Parede> paredes_list = new LinkedList<>();
    private  List<Fantasma> fantasmas_list = new LinkedList<>();
    private  List<PacMan> pacmans_list = new LinkedList<>();
    private  List<Pontinhos> pontinhos_list = new LinkedList<>();
    private boolean valido;
    private final Random random = new Random();

    public Mapa(Scanner arquivo){
        if(retraduzMapa(arquivo)) {
            this.valido = true;
        } else {
            this.valido = false;
        }
    }

    public Mapa(List<Cereja> cerejas_list, List<Parede> paredes_list, List<Fantasma> fantasmas_list, List<PacMan> pacmans_list, List<Pontinhos> pontinhos_list){
        this.cerejas_list.addAll(cerejas_list);
        this.paredes_list.addAll(paredes_list);
        this.pacmans_list.addAll(pacmans_list);
        this.fantasmas_list.addAll(fantasmas_list);
        this.pontinhos_list.addAll(pontinhos_list);
    }

    private boolean retraduzMapa(Scanner arquivo){ //Pega o arquivo para transfoma-lo no mapa
        int num_linhas_reg = 0;
        while (arquivo.hasNext()){
            String[] linha = arquivo.nextLine().split("");
            if(linha.length != LARGURA){ //Se não possuir o número de colunas necessário, retorna falso
                return false;
            }
            for (int i = 0; i < linha.length; i++) {
                Ponto ponto = new Ponto(i*TAM_BLOCO, num_linhas_reg*TAM_BLOCO);
                if(!transformaCaractere(linha[i], ponto)) return false;
            }
            num_linhas_reg++;
        }
        return true;
    }

    private boolean transformaCaractere(String caractere, Ponto ponto){ //Transforma o caractere no determinado objeto
        switch (caractere){
            case CARACTERE_PACMAN1:
                PacMan pacman1 = new PacMan(ponto, IMAGEM_PACMAN_LEFT, TAM_BLOCO, TAM_BLOCO);
                pacmans_list.add(pacman1);
                primordial_pacmans_list.add(pacman1);
                return true;
//            case CARACTERE_PACMAN2:
//                PacMan pacman2 = new PacMan(ponto, IMAGEM_PACMAN_LEFT, TAM_BLOCO, TAM_BLOCO);
//                pacmans_list.add(pacman2);
//                return true;
            case CARACTERE_PAREDE:
                Parede parede = new Parede(ponto, IMAGEM_PAREDE, TAM_BLOCO, TAM_BLOCO);
                paredes_list.add(parede);
                primordial_paredes_list.add(parede);
                return true;
            case CARACTERE_CEREJA:
                Cereja cereja = new Cereja(ponto, IMAGEM_CEREJA, TAM_BLOCO, TAM_BLOCO);
                cerejas_list.add(cereja);
                primordial_cerejas_list.add(cereja);
                return true;
            case CARACTERE_PONTINHOS:
                ponto.setY(ponto.getY() + PONTINHO_FATOR_DE_CORRECAO_POS);
                ponto.setX(ponto.getX() + PONTINHO_FATOR_DE_CORRECAO_POS);
                Pontinhos pontinho = new Pontinhos(ponto, null, PONTINHO_DIMENSOES, PONTINHO_DIMENSOES);
                pontinhos_list.add(pontinho);
                primordial_pontinhos_list.add(pontinho);
                return true;
            case CARACTERE_NADA:
                return true;
            case CARACTERE_BLUE_GHOST:
                Fantasma fantasma_azul = new Fantasma(ponto, IMAGEM_FANTASMA_AZUL, TAM_BLOCO, TAM_BLOCO, DIRECOES_DISP[random.nextInt(DIRECOES_DISP.length)]);
                fantasmas_list.add(fantasma_azul);
                primordial_fantasmas_list.add(fantasma_azul);
                return true;
            case CARACTERE_ORANGE_GHOST:
                Fantasma fantasma_laranja = new Fantasma(ponto, IMAGEM_FANTASMA_LARANJA, TAM_BLOCO, TAM_BLOCO, DIRECOES_DISP[random.nextInt(DIRECOES_DISP.length)]);
                fantasmas_list.add(fantasma_laranja);
                primordial_fantasmas_list.add(fantasma_laranja);
                return true;
            case CARACTERE_PINK_GHOST:
                Fantasma fantasma_rosa = new Fantasma(ponto, IMAGEM_FANTASMA_ROSA, TAM_BLOCO, TAM_BLOCO, DIRECOES_DISP[random.nextInt(DIRECOES_DISP.length)]);
                fantasmas_list.add(fantasma_rosa);
                primordial_fantasmas_list.add(fantasma_rosa);
                return true;
            case CARACTERE_RED_GHOST:
                Fantasma fantasma_vermelho = new Fantasma(ponto, IMAGEM_FANTASMA_VERMELHO, TAM_BLOCO, TAM_BLOCO, DIRECOES_DISP[random.nextInt(DIRECOES_DISP.length)]);
                fantasmas_list.add(fantasma_vermelho);
                primordial_fantasmas_list.add(fantasma_vermelho);
                return true;
        }
        return false;
    }

    public List<PacMan> getPacmans_list(){
        return this.pacmans_list;
    }

    public List<Parede> getParedes_list(){
        return this.paredes_list;
    }

    public  List<Cereja> getCerejas_list(){
        return this.cerejas_list;
    }

    public List<Fantasma> getFantasmas_list(){
        return this.fantasmas_list;
    }
    public List<Pontinhos> getPontinhos_list(){
        return this.pontinhos_list;
    }

    public List<PacMan> getPrimordial_pacmans_list(){
        return this.primordial_pacmans_list;
    }

    public List<Parede> getPrimordial_paredes_list(){
        return this.primordial_paredes_list;
    }

    public  List<Cereja> getPrimordial_cerejas_list(){
        return this.primordial_cerejas_list;
    }

    public List<Fantasma> getPrimordial_fantasmas_list(){
        return this.primordial_fantasmas_list;
    }
    public List<Pontinhos> getPrimordial_pontinhos_list(){
        return this.primordial_pontinhos_list;
    }

}
