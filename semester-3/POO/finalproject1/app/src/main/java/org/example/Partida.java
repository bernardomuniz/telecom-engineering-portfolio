package org.example;
import java.util.Scanner;

public class Partida {
    private Tabuleiro tabuleiroJogador;
    private Tabuleiro tabuleiroRobo;
    private Interface InterfaceGrafica;
    private Jogador jogador;
    private Jogador robo;
    private int qtdpartida;
    private Gerenciador gerenciador;

    public Partida() {
        this.tabuleiroJogador = new Tabuleiro(10, 5);
        this.tabuleiroRobo = new Tabuleiro(550, 5);
        this.InterfaceGrafica = new Interface() {};
        this.jogador = new Jogador(InterfaceGrafica, tabuleiroJogador, false);
        this.robo = new Jogador(InterfaceGrafica, tabuleiroRobo, true);
        this.qtdpartida = 0;
        this.gerenciador = new Gerenciador(this);

    }

    private boolean validaEntrada(String entrada) {
        entrada = entrada.trim();
        String[] partes = entrada.split(" ");

        if(partes.length != 2) {
            System.out.println("Entrada inválida");
            return false;
        }

        int linha = Tabuleiro.traduzLinha(partes[0]);
        int coluna;

        try {
            coluna = Integer.parseInt(partes[1]);
        }catch (NumberFormatException e) {
            System.out.println("Entrada inválida");
            return false;
        }
        return true;
    }

    public void IniciarPartida(){

        InterfaceGrafica.draw.show();
        desenhaTabuleiros();
        do {
            System.out.println("Seja bem vindo ao jogo Batalha naval!");
            Scanner sc = new Scanner(System.in);
            System.out.println("Selecione uma das opções abaixo: ");
            System.out.println("1. Jogar \n2. Sair");
            System.out.print("Opção: ");
            int opcao = sc.nextInt();
            sc.nextLine();

            switch (opcao){
                case 1:
                    String nome;
                    do {
                        System.out.print("\nPor favor digite seu nome: ");
                        nome = sc.nextLine();
                    }while (!jogador.setNome(nome));
                    robo.setNome("Robô");
                    gerenciador.adicionarJogador(jogador);
                    gerenciador.adicionarJogador(robo);
                    posicionarNaviosJogadores();
                    iniciarLoopDeJogo(true);
                return;
                case 2:
                    System.exit(0);
                    return;
                default:
                    System.out.println("Opção inválida!");
            }
        }while (true);


    }

    public void solicitarPosicionamento(Scanner sc,String nomeNavio,int tamanho){
        System.out.println("\nNavio: " + nomeNavio + "/ tamanho: " + tamanho);

        while(true){
            String orientacao;
            do {
                System.out.print("Entre com a orientação do navio (horizontal/vertical): ");
                orientacao = sc.nextLine();
            }while (!tabuleiroJogador.validaOrientacao(orientacao, true));

            String linha, entrada;
            int coluna;

            do {
                do {
                    System.out.print("Entre com uma posição (ex: A 5): ");
                    entrada = sc.nextLine().trim();
                }while (!validaEntrada(entrada));

               linha = entrada.split(" ")[0];
               coluna = Integer.parseInt(entrada.split(" ")[1]);
            }while (!tabuleiroJogador.validaPosicao(Tabuleiro.traduzLinha(linha),coluna,true));

            if (jogador.posicionarNavio(coluna, linha, tamanho, orientacao)){
                desenhaTabuleiros();
                break;
            }
        }
    }

