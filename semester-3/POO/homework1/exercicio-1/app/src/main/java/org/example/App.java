package org.example;

public class App {
 
    //Função que imprime o triangulo, separando uma repetição para os asteristicos e outra para os espaços
    static void triangulo(int n){
        int i, j; 

        for( i = 1; i <= n; i++){
            for(j = n - i; j >= 1; j--){
                System.out.print(" ");
            }
            for( j = 1; j <= i; j++){
                System.out.print("*");
            }
            System.out.println("");
        }
    }
    
    /*A função do retângulo se baseia em, sempre que j ou i forém igual a 1 ou então ao numero de linhas/colunas, ele vai printar um asterisco na tela, caso ao contrário, imprime um espaço vazio */
    static void retangulo (int linhas, int colunas){
        int i, j; 

        for(i = 1; i <= linhas; i++ ){
            for(j=1;j<=colunas; j++){
                if(j == 1 || j == colunas || i ==1|| i == linhas){
                    System.out.print("*");
            }else{
                System.out.print(" ");
            }
        }
        System.out.println("");
    }

    }
    /*Na função do losango primeiro printei a parte de cima e depois a parte debaixo */
    static void losango(int tamanho){
        int i, j, espacos, meio = tamanho / 2;

        //Parte de fima do losango, a cada linha mais asterisco e menos espaço
        for (i = 0; i <= meio; i++) {
            espacos = meio - i;
            for (j = 0; j < espacos; j++) {
                System.out.print(" ");
            }

            //Essa parte garante a centralização do losango sempre com um numero impar
            for (j = 0; j < (2 * i + 1); j++) {
                System.out.print("*");
            }
            System.out.println("");
        }
    
        //parte de baixo do losango, faz o inverso da parte de cima, a cada linha, mais espaço e menos asterisco
        for (i = meio - 1; i >= 0; i--) {
            espacos = meio - i;
            for (j = 0; j < espacos; j++) {
                System.out.print(" ");
            }
            for (j = 0; j < (2 * i + 1); j++) {
                System.out.print("*");
            }
            System.out.println("");
        }
        }
    

    public static void main(String[] args) {
        String forma;
        int linhas, colunas, tamanho;

         //Para o caso do input ser menor que 2, ja acaba o programa também
        if(args.length < 2){
            System.out.println("Argumentos insuficientes!");
            System.exit(1);
        }
        if(args.length == 2){
            forma = args[0];
            tamanho = Integer.parseInt(args[1]);

            // Se caso for fornecido um triangulo sem colunas, ja acaba o programa aqui também
            if(forma.equals("retangulo")){
                System.out.println("Informe a coluna do retângulo!");
                System.exit(1);
            }

            
            //Chama as funções triangulo e losango para cada figura;
            switch(forma){
                case "triangulo" -> triangulo(tamanho);
                case "losango" -> losango(tamanho);
                default -> {
                    System.out.println("Figura inválida!");
                    System.exit(1); 
                }
            }
        }else{
            //atribui cada string dos argumentos para cada variável, sendo necessário converter os parâmetros de linha/coluna para inteiros, ja que os argumentos são dados como strings
            
            forma = args[0];
            colunas = Integer.parseInt(args[1]);
            linhas = Integer.parseInt(args[2]);
            if(forma.equals("retangulo")){
                retangulo(linhas, colunas);
            }else{

                //Aqui temos o mesmo caso anterior, se caso for fornecido uma figura diferente de triangulo mas com base e altura, informa ao usuario e encerra o programa
                System.out.println("Figura inválida!");
                System.exit(1); 
            }
        }
    }
}
