#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

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
        }else if (a[i] >= estatistica.maximo) {
            estatistica.maximo = a[i];
        }
    }
    estatistica.media /= n;
    return estatistica;
}

#define MAX 100
int main(){
    FILE *arquivo = fopen("teste.txt", "r");
    char cidade[MAX], linhas[10240], *sep = linhas; 
    float temperaturas[100], numero;
    int i = 0, quantidade = 0;
    Estatisticas e;

    while (fgets(linhas, sizeof(linhas), arquivo) != NULL) {
            quantidade++;
            numero = atof(sep); 
            temperaturas[i++] = numero;
    }

    if (quantidade == 0) {
        printf("A cidade desejada não existe no arquivo!\n");
    }else { 
        e = calcula_estatisticas(quantidade, temperaturas);
        printf("Média: %g\n", e.media);
        printf("Mínimo: %g\n", e.minimo);
        printf("Máximo: %g\n", e.maximo);
    }
    printf("%d",  quantidade);
    return 0;
    }