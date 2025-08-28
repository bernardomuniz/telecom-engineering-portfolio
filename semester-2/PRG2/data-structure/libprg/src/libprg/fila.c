#include <libprg/fila.h>
#include <stdlib.h>
#include <string.h>

fila_t* fila_cria() {
    fila_t * fila = malloc(sizeof(fila_t));

    if(fila != NULL) {
        fila->area = calloc(FILA_CAPACIDADE, sizeof(char *));
    }

    if(fila->area != NULL) {
        fila->quantidade = 0;
        fila->cap = FILA_CAPACIDADE;
        fila->inicio =0;
        fila->fim =0;
    }else {
        free(fila);
        fila = NULL;
    }
    return fila;
};

int fila_adiciona(fila_t * fila, char * valor) {
    if (fila->quantidade >= fila->cap) {
        return 0;
    }

    fila->area[fila->fim] = strdup(valor);
    fila->fim = (fila->fim + 1) % fila->cap;
    fila->quantidade++;
    return 1;
};

char* fila_remove(fila_t * fila) {
    if (fila->quantidade == 0) {
        return NULL;
    }

    char * valor = fila->area[fila->inicio];
    fila->inicio = (fila->inicio + 1) % fila->cap;
    fila->quantidade--;
    return valor;
};

void fila_limpa(fila_t * fila) {
    for(int i = 0; i < fila->quantidade; i++) {
        free(fila->area[i]);
    }
    fila->quantidade = 0;
}

void fila_destroi(fila_t * fila) {
    fila_limpa(fila);
    free(fila->area);
    free(fila);
};

char* fila_frente(fila_t * fila) {
    if(fila->quantidade == 0) {
        return NULL;
    }
    return fila->area[fila->inicio];
};
// return 1 = vazia
// testa se fila está vazia
int fila_vazia(fila_t * fila) {
    if(fila->quantidade == 0) {
        return 1;
    }
};

char* fila_fim(fila_t *fila) {
    if(fila->quantidade == 0) {
        return NULL;
    }
    if(fila->fim == 0) return fila->area[fila->cap - 1];
    return fila->area[fila->fim - 1];
};

int fila_comprimento(fila_t * fila) {
    return fila->quantidade;
}


