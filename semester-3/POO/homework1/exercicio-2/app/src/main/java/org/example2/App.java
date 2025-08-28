package org.example2;

public class App {
   
    //A função calculo de resistencia tem a função de calcular a resistencia de acordo com os argumentos fornecidos.
    static double calculoResistencia(String faixaUm, String faixaDois, String multiplicador){
        double resistencia, a = 0 ,b = 0, c = 0;
        
        /*Atribuição para a primeira faixa. Nota-se que se caso o usuario fornecer uma cor inválida, 
        é informado para ele a cor em questão e informa como deve ser informado a formatação da cor.
        O programa se encerra automaticamente também, nesse caso.*/ 
        switch (faixaUm) {
            case "preto"   -> a = 0;
            case "marrom"  -> a = 1;
            case "vermelho"-> a = 2;
            case "laranja" -> a = 3;
            case "amarelo" -> a = 4;
            case "verde"   -> a = 5;
            case "azul"    -> a = 6;
            case "violeta" -> a = 7;
            case "cinza"   -> a = 8;
            case "branco"  -> a = 9;
            default ->{
                System.out.println("Cor inválida: " + faixaUm);
                System.out.println("Por favor, insira uma cor válida em letra minúscula e sem acento");
                System.exit(1);
            }
        }
        //Mesma premissa do primeiro switch
        switch (faixaDois) {
            case "preto"   -> b = 0;
            case "marrom"  -> b = 1;
            case "vermelho"-> b = 2;
            case "laranja" -> b = 3;
            case "amarelo" -> b = 4;
            case "verde"   -> b = 5;
            case "azul"    -> b = 6;
            case "violeta" -> b = 7;
            case "cinza"   -> b = 8;
            case "branco"  -> b = 9;
            default -> {
                System.out.println("Cor inválida: " + faixaDois);
                System.out.println("Por favor, insira uma cor válida em letra minúscula e sem acento");
                System.exit(1);
            }
        }
        //Mesma premissa dos switchs anteriores
        switch (multiplicador) {
            case "preto"   -> c = 1;
            case "marrom"  -> c = 10;
            case "vermelho"-> c = 100;
            case "laranja" -> c = 1000;
            case "amarelo" -> c = 10000;
            case "verde"   -> c = 100000;
            case "azul"    -> c = 1000000;
            case "violeta" -> c = 10000000;
            case "cinza"   -> c = 100000000;
            case "branco"  -> c = 1000000000;
            case "ouro"    -> c = 0.1;
            case "prata"   -> c = 0.01;
            default -> {
                System.out.println("Multiplicador inválido: " + multiplicador);
                System.out.println("Por favor, insira uma cor válida em letra minúscula e sem acento");
                System.exit(1);
            }
        }
        

        //resistencia (1 faixa * 10 + 2 faixa) * multiplicador
        resistencia = (a * 10 + b) * c;

        return resistencia;
    }

    static String tolerancia(String tol){
        String ans = "";

        //Atribuição da tolerância para os demais casos. Segue a mesma ideia dos outros switchs
          switch (tol) {
            case "preto"  -> ans = "(+- 0)";
            case "marrom" -> ans = "(+- 1)";
            case "vermelho"-> ans = "(+- 2)";
            case "verde"-> ans = "(+- 0,5)";
            case "azul"-> ans = "(+- 0,25)";
            case "violeta"-> ans = "(+- 0,1)";
            case "cinza" -> ans = "(+- 0,05)";
            case "ouro" -> ans = "(+- 5% Dourado)";
            case "prata" -> ans ="(+- 10% Prata)";
            case "null" -> ans = "(+- 20%)";
            default->{
                System.out.println("Tolerância inválida: " + tol);
                System.out.println("Por favor, insira uma cor válida em letra minúscula e sem acento");
                System.exit(1);
            }
        }
        
        return ans;
    }

    public static void main(String[] args) {

        //informa ao usuario o caso a formatação e como deve ser fornecido os argumentos para o programa 
        if(args.length < 3){
            System.out.println("Número de argumentos inválidos, forneça 4 argumentos em letra minúscula e sem acento, na formatação: 1º faixa 2º faixa multiplicador tolerância.");
            System.out.println("Se caso o seu resitor não possuir faixa de tolerância, forneça apenas 3 argumentos, desconsiderando a última formatação.");
            System.exit(1); //finaliza o programa nesse caso
        }

        /*O programa começa com o caso em que o resistor não possua uma cor de faixa de tolerancia (20%), nesse caso tolerância recebe o valor de null e é atribuido em um dos casos do switch caso
         * posteriormente
         */

        String primeraFaixa, segundaFaixa, multiplicador, tolerancia;
        if(args.length == 3){
            primeraFaixa = args[0];
            segundaFaixa = args[1];
            multiplicador = args[2];
            tolerancia = "null";

        }else{
            //se caso fornecer uma quantidade correta, os valores são atribuidos normalmente
            primeraFaixa = args[0];
            segundaFaixa = args[1];
            multiplicador = args[2];
            tolerancia = args[3];
        }
        
        //Por fim o programa chama a função calculo de resistencia com os devidos parâmetros atribuidos
        double req = calculoResistencia(primeraFaixa, segundaFaixa, multiplicador);
        
        String prefix; //String que recebe a sigla de abreviação de acordo com o tamanho da variável req

        if (req >= 1000000000) { // Bilhões
            req /= 1000000000;
            prefix = " G";  
        } else if (req >= 1000000) { // Milhões
            req /= 1000000;
            prefix = " M";  
        } else if (req >= 1000) { // Milhares
            req /= 1000;
            prefix = " K";  
        } else {
            prefix = ""; // Nenhuma abreviação
        }
        
        //Printa na tela o resultado
        System.out.println("Resistência: " + req + prefix + " Ohms " + tolerancia(tolerancia));
}}