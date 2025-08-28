#include <stdio.h>

int main(void)
{
    float ph_min, ph_max, ph;
    int n, fora = 0;
    printf("Entre com a faixa de pH adequada: ");
    scanf("%f%f", &ph_min, &ph_max);
    printf("Entre com o número de medições: ");
    scanf("%d", &n);
    printf("Entre com as medições de pH: ");
    for (int i = 1; i <= n; i++) {
        scanf("%f", &ph);
        if (ph < ph_min || ph > ph_max) {
            fora++;
        }
    }
    printf("Número de medições fora da faixa: %d\n", fora);
    return 0;
}
