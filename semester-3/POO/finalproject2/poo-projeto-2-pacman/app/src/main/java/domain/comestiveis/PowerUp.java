package domain.comestiveis;

import domain.ComponenteMapa;
import domain.Mapa;
import domain.entidades.Entidade;
import domain.entidades.PacMan;

public interface PowerUp {
    void powerUp(PacMan entidade, Mapa mapa);
}
