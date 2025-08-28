package org.example;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Tabuleiro {
    final int pixel = 40;
    private int posX, posY;
    private final String [] CARACTERES_LEGENDA = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J"}, NUMEROS_LEGENDA = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
    static final int TAMANHO_LINHAS_COLUNAS = 10;
    final private List<String> posicoesOcupadasPorNavios = new LinkedList<>();
    private Map<Navio, List<String>> navios = new LinkedHashMap<>();


    public Tabuleiro(int x, int y){
        if (x < 0 || y < 0) {
            System.out.println("Coordenadas inválidas");
            System.exit(1);
        }else{
            this.posX = x;
            this.posY = y;

        }
    }

    public void addNAvio(Navio navio){
        navios.put(navio, navio.getPosicoesOcupadas());
    }

    public boolean verificaNaviosDestruidos(){
        return posicoesOcupadasPorNavios.isEmpty();
    }

    public boolean podePosicionarNavio(Navio navio, boolean mensagemDeErro){
        if (!validaOrientacao(navio.getOrientacao(), mensagemDeErro)) return false;
        if (!validaPosicao(navio.getLinha(), navio.getColuna(), mensagemDeErro)) return false;
        if (!validaPosicionamentoNavio(navio, mensagemDeErro)) return false;
        if (verificaSobreposicao(navio.getPosicoesOcupadas(), mensagemDeErro)) return false;
        return true;

    }

    public boolean validaOrientacao(String orientacao, boolean mensagemDeErro) {

        boolean valida = orientacao != null && (orientacao.equalsIgnoreCase("horizontal") || orientacao.equalsIgnoreCase("vertical"));

        if (!valida && mensagemDeErro) {
            System.out.println("Orientação inválida!");
        }

        return valida;

    }

    public boolean verificaSobreposicao(List<String> posicoes, boolean mensagemDeErro) {
        for (String s : posicoesOcupadasPorNavios) {
            if (posicoes.contains(s)) {
                if (mensagemDeErro) {
                    System.out.println("Navios sobrepostos!");
                }
                return true;
            }
        }
        return false; 
    }


    public boolean validaPosicionamentoNavio (Navio navio, boolean mensagemDeErro) {
        boolean valida;
        if(navio.getOrientacao().equalsIgnoreCase("horizontal")){
            valida = navio.getTamanho() + navio.getColuna() <= TAMANHO_LINHAS_COLUNAS;
            if(!valida && mensagemDeErro){
                System.out.println("Navio não cabe no tabuleiro!");
            }
            return valida;

        }else if(navio.getOrientacao().equalsIgnoreCase("vertical")){
            valida = navio.getTamanho() + navio.getLinha() <= TAMANHO_LINHAS_COLUNAS;
            if(!valida && mensagemDeErro){
                System.out.println("Navio não cabe no tabuleiro!");
            }
            return valida;
        }
        return false;
    }

    public boolean validaPosicao(int linha, int coluna, boolean mensagemDeErro) {
        boolean valida = ((0 <= linha && linha <= 9) && (0 <= coluna && coluna <= 9));

        if(!valida && mensagemDeErro) {
            System.out.println("Posição não existe no tabuleiro!");
        }

        return valida;
        
    }

    public void registraPosicoesOcupadas(List<String> posicoes){
        for(String pos : posicoes){
            posicoesOcupadasPorNavios.add(pos);
        }
    }

    public void decrementaNavio(String disparo){
        for (Map.Entry<Navio, List<String>> entry : navios.entrySet()) {
            Navio navio = entry.getKey();
            List<String> posicoesOcupadas = entry.getValue();

            if (posicoesOcupadas.contains(disparo)) {
                posicoesOcupadas.remove(disparo);

                if (posicoesOcupadas.isEmpty()) {
                    System.out.println("Navio foi afundado!");
                }
            }
        }
    }

    public boolean acertouNavio(String disparo, String nome, int linha, int coluna){
        if(posicoesOcupadasPorNavios.contains(disparo)){
            posicoesOcupadasPorNavios.remove(disparo);
            decrementaNavio(disparo);
            System.out.println(">> " + nome + " acertou navio na posicao: " + CARACTERES_LEGENDA[linha] + coluna + "!");
            return true;
        }else{
            System.out.println("Erro de tiro! Nenhum navio encontrado na posição " + CARACTERES_LEGENDA[linha] + coluna + ".");
            return false;
        }
    }


    static int traduzLinha(String linha){
        linha = linha.toLowerCase();
        int l = switch(linha){
            case "a" -> 0;
            case  "b"-> 1;
            case "c"-> 2;
            case "d"->3;
            case  "e"->4;
            case  "f"->5;
            case  "g"->6;
            case  "h"->7;
            case  "i"->8;
            case  "j"->9;
            default-> -1;
        };
        return l;
    }

    static String formataPosicao(int linha, int coluna){
        return "(" + linha + "," + coluna + ")";
    }

    public int getPosX(){
        return this.posX;
    }


    public int getPosY(){
        return this.posY;
    }


    public int getPixel(){
        return this.pixel;
    }

    public String[] getCaracteresLegenda(){
        return CARACTERES_LEGENDA;
    }

    public String[] getNumerosLegenda(){
        return NUMEROS_LEGENDA;
    }

    public List<String> getPosicoesOcupadas(){
        return posicoesOcupadasPorNavios;
    }
}
