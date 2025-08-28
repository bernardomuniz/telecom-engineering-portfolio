package org.example;

import java.util.LinkedList;
import java.util.List;

public class Gerenciador {
    static List<Jogador> jogadores = new LinkedList<>();
    Partida partida;

    public Gerenciador(Partida partida) {
        this.partida = partida;
    }

    public void adicionarJogador(Jogador jogador) {
        jogadores.add(jogador);
    }

    public void verEstatisticas() {
        jogadores.sort((j1, j2) -> Integer.compare(j2.getVitorias(), j1.getVitorias()));

        System.out.println("\n==============================================");
        System.out.println("            ESTATÍSTICAS DA PARTIDA           ");
        System.out.println("==============================================");
        System.out.printf ("| %-20s │ %-10s |\n", "Jogador", "Vitórias");
        System.out.println("==============================================");

        for (Jogador jogador : jogadores) {
            System.out.printf ("| %-20s │ %10d |\n", jogador.getNome(), jogador.getVitorias());
        }

        System.out.println("==============================================");
        System.out.printf ("| Mais vitórias: %-20s %3d     |\n", jogadores.getFirst().getNome(), jogadores.getFirst().getVitorias());
        System.out.printf ("| Partidas jogadas: %20d     |\n", partida.getQtdpartida());
        System.out.println("==============================================\n");
    }




}
