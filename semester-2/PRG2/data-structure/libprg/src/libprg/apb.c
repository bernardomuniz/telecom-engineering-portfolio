#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libprg/apb.h>
#include <libprg/lista_linear.h>
#include <libprg/fila.h>
#include "libprg/lista.h"


apb_t * apb_cria(char * dado) {
    apb_t * apb = malloc(sizeof(apb_t));

    if (apb != NULL) {
        apb->valor = strdup(dado);
        apb->dir = NULL;
        apb->esq = NULL;
        return apb;
    }
    return NULL;
}

// Adiciona um "dado" à apb enraizada em "arv"
// Retorna: 1=sucesso, 0=falha
int apb_adiciona(apb_t * arv, char * dado) {
    if (arv == NULL)
    {
        return 0;
    }

    apb_t *atual = arv;

    while (atual != NULL) {
        int cmp = strcmp(atual->valor, dado);

        if (cmp == 0) {
            atual->valor = dado;
            return 0;
        }if (cmp < 0) {
            if (atual->esq != NULL) {
                atual = atual->esq;
            }else {
                atual->esq = apb_cria(dado);
                return 1;
            }
        }else {
            if (atual->dir != NULL) {
                atual = atual->dir;
            }else {
                atual->dir= apb_cria(dado);
                return 1;
            }
        }

    }

    return 0; //Se sair do loop, então algo deu errado
};

// Procura "dado" na apb enraizada em "arv"
// Retorna: 1=dado existe, 0=não existe ou falha
int apb_procura(apb_t * arv, char * dado) {
    apb_t *atual = arv;

    while (atual != NULL) {
        int cmp = strcmp(atual->valor, dado);
        if (cmp == 0) {
            return 1;
        }if (cmp < 0) {
            atual = atual->esq;
        }else {
            atual = atual->dir;
        }
    }

    return 0;
};


void _em_ordem(apb_t * raiz, lista_linear_t * lista) {
    if (raiz != NULL) {
        _em_ordem(raiz->esq, lista);
        lista_linear_adiciona(lista, raiz->valor);
        _em_ordem(raiz->dir, lista);
    };
}

void _pre_ordem(apb_t * raiz, lista_linear_t * lista) {
    if (raiz != NULL) {
       lista_linear_adiciona(lista, raiz->valor);
        _pre_ordem(raiz->esq, lista);
        _pre_ordem(raiz->dir, lista);
    };
}

void _pos_ordem(apb_t * raiz, lista_linear_t * lista) {
    if (raiz != NULL) {
        _pos_ordem(raiz->esq, lista);
        _pos_ordem(raiz->dir, lista);
        lista_linear_adiciona(lista, raiz->valor);
    }
}

lista_linear_t * apb_pos_ordem(apb_t * arv) {
    lista_linear_t * lista = lista_linear_cria();
    _pos_ordem(arv, lista);
    return lista;
};

lista_linear_t * apb_em_ordem(apb_t * arv) {
    lista_linear_t *l = lista_linear_cria();
    _em_ordem(arv, l);
    return l;
}

lista_linear_t * apb_pre_ordem(apb_t * arv) {
    lista_linear_t *l = lista_linear_cria();
    _pre_ordem(arv, l);
    return l;
};

// lista_linear_t * apb_em_largura(apb_t * arv) {
//     lista_linear_t *l = lista_linear_cria();
//     _em_largura(arv,l);
//     return l;
// };



