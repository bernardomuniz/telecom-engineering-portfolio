package ifsc.poo;
import java.util.List;


public class Estatistica {
    public String verEstatisticas(List<ObjetoDeDesenho> l){
        double totArea = 0, totPerimetro = 0;
        int totFiguras = l.size();
        for(ObjetoDeDesenho obj : l){
            totArea += obj.calcularArea();
            totPerimetro += obj.calcularPerimetro();
        }

        return String.format("Número de figuras: %d\nÁrea média: %,.2f px²\nSoma dos perímetros: %,.2f px", totFiguras, totArea/totFiguras, totPerimetro);
    }
}
