package domain;

import static domain.Constantes.*;

public class Ponto {
    private int x;
    private int y;
    private boolean ehValido;

    public Ponto(int x, int y) {
        if(!setX(x) || !setY(y)){
            this.ehValido = false;
        } else {
            this.ehValido = true;
        }
    }

    public int getX() { return this.x; }

    public boolean setX(int x) {
        if(x > LARGURA_TELA + TAM_BLOCO) return false;
        this.x = x;
        return true;
    }

    public boolean setY(int y) {
        if(y > LARGURA_TELA + TAM_BLOCO) return false;
        this.y = y;
        return true;
    }

    public int getY(){
        return this.y;
    }
}
