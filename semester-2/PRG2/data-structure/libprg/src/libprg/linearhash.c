#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libprg/linearhash.h>

lista_linear_hash_t * lista_linear_hash_cria() {
    lista_linear_hash_t *l = malloc(sizeof(par_t*));

    if (l != NULL) {
        l->quantidade = 0;
        l->cap = CAPACIDADE_LISTA;
        l->area = calloc(CAPACIDADE_LISTA, sizeof(par_t*));
        return l;
    }

    return NULL;
}; //feito e funcionando

int lista_linear_hash_adiciona(lista_linear_hash_t * l, par_t *par) {

    if (l->quantidade == l->cap) {
        return 0;
    }

    l->area[l->quantidade] = par;
    l->quantidade++;
    return 1;
}; //feito e funcionando

//retorna o valor a partir da chave
char* lista_linear_hash_procura_valor(lista_linear_hash_t * l, char* chave) {

    for (int i = 0; i < l->quantidade; i++) {
        if (strcmp(l->area[i]->chave, chave) == 0) {
            return l->area[i]->valor;;
        }
    }
    return NULL;
}; //feito e funcionando

int lista_linear_hash_procura_pos(lista_linear_hash_t * l, char* chave)
{
    for (int i = 0; i < l->quantidade; i++)
    {
        if (strcmp(l->area[i]->chave, chave) == 0)
        {
            return i;
        }
    }
    return -1;
}; //feito e ok

//Obtḿ o valor da posição 'pos'
//Se pos inválida, retorna NULL
char* lista_linear_hash_obtem(lista_linear_hash_t * l, uint32_t pos)
{
    if (pos >= l->quantidade)
    {
        return NULL;
    }
    return l->area[pos]->chave;
};

char* lista_linear_hash_obtem_valor(lista_linear_hash_t * l, uint32_t pos)
{
    if (pos >= l->quantidade)
    {
        return NULL;
    }
    return l->area[pos]->valor;
};


int lista_linear_hash_vazia(lista_linear_hash_t * l) {
    if (l->quantidade == 0) {
        return 1;
    }

    return 0;
}; //feito

int lista_linear_hash_comprimento(lista_linear_hash_t * l)
{
    return l->quantidade;
}


