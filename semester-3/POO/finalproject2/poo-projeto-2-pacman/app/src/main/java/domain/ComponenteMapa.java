package domain;

import java.awt.*;
import static domain.Constantes.*;

public abstract class ComponenteMapa {
    private final Ponto ponto_origem;
    protected Ponto ponto_atual;
    private final int altura;
    private final int largura;
    protected Image imagem;

    public ComponenteMapa(int x_inicial, int y_inicial, Image imagem, int altura, int largura){
        this.ponto_origem = new Ponto(x_inicial, y_inicial);
        this.ponto_atual = new Ponto(x_inicial, y_inicial);
        this.imagem = imagem;
        this.altura = altura;
        this.largura = largura;
    }

    public ComponenteMapa(Ponto ponto, Image imagem, int altura, int largura){
        this.ponto_origem = new Ponto(ponto.getX(), ponto.getY());
        this.ponto_atual = new Ponto(ponto.getX(), ponto.getY());
        this.imagem = imagem;
        this.altura = altura;
        this.largura = largura;
    }

    public void setImagem(Image imagem) {
        this.imagem = imagem;
    }

    public Ponto getPontoOrigem(){
        return this.ponto_origem;
    }

    public int getAltura(){
        return this.altura;
    }

    public int getLargura(){
        return this.largura;
    }

    public Image getImage(){
        return this.imagem;
    }

    public Ponto getPosicaoAtual(){
        return this.ponto_atual;
    }

}
