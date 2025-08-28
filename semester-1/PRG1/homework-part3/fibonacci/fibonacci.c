#include <stdio.h>


int main(){
    int fzero, fum;
    int coefa, coefb;
    int fibonacci[10] = {};

    printf("Entre com os termos iniciais: ");
    scanf("%d %d", &fzero, &fum);
    printf("Entre com os coeficientes: ");
    scanf("%d %d", &coefa, &coefb);

    printf("Sequência: ");
    for (int i = 0; i < 10; i++) {
        if (i == 0) {
        fibonacci[i] = fzero;
        }if (i == 1) {
            fibonacci[i] = fum;
        }if (i >= 2) {
            fibonacci[i] = coefa*fibonacci[i -1] + coefb*fibonacci[i-2];
        }
        printf(" %d ", fibonacci[i]);
    }

    return 0;
}