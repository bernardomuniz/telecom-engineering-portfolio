#include <stdio.h>


#define LIN 100 
#define COL 100
int main(){
    int n_linhas, n_colunas, matriz[LIN][COL];
    float soma_linhas, soma_colunas;

    printf("Entre com o número de linhas e colunas: ");
    scanf("%d %d", &n_linhas, &n_colunas);

    printf("Entre com os elementos da matriz: \n");
    for (int i = 0; i < n_linhas; i++) {
        for (int j = 0; j < n_colunas; j++) {
            scanf("%d", &matriz[i][j]);
        }
    }

    printf("Soma das linhas: ");
    for (int i = 0; i < n_linhas; i++) {
        soma_linhas = 0.0;
        for (int j = 0; j < n_colunas; j++) {
            soma_linhas += matriz[i][j];
        }
        printf("%g ", soma_linhas);
    }printf("\n");

    printf("Soma das colunas: ");
    for (int j = 0; j < n_colunas; j++) {
        soma_colunas = 0.0;
        for (int i = 0; i < n_linhas; i++) {
            soma_colunas+= matriz[i][j];
        }
        printf("%g ", soma_colunas);
    }printf("\n");



    return 0;
}