package ifsc.poo.figuras;
import java.awt.Color;

import ifsc.poo.Canvas;
import ifsc.poo.ObjetoDeDesenho;
import ifsc.poo.Ponto;

public class Quadrado extends ObjetoDeDesenho{
    private double lado;

    public Quadrado(double lado,Ponto ponto, Color cor, boolean preenchido){
        super(ponto, cor, preenchido);
        this.lado = lado;
    }

    @Override
    public void desenhar(Canvas canva){
        double x = getPonto().getX();
        double y = getPonto().getY();
        if(this.ehPreenchido()){
            canva.draw.setPenColor(Color.BLACK);
            canva.draw.filledSquare(x, y, lado);
            canva.draw.setPenColor(this.getCor());
            canva.draw.filledSquare(x, y, lado * 0.96);
        }else{
            canva.draw.setPenColor(this.getCor());
            canva.draw.square(x, y, lado);
        }
        canva.draw.show();
    }

    @Override
    public double calcularArea(){
        return Math.pow(lado, 2);
    }

    @Override
    public double calcularPerimetro(){
        return 4*lado;
    }

}
