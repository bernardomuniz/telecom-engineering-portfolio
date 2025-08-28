#include <stdio.h>

int main()
{
    int i, n;
    printf("Entre com o valor de n: ");
    scanf("%d", &n);
    i = 1;
    while (i < n) {
        i *= 2;
    }
    printf("Valor de i: %d\n", i);
    return 0;
}
