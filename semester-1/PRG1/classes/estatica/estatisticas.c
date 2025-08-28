#include <math.h>
#include <stdio.h>

typedef struct {
    float med, min, max;
} estatisticas;

estatisticas calcula_estatisticas(int n, float a[]);

int main(void)
{
    int n;
    estatisticas e;
    float list[100] = {};
    printf("Entre com o número de elementos (máx 100): ");
    scanf("%d", &n);

    printf("Entre com os elementos: ");
    for (int i = 0; i < n; i++) {
        scanf("%f", &list[i]);
    }
    e = calcula_estatisticas(n, list);
    printf("Média: %g\n", e.med);
    printf("Mínimo: %g\n", e.min);
    printf("Máximo: %g\n", e.max);
    return 0;
}

estatisticas calcula_estatisticas(int n, float a[])
{
    estatisticas e = {.max = -INFINITY, .min = INFINITY};
    float med = 0;
    for (int i = 1; i < n; i++) {
        med += a[i];
        if (a[i] < e.min) {
            e.min = a[i];
        }
        if (a[i] > e.max) {
            e.max = a[i];
        }
    }
    e.med = med / n;
    return e;
}