#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


#define AREA_SIZE 8

/* typedef struct{
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
}*/


typedef struct {
    // atributos da lista_linear linear
    void* * area; // um vetor de ponteiros do tipo void*
    int cap; // a capacidade da lista (tamanho da área de armazenamento)
    int quantidade; // quantidade ed valores armazenados: quantidade deve ser sempre <= cap
    int pos; // para iteração
} lista_linear_t;


lista_linear_t *lista_linear_cria() {
    lista_linear_t *lista = malloc(sizeof(lista_linear_t)); //Criação da lista dinamicamente
    lista->quantidade = 0;
    lista->cap = AREA_SIZE;
    lista->area = calloc(AREA_SIZE, sizeof(char *));
    return lista;
}

int lista_linear_adiciona(lista_linear_t *l, char *valor) {
    if (l->quantidade == l->cap) {
            return 0;
    }
    l->area[l->quantidade] = strdup(valor);
    l->quantidade++;
    return 1;
}

char* lista_linear_obtem(lista_linear_t * l, int pos)
{
    if (pos >= l->quantidade) {
        return NULL;
    }else {
        return l->area[pos];
    }
}

#define MAX 100
int main(){
    FILE *arquivo = fopen("teste.txt", "r");
    char linhas[10240], *sep, cidade[100]; //São José;
    float temperaturas[1000000], numero;
    int i = 0, quantidade = 0;
    lista_linear_t *l = lista_linear_cria();
    //Estatisticas e;


    while (fgets(linhas, sizeof(linhas), arquivo) != NULL) {
            quantidade++;
            sep = strchr(linhas, ';'); //Encontra a primeira ocorrencia de ; na palavra
                strncpy(cidade, linhas, sep - linhas); // Copia do início até o ponto e vírgula
                cidade[sep - linhas] = '\0';
                lista_linear_adiciona(l, cidade);
                numero = atof(sep + 1); //pega o número a partir da proxima posição do ;
                temperaturas[i++] = numero;
            
    }

    for (int i = 0 ; i < l->quantidade; i++) {
        char *ans = lista_linear_obtem(l, i);
        printf("%s\n", ans);
    }
    int qtd = l->quantidade;
    printf("%d\n", qtd);
    

    return 0;
}