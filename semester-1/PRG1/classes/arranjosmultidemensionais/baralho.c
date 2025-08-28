#include <stdio.h>
#include <stdbool.h>
#include <time.h> //TIME
#include <stdlib.h> //SRAND


#define LIN 12
#define COL 4
int main(){
    int valores, naipes, n_cartas;
    int baralho[LIN] [COL];

    srand(time(NULL));

    for (int i = 0; i < LIN; i++) {
    for (int j = 0; j < COL; j++) {
        baralho[i][j] = false;
    }
}
    printf("Entre com um número de cartas: ");
    scanf("%d", &n_cartas);

    

    





    return 0;
}