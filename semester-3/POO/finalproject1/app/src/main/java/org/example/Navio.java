package org.example;

import java.util.ArrayList;
import java.util.List;

public class Navio {
    private int coluna;
    private int linha;
    private int tamanho;
    private String orientacao;

    public Navio(int coluna, int linha, int tamanho, String orientacao) {
        this.coluna = coluna;
        this.linha = linha;
        this.tamanho = tamanho;
        this.orientacao = orientacao;
    }

    public List<String> getPosicoesOcupadas(){
        List<String> posicoes = new ArrayList<>();
        int lin = linha,col = coluna;

        for(int i = 0; i < tamanho; i++){
            posicoes.add("(" + lin + "," + col + ")");

            if(orientacao.equalsIgnoreCase("horizontal")){
                col++;
            }else{
                lin++;
            }
        }
        return posicoes;
    }

    public int getColuna() {
        return coluna;
    }

    public int getLinha() {
        return linha;
    }

    public int getTamanho() {
        return tamanho;
    }

    public String getOrientacao() {
        return orientacao;
    }
}
