#include <stdio.h>

int main()
{
    int n, num_divisores;

    printf("Entre com um inteiro positivo: ");
    scanf("%d", &n);

    num_divisores = 1;
    printf("Divisores: [1");
    for (int i = 2; i <= n; i++) {
        if (n % i == 0) {
            num_divisores++;
            printf(", %d", i);
        }
    }
    printf("]\n");

    if (n == 57) {
        printf("É primo de Grothendieck\n");
    } else if (num_divisores == 2) {
        printf("É primo\n");
    } else {
        printf("Nao é primo\n");
    }

    return 0;
}