    public void posicionarNaviosJogadores() {
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.print("Deseja posicionar navios de forma aleatória (S/N)? ");
            String opcao = sc.nextLine().toLowerCase().trim();

            switch (opcao) {
                case "s":
                    jogador.posicionarNaviosAleatorio();
                    desenhaTabuleiros();
                    robo.posicionarNaviosAleatorio();
                    System.out.println("\nFrota posicionada com sucesso!");
                    return;
                case "n":
                    System.out.println("\nPosicione seus navios no tabuleiro!");
                    solicitarPosicionamento(sc, "Porta-Aviões", 5);
                    solicitarPosicionamento(sc, "Encouraçado", 4);
                    solicitarPosicionamento(sc, "Cruzador", 3);
                    solicitarPosicionamento(sc, "Submarino", 3);
                    solicitarPosicionamento(sc, "Contratorpedeiro", 2);
                    robo.posicionarNaviosAleatorio();
                    System.out.println("\nFrota posicionada com sucesso!");
                    return;
                default:
                    System.out.println("Opção inválida! Por favor digite uma opção válida (S/N)!");
                    break;
            }
        }
    }

    public void iniciarLoopDeJogo(boolean turnoDoJogador){
        Scanner sc = new Scanner(System.in);
        System.out.println("\n==================================");
        System.out.println("Vamos começar a batalha naval!");
        System.out.println("==================================");


        while(!jogador.getTabuleiro().verificaNaviosDestruidos() && !robo.getTabuleiro().verificaNaviosDestruidos()){
            if(turnoDoJogador){
                System.out.println("\nSua vez de jogar!");
                String linha,entrada;
                int coluna;

                    do {
                        do {
                            System.out.print("Entre com uma posição (ex: B 4): ");
                            entrada = sc.nextLine().trim();

                        }while (!validaEntrada(entrada));
                        linha = entrada.split(" ")[0];
                        coluna = Integer.parseInt(entrada.split(" ")[1]);
                    }while (!tabuleiroJogador.validaPosicao(Tabuleiro.traduzLinha(linha),coluna,true) || jogador.jaJogou(Tabuleiro.formataPosicao(Tabuleiro.traduzLinha(linha),coluna)));

                    jogador.realizarBombardeio(coluna,linha,tabuleiroRobo);

                    if (robo.getTabuleiro().verificaNaviosDestruidos()) {
                        break;
                    }

            }else{
                    System.out.println("\nVez do robô...");

                    robo.realizarBombardeioAleatorio(tabuleiroJogador);

                    if (jogador.getTabuleiro().verificaNaviosDestruidos()) {
                        break;
                    }
            }
            turnoDoJogador = !turnoDoJogador;
        }

            if(jogador.getTabuleiro().verificaNaviosDestruidos()){
                System.out.println("\nO robô venceu!");
                robo.incrementaVitorias();
            }else {
                System.out.println("\nParabéns, " + jogador.getNome() + ", você venceu!");
                jogador.incrementaVitorias();
            }
        perguntarNovaPartida(sc, turnoDoJogador);
    }

    private boolean validaEntradaUsuario(String string) {
    if (!string.equals("s") && !string.equals("n")) {
        System.out.println("Entrada inválida!");
        return true; 
    }
    return false;
}


    private void perguntarNovaPartida(Scanner sc, boolean jogadorComeca) {
            String opcao;
        do{
            System.out.print("\nDeseja jogar novamente? (S/N): ");
            opcao = sc.nextLine().trim().toLowerCase();
        }while(validaEntradaUsuario(opcao));
        
        if (opcao.equals("s")) {
            reiniciarPartida();
            posicionarNaviosJogadores();
            iniciarLoopDeJogo(jogadorComeca);
        } else {
            gerenciador.verEstatisticas();
            System.out.println("\nObrigado por jogar!");
            System.exit(1);
        }
    }

    private void reiniciarPartida(){
        jogador.limparJogadas();
        robo.limparJogadas();
        InterfaceGrafica.limparTabuleiro(jogador.getTabuleiro());
        InterfaceGrafica.limparTabuleiro(robo.getTabuleiro());
       desenhaTabuleiros();
        qtdpartida++;
    }

    public int getQtdpartida() {
        return qtdpartida;
    }

    public void desenhaTabuleiros(){
        InterfaceGrafica.desenhaTabuleiro(jogador.getTabuleiro());
        InterfaceGrafica.desenhaTituloDoTabuleiro("Navios", jogador.getTabuleiro());
        InterfaceGrafica.desenhaTabuleiro(robo.getTabuleiro());
        InterfaceGrafica.desenhaTituloDoTabuleiro("Alvos", robo.getTabuleiro());
    }
}

