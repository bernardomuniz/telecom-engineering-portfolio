#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct{
    float media, minimo, maximo;
} Estatisitca;

Estatisitca calcula(float temp[], int n){
    Estatisitca e = {.maximo = -INFINITY, .minimo = INFINITY, .media = 0};
    
    for (int i = 0; i < n; i++) {
        e.media += temp[i];
        if (temp[i] <= e.minimo) {
            e.minimo = temp[i];
        }else if (temp[i] >= e.maximo) {
            e.maximo = temp[i];
        }
    }
    e.media = e.media / n;
    return e;
}
#define MAX 100
int main(){
    FILE *arquivo  = fopen("teste.txt", "r");
    char linhas[1024], *sep = linhas;
    int QuantidadeCidades = 0, i = 0;
    float temperaturas[MAX];
    Estatisitca e;

    if (arquivo == NULL) {
        printf("Não foi possível abrir o arquivo!\n");
    }else {
        while (fgets(linhas, sizeof(linhas),arquivo) != NULL) {
            sep = strchr(linhas, ';');
            temperaturas[i++] = atof(sep + 1);
            QuantidadeCidades++;
        }

        e = calcula(temperaturas, QuantidadeCidades);

        printf("Média: %g\n", e.media);
        printf("Mínimo: %g\n", e.minimo);
        printf("Máximo: %g\n", e.maximo);
        printf("Quantidade de cidades: %d\n", QuantidadeCidades);
    }

    fclose(arquivo);

    return 0;
}