#include <stdio.h>

#define MAX 100
int main(){
    int linha, coluna;
    int matriz[MAX][MAX] = {};
    float soma_linhas, soma_colunas;

    printf("Entre com o número de linhas e colunas: ");
    scanf("%d%d", &linha, &coluna);

    printf("Entre com os elementos da matriz:\n");
    for (int i = 0; i < linha; i++) {
        for (int j = 0; j < coluna; j++) {
            scanf("%d", &matriz[i][j]);
        }
    }

    printf("Soma das linhas: ");
    for (int i = 0 ; i < linha; i++) {
        soma_linhas = 0.0;
        for (int j = 0; j < coluna; j ++) {
            soma_linhas += matriz [i] [j];
        }
        printf("%g ", soma_linhas);
    }    

    printf("\nSoma das colunas: "); //matriz trasnposta
    for (int j = 0; j < coluna; j ++) {
        soma_colunas = 0.0;
        for (int i = 0; i < linha; i++) {
            soma_colunas += matriz [i][j];
        }
        printf("%g ", soma_colunas);
    }
    printf("\n");
    return 0;
}