#include <stdio.h>


int main(){
    int linhas, colunas, matriz[100][100];
    float media_linhas, media_colunas;

    printf("Entre com o número de linhas e colunas: ");
    scanf("%d %d", &linhas, &colunas);

    printf("Entre com os elementos da matriz: \n");
    for (int i = 0; i < linhas; i++) {
        for (int j = 0; j < colunas; j++) {
            scanf("%d", &matriz[i][j]);
        }
    }printf("\n");

    printf("Média das linhas: ");
    for (int i = 0; i < linhas; i++) {
        media_linhas = 0.0;
        for (int j = 0; j < colunas; j++) {
            media_linhas += matriz[i][j];
        }
        printf("%g ", media_linhas/colunas);
    }printf("\n");

    printf("Média das colunas: ");
    for (int j = 0; j < colunas; j++) {
        media_colunas = 0.0;
        for (int i = 0; i < linhas; i++) {
            media_colunas += matriz[i][j];
        }
        printf("%g ", media_colunas/linhas);
    }printf("\n");



    return 0;
}