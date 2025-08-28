package ifsc.poo;
import edu.princeton.cs.algs4.Draw;
import static ifsc.poo.Constantes.*;

public class Canvas {
    public Draw draw;

    public Canvas() {
        this.draw = new Draw();
        this.draw.setCanvasSize(CANVAS_WIDTH, CANVAS_HEIGHT);
        this.draw.setXscale(0,X_SCALE);
        this.draw.setYscale(0,Y_SCALE);
        draw.enableDoubleBuffering();
    }

    public void desenharTela(){
        draw.show();
    }

    public void limparTela(){
        this.draw.clear();
        draw.show();
    }
}