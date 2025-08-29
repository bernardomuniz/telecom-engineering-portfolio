package domain;

import javax.swing.JFrame;
import java.awt.*;

import static domain.Constantes.*;

public class InterfaceGrafica {
    private static final JFrame frame = new JFrame(NOME_JOGO);

    public InterfaceGrafica(){
        frame.setSize(LARGURA_TELA, ALTURA_TELA);
        frame.setLocationRelativeTo(null);
        frame.setResizable(false);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setBackground(COR_FUNDO);
    }

    public void inicializaInterfaceJogo(Jogo jogo) {
        frame.add(jogo);
        frame.pack();
        jogo.requestFocus();
        frame.setVisible(true);
    }

}
