package ifsc.poo.figuras;

import java.awt.Color;

import ifsc.poo.Canvas;
import ifsc.poo.ObjetoDeDesenho;
import ifsc.poo.Ponto;

public class Hexagono extends ObjetoDeDesenho{
    private double lado;

    public Hexagono(double lado, Ponto ponto, Color cor, boolean preenchido){
        super(ponto, cor, preenchido);
        this.lado = lado;
    }
        
    @Override
    public void desenhar(Canvas canva){
        double[] x = new double[6];
        double[] y = new double[6];

        for(int i = 0; i < 6; i++){
            x[i] = getPonto().getX() + lado * Math.cos(2 * Math.PI * i / 6);
            y[i] = getPonto().getY() + lado * Math.sin(2 * Math.PI * i / 6);
        }

        if(this.ehPreenchido()){
            canva.draw.setPenColor(Color.BLACK);
            canva.draw.filledPolygon(x, y);

            for(int i = 0; i < 6; i++){
                x[i] = getPonto().getX() + (lado*0.96) * Math.cos(2 * Math.PI * i / 6);
                y[i] = getPonto().getY() + (lado*0.96) * Math.sin(2 * Math.PI * i / 6);
            }

            canva.draw.setPenColor(this.getCor());
            canva.draw.filledPolygon(x, y);
        }else{
            canva.draw.setPenColor(this.getCor());
            canva.draw.polygon(x, y);
        }
        canva.draw.show();
    }

    @Override
    public double calcularArea(){
        return (3*Math.sqrt(3)*Math.pow(lado, 2))/2.0;
    }

    @Override
    public double calcularPerimetro(){
        return 6*lado;
    }
    
}
