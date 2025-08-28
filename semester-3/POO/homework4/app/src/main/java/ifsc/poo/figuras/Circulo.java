package ifsc.poo.figuras;
import java.awt.Color;

import ifsc.poo.Canvas;
import ifsc.poo.ObjetoDeDesenho;
import ifsc.poo.Ponto;

public class Circulo extends ObjetoDeDesenho{
    private double raio;
    
    public Circulo(double raio, Ponto ponto, Color cor, boolean preenchido){
        super(ponto, cor, preenchido);
        this.raio = raio;
    } 
    
    @Override
    public void desenhar(Canvas canva){
        double x = this.getPonto().getX();
        double y = this.getPonto().getY();

        if(this.ehPreenchido()){
            canva.draw.setPenColor(Color.BLACK);
            canva.draw.filledCircle(x, y, raio);
            canva.draw.setPenColor(this.getCor());
            canva.draw.filledCircle(x, y, raio * 0.96);
        }else{
            canva.draw.setPenColor(this.getCor());
            canva.draw.circle(x, y, raio);
        }
        canva.draw.show();
    }

    @Override
    public double calcularArea(){
        return Math.PI*Math.pow(raio, 2);
    }

    @Override
    public double calcularPerimetro(){
        return 2*Math.PI*raio;
    }

}

