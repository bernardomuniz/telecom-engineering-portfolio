#include <stdio.h>

#define VALOR_INICIAL 10000.0
#define TAXA_INICIAL 6.0
#define PASSO_TAXA 0.5
#define NUM_TAXAS 5
#define NUM_ANOS 4

int main()
{
    float valor[NUM_TAXAS], taxa[NUM_TAXAS];

    printf(" Ano");
    for (int i = 0; i < NUM_TAXAS; i++) {
        valor[i] = VALOR_INICIAL;
        taxa[i] = (TAXA_INICIAL + i * PASSO_TAXA) / 100.0;
        printf("%9.1f%%", 100.0 * taxa[i]);
    }
    printf("\n");

    for (int ano = 1; ano <= NUM_ANOS; ano++) {
        printf("%4d", ano);
        for (int i = 0; i < NUM_TAXAS; i++) {
            valor[i] += taxa[i] * valor[i];
            printf("%10.2f", valor[i]);
        }
        printf("\n");
    }

    return 0;
}
