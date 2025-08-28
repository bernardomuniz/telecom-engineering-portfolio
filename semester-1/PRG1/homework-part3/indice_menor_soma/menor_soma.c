#include <stdio.h>

int main(){
    int linha, coluna, matriz[100][100], indice;
    float soma_coluna, menor;

    printf("Entre com as dimensões da matriz: ");
    scanf("%d %d", &linha, &coluna);

    printf("Entre com os elementos da matriz:\n");
    for (int i = 0; i < linha; i++) {
        for (int j = 0; j < coluna; j++) {
            scanf("%d",  &matriz[i][j]);
        }
    }

    menor = 1000000000;
    for (int j = 0; j < coluna; j++) {
        soma_coluna = 0.0;
        for (int i = 0; i < linha; i++) {
            soma_coluna += matriz[i][j];
        }
        if (soma_coluna < menor) {
            menor = soma_coluna;
            indice = j;
        }
    }
    printf("Índice da coluna com menor soma: %d\n", indice);
    return 0;
}