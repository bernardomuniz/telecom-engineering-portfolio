#include <stdio.h>
#include <stdlib.h>
#include <time.h>


int main(){
    int n, dado1, dado2, soma;
    int freq[13] = {};

    srand(time(NULL));
    printf("Entre com o numero de rolagens: ");
    scanf("%d", &n);
    
    for (int i =1; i <= n; i++) {
        dado1 = rand() % 6 +1;
        dado2 = rand() % 6 + 1;

        soma = dado1 + dado2;
        freq[soma]++;
    }
    
    for (soma = 2; soma <= 12; soma++) {
        printf("%2d : %5.2f\n", soma, (float) freq[soma] / n * 100);
    }

    return 0;
}