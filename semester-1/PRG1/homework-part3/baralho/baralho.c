#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <stdbool.h>

int main(){
    bool baralho[13][4] = {}; //linhas: valores //coluna: naipe
    int cartas;
    int v, n;
    char valores[] = {'2', '3', '4', '5', '6', '7', '8', '9', 'X', 'J', 'Q', 'K', 'A'};
    char naipes[] = {'e', 'c', 'o', 'p'};

    srand(time(NULL));
    printf("Entre com o número de cartas: ");
    scanf("%d", &cartas);

    printf("Mão sorteada: ");
    while (cartas > 0) { 
        v = rand() % 13;
        n = rand() % 4;
        if (!baralho[v][n]) {
            printf(" %c%c", valores[v], naipes[n]);
            baralho [v][n] = true;
            cartas--;
        }
    }printf("\n");




    return 0;
}