package ifsc.poo;

import java.util.LinkedList;
import java.util.List;

import edu.princeton.cs.algs4.DrawListener;
import static ifsc.poo.Constantes.CORES_FIGURAS;
import static ifsc.poo.Constantes.C_KEY;
import static ifsc.poo.Constantes.DOWN_KEY;
import static ifsc.poo.Constantes.F1_KEY;
import static ifsc.poo.Constantes.F2_KEY;
import static ifsc.poo.Constantes.F3_KEY;
import static ifsc.poo.Constantes.F4_KEY;
import static ifsc.poo.Constantes.F5_KEY;
import static ifsc.poo.Constantes.F6_KEY;
import static ifsc.poo.Constantes.F7_KEY;
import static ifsc.poo.Constantes.F8_KEY;
import static ifsc.poo.Constantes.F_KEY;
import static ifsc.poo.Constantes.LEFT_KEY;
import static ifsc.poo.Constantes.P_KEY;
import static ifsc.poo.Constantes.Q_KEY;
import static ifsc.poo.Constantes.RIGHT_KEY;
import static ifsc.poo.Constantes.TAMANHO_MAX;
import static ifsc.poo.Constantes.TAMANHO_MIN;
import static ifsc.poo.Constantes.UP_KEY;
import static ifsc.poo.Constantes.W_KEY;
import ifsc.poo.figuras.Circulo;
import ifsc.poo.figuras.Hexagono;
import ifsc.poo.figuras.Pentagono;
import ifsc.poo.figuras.Quadrado;


public class Desenhista implements DrawListener{

    private Canvas canva;

    private int tamanhoInicial = 50, indexCor = 0, indexFigura = -1;
    
    private List<ObjetoDeDesenho> figuras = new LinkedList<>();
    private boolean preenchido = false;
    private Estatistica e = new Estatistica();

    public Desenhista(Canvas c){
        this.canva = c;
        c.desenharTela();
        c.draw.addListener(this);
    }
    
    //Aqui eu utilizei polimorfismo, pois o mesmo objeto de desenho pode ser diferentes tipos de figuras geométricas
    public void mousePressed(double x, double y) {

        if(indexFigura == -1){
            System.out.println("Tipo de figura inválido! Por favor, selecione uma figura.");
            return;
        }

        ObjetoDeDesenho figura = null;

        switch(indexFigura){
            case 0 : 
                figura = new Circulo(tamanhoInicial, new Ponto(x, y), CORES_FIGURAS[indexCor], preenchido); 
                break;
            case 1: 
                figura = new Quadrado(tamanhoInicial, new Ponto(x, y), CORES_FIGURAS[indexCor], preenchido);
                break;
            case 2: 
                figura = new Pentagono(tamanhoInicial, new Ponto(x, y), CORES_FIGURAS[indexCor], preenchido);
                break;
            case 3: 
                figura = new Hexagono(tamanhoInicial, new Ponto(x, y), CORES_FIGURAS[indexCor], preenchido);
                break;
        }
        if(figura != null){
            figuras.add(figura);
            figura.desenhar(canva);
        }
    }

    @Override
    public void keyPressed(int tecla){
        switch(tecla){
            case F1_KEY: //F1
                System.out.println("Figura: Círculo");
                indexFigura = 0;
                break;
            case F2_KEY: //F2
                System.out.println("Figura: Quadrado");
                indexFigura = 1;
                break;
            case F3_KEY: //F3
                System.out.println("Figura: Pentágono");
                indexFigura = 2;
                break;
            case F4_KEY: //F4
                System.out.println("Figura: Hexágono");
                indexFigura = 3;
                break;
            case F5_KEY: //F5
                indexCor = 0;
                System.out.println("Cor: Preto");
                break;
            case F6_KEY: //F6
                indexCor = 1;
                System.out.println("Cor: Vermelho");
                break;
            case F7_KEY: //F7
                indexCor = 2;
                System.out.println("Cor: Azul");
                break;
            case F8_KEY: //F8
                indexCor = 3;
                System.out.println("Cor: Verde");
                break;
            case F_KEY: //F
                preenchido = !preenchido;

                if(preenchido){
                    System.out.println("Com preenchimento");
                }else{
                    System.out.println("Sem preenchimento");
                }
                break;
            case Q_KEY: //Q - AUMENTA A FIGURA DE TAMANHO
                if(tamanhoInicial < TAMANHO_MAX){
                    tamanhoInicial += 10;
                    System.out.println("Tamanho: " + tamanhoInicial);
                }
                break;
            case W_KEY: //W - DIMINUI A FIGURA DE TAMANHO
                if(tamanhoInicial > TAMANHO_MIN){
                    tamanhoInicial -= 10;
                    System.out.println("Tamanho: " + tamanhoInicial);
                }
                break;
            case C_KEY: //C - LIMPA A TELA
                figuras.clear();
                canva.limparTela();
                break;
            case P_KEY: //P - VER ESTATÍSTICAS
                System.out.println(e.verEstatisticas(figuras));
                break;
            case UP_KEY: //UP - SETA PARA CIMA
                moverFiguras(0,20);
                break;
            case DOWN_KEY: //DOWN - SETA PARA BAIXO
                moverFiguras(0,-20);
                break;
            case LEFT_KEY: //LEFT - SETA PARA A ESQUERDA
                moverFiguras(-20,0);
                break;
            case RIGHT_KEY: //RIGHT - SETA PARA A DIREITA
                moverFiguras(20,0);
                break;
            default:
                System.out.println("Tecla inválida!");
        }
    }

    public void moverFiguras(double x, double y){
        for( ObjetoDeDesenho figura: figuras){
           figura.seMover(x, y);
        }
        canva.limparTela();
        for( ObjetoDeDesenho figura: figuras){
            figura.desenhar(canva);
        }
    }


}
