package org.example;
import java.awt.Color;

import edu.princeton.cs.algs4.Draw;

public class Interface {
    Draw draw;

    public Interface() {
        this.draw = new Draw();
        this.draw.setDefaultCloseOperation(javax.swing.JFrame.EXIT_ON_CLOSE);
        this.draw.setCanvasSize(1000, 600);
        this.draw.setXscale(0,1000);
        this.draw.setYscale(0,600);
    }

    public void desenhaTabuleiro(Tabuleiro tabuleiro){
        int posX = tabuleiro.getPosX(), posY = tabuleiro.getPosY(), pixel = tabuleiro.getPixel(), linhas = Tabuleiro.TAMANHO_LINHAS_COLUNAS, colunas = Tabuleiro.TAMANHO_LINHAS_COLUNAS;
        String [] legendaNumeros = tabuleiro.getNumerosLegenda(), legendaCaracteres = tabuleiro.getCaracteresLegenda();

        draw.setPenColor(Color.RED);
        for (int j = 0; j < legendaNumeros.length; j++) {
            draw.text(40 + j * pixel + posX, posY + 12, legendaNumeros[j]);
        }

        for (int i = 0; i < linhas; i++) {
            draw.setPenColor(Color.RED);
            draw.text(posX + 12, 45 + i * pixel + posY, legendaCaracteres[i]);

            for (int j = 0; j < colunas; j++) {
                draw.setPenColor(Color.BLACK);
                draw.square(40 + j * pixel + posX, 45 + i * pixel + posY,pixel/2.0);
            }
        }
    }

    //Só desenha se a posição for válida, se o navio couber no posicinamento e se não houver sobreposição de navios ao realizar uma nova jogada
    public void desenhaNavios(Navio navio, Tabuleiro tabuleiro){
        this.draw.setPenColor(Draw .BOOK_RED);

        int coluna = navio.getColuna(), linha = navio.getLinha();
        String orientacao = navio.getOrientacao();

        
        for (int i = 0; i < navio.getTamanho(); i++) {
            int x = 40 + coluna * tabuleiro.getPixel() + tabuleiro.getPosX();
            int y = 45 + linha * tabuleiro.getPixel() + tabuleiro.getPosY();
            draw.filledSquare(x, y, (double) tabuleiro.getPixel()/2);

            if (orientacao.equalsIgnoreCase("Horizontal")){
                coluna++;
            }else {
                linha++;
            }
        }
        
    }

    public void desenhaAcertoDeTiro(int linha, int coluna, Tabuleiro tabuleiro){
        this.draw.setPenColor(Color .BLACK);
        int x = 40 + coluna * tabuleiro.getPixel() + tabuleiro.getPosX();
        int y = 45 + linha * tabuleiro.getPixel() + tabuleiro.getPosY();

        draw.filledEllipse(x , y, (double)tabuleiro.getPixel()/2, (double)tabuleiro.getPixel()/2);
    }

    public void desenhaErroDeTiro(int linha, int coluna, Tabuleiro tabuleiro){
        this.draw.setPenColor(Draw .BOOK_BLUE);

        int x = 40 + coluna * tabuleiro.getPixel() + tabuleiro.getPosX();
        int y = 45 + linha * tabuleiro.getPixel() + tabuleiro.getPosY();

        draw.filledEllipse(x , y, (double)tabuleiro.getPixel()/2, (double)tabuleiro.getPixel()/2);
    }

    public void desenhaTituloDoTabuleiro(String titulo, Tabuleiro tabuleiro) {
        int posX = tabuleiro.getPosX();
        int pixel = tabuleiro.getPixel();
        int larguraTabuleiro = Tabuleiro.TAMANHO_LINHAS_COLUNAS * pixel;

        int centroX = posX + larguraTabuleiro / 2;
        int tituloY = tabuleiro.getPosY() + pixel * Tabuleiro.TAMANHO_LINHAS_COLUNAS + 40;

        draw.setPenColor(Color.BLACK);
        draw.text(centroX, tituloY, titulo);
    }


    public void limparTabuleiro(Tabuleiro tabuleiro){
        this.draw.clear(Color.WHITE);
        tabuleiro.getPosicoesOcupadas().clear();
    }
                
            
}
        

    
    
