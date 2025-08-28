#include <math.h>
#include <stdio.h>

#define MAX 100
typedef struct{
    float media, minimo, maximo;
} Estatisticas;

Estatisticas calcula_estatisticas(int n, float a[]){
    Estatisticas estatistica = {.minimo = INFINITY, .maximo = -INFINITY, 
    .media = 0};

    for (int i = 0; i < n; i++) {
        estatistica.media += a[i];
        if (a[i] <= estatistica.minimo) {
            estatistica.minimo = a[i];
        }else{
            estatistica.maximo = a[i];
        }
    }
    estatistica.media /= n;
    return estatistica;
}

int main(){
    Estatisticas e;
    float elementos[MAX];
    int n_elementos, contagem = 0;
    
    printf("Entre com o número de elementos(máx 100): ");
    scanf("%d", &n_elementos);

    printf("Entre com os elementos: ");
    for (int i = 0; i < n_elementos; i++) {
        scanf("%f", &elementos[i]);
        contagem++;
    }

    e = calcula_estatisticas(contagem, elementos);
    printf("Média: %g\n", e.media);
    printf("Mínimo: %g\n", e.minimo);
    printf("Máximo: %g\n", e.maximo);

    return 0;
}