package domain.comestiveis;

import domain.ComponenteMapa;
import domain.Mapa;
import domain.Ponto;
import domain.entidades.Entidade;
import domain.entidades.PacMan;
import ifsc.poo.PacManGame;
import org.checkerframework.checker.units.qual.A;

import static domain.Constantes.*;

import java.awt.*;
import java.util.concurrent.TimeUnit;

public class Cereja extends Comestiveis implements PowerUp {

    public Cereja(Ponto ponto, Image imagem, int altura, int largura){
        super(ponto, imagem, CEREJA_SCORE, altura, largura);
    }
    @Override
    public void powerUp(PacMan pac_man, Mapa mapa){
        if(pac_man.getMortal()){ //Se até o momento é mortal
            pac_man.setMortal(false);
            for (int i = 0; i < mapa.getFantasmas_list().size(); i++) {
                mapa.getFantasmas_list().get(i).setImagem(IMAGEM_FANTASMA_ASSUSTADO);
            }
        } else {

        }
    }
}

