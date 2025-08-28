#include <libprg/pilha.h>
#include <string.h>
#include <stdlib.h>

pilha_t* pilha_cria() {
    pilha_t *pilha = malloc(sizeof(pilha_t));

    if (pilha != NULL) {
        pilha->area = calloc(PILHA_CAPACIDADE, sizeof(char *));
    }
    if (pilha->area != NULL) {
        pilha->quantidade = 0;
        pilha->cap = PILHA_CAPACIDADE;
    }else {
        free(pilha);
        pilha = NULL;
    }
    return pilha;
};
void pilha_limpa(pilha_t * pilha) {
    while (pilha->quantidade-- > 0) {
        free(pilha->area[pilha->quantidade]);
    }
};

void pilha_destroi(pilha_t * pilha) {
    pilha_limpa(pilha);
    free(pilha->area);
    free(pilha);
};

int pilha_comprimento(pilha_t * pilha) {
    return pilha->quantidade;
};

int pilha_adiciona(pilha_t * pilha, char* valor) {
    //verificar se a pilha está cheia e abortar caso esteja;
    if (pilha->quantidade >= pilha->cap) {
        return 0;
    }
    //adicionar o valor ao topo da pilha
    pilha->area[pilha->quantidade] = strdup(valor); //a ultima posição é o primeiro valor
    pilha->quantidade++;
};

// desempilha o valor que está na frente da pilha
// resultado: o valor, ou NULL em caso de falha
char* pilha_remove(pilha_t * pilha) {
    if (pilha->quantidade == 0) {
        return NULL;
    }
    pilha->quantidade--;
    return pilha->area[pilha->quantidade];
};

char* pilha_topo(pilha_t * pilha) {
    return pilha->area[pilha->quantidade - 1];
};

int pilha_vazia(pilha_t * pilha) {
    if (pilha->quantidade == 0) {
        return 1;
    }
    return 0;
};