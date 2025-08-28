#include <stdio.h>

int main(){
    int maior_numero = 0, contagem = 0, n;

    

    printf("Entre com inteiros positivos. Entre com 0 ou um inteiro negativo para terminar.\n");
    do {
        printf("> "); 
        scanf("%d", &n);

        if (n <= 0) {
            break;
        }

        if (n > maior_numero) {
            contagem = 0;
        }

        if (n >= maior_numero) {
            contagem++;
            maior_numero = n;
        }
    }while (n > 0);
    
    if (contagem == 1) {
        printf("O maior inteiro foi %d, que ocorreu apenas uma vez.", maior_numero);
    }else {
          printf("O maior inteiro foi %d, que ocorreu %d %s\n", maior_numero,contagem, contagem > 1 ? "vezes." : "vez." );
    }
    return 0;
}