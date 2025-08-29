package ifsc.poo;

import domain.InterfaceGrafica;
import domain.Jogo;
import domain.Mapa;

import java.util.Objects;
import java.util.Scanner;
import static domain.Constantes.*;


public class App {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(Objects.requireNonNull(App.class.getClassLoader().getResourceAsStream("mapa.txt")));
        Mapa mapa = new Mapa(entrada);
        InterfaceGrafica interfaceGrafica = new InterfaceGrafica();
        Jogo jogo;
        try {
            jogo = new Jogo(interfaceGrafica, mapa, ehCoop(args[0])); //Multiplayer
        } catch (java.lang.ArrayIndexOutOfBoundsException e){ //Try catch pra facilitar a verificação se há ao menos um argumento como parâmetro
            jogo = new Jogo(interfaceGrafica, mapa, false);//Singleplayer
        }
        jogo.iniciaJogo();
    }

    public static boolean ehCoop(String string){
        string = string.toLowerCase();
        return string.equals(COOP);
    }
}