#include <stdio.h>
#include <libprg/lista.h>
#include <libprg/lista_linear.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

nodo_t * cria_nodo(char * valor) {
    nodo_t *novo = malloc(sizeof(nodo_t));

    if (novo != NULL) {
        novo->valor = strdup(valor);
        novo->proximo = NULL;
    }
    return novo;
}

static inline void destroi_nodo(nodo_t * nodo) {
    free(nodo->valor);
    free(nodo);
}

static inline nodo_t * obtem_nodo(lista_t * lista, uint32_t pos) {
    nodo_t * ptr;

    for (ptr = lista->primeiro; pos > 0 ; pos-- , ptr = ptr->proximo);
    return ptr;

}

lista_t* lista_cria() {
    lista_t* lista = malloc(sizeof(lista_t));

    if (lista != NULL) {
        lista->primeiro = NULL;
        lista->ultimo = NULL;
        lista->quantidade = 0;
    }
    return lista;
};

int lista_adiciona(lista_t * lista, char* valor) {
    nodo_t * nodo = cria_nodo(valor);

    if (nodo == NULL) {
        return 0;
    }

    if (lista->quantidade == 0) {
        lista->primeiro = nodo;
    }else {
        nodo_t * last = lista->ultimo;
        last->proximo = nodo;
    }
    lista->ultimo = nodo;
    lista->quantidade++;
};

// testa se lista está vazia
int lista_vazia(lista_t * lista) {
    if (lista->quantidade == 0) {
        return 1;
    }

    return -1;
};

int lista_comprimento(lista_t * lista) {
    return lista->quantidade;
};

// retorna o valor que está na posição da lista
// Retorna: o valor, ou NULL em caso de falha
char* lista_obtem(lista_t * lista, uint32_t pos) {
    if (pos >= lista->quantidade) {
        return NULL;
    }
    nodo_t * ptr = lista->primeiro;

    for (uint32_t i = 0; i < pos; i++) {
        ptr = ptr->proximo;
    }
    return ptr->valor;
};

char* lista_obtem_primeiro(lista_t * lista) {
    return lista->primeiro->valor;
};

char* lista_obtem_ultimo(lista_t * lista) {
    return lista->ultimo->valor;
};

void lista_limpa(lista_t * lista) {
    nodo_t * ptr = lista->primeiro;

    for (uint32_t i = 0; i < lista->quantidade; i++) {
       free(ptr->proximo);
    }
};
void lista_destroi(lista_t * lista) {
    lista_limpa(lista);
    free(lista);
};

// procura um valor dentro da lista
// retorna: a posição do valor encontrado (em caso de falha, retorna -1)
int lista_procura(lista_t * lista, char * valor) {
    nodo_t * ptr = lista->primeiro;

    for (int i = 0; i < lista->quantidade; i++) {
        if (strcmp(ptr->valor, valor) == 0) {
            return i;
        }
        ptr = ptr->proximo;
    }
    return -1;
};

// insere um valor em uma posição da lista
// resultado: 1=sucesso, 0=falha
int lista_insere(lista_t * lista, uint32_t  pos, char* valor) {
    nodo_t *nodo = cria_nodo(valor);
    if (nodo == NULL) {
        return 0;
    }
    if(pos >= lista->quantidade) {
        return 0; //Posição inválida
    }
    if (pos == 0) {
        nodo->proximo = lista->primeiro;
        lista->primeiro = nodo;
    }if (pos == lista->quantidade) {
        lista_adiciona(lista, valor);
    }else {
        //Obtendo a posição do nodo anterior a posição em que eu quero adicionar
        nodo_t *pos_anterior = obtem_nodo(lista, pos - 1);
        nodo->proximo = pos_anterior->proximo;
        pos_anterior->proximo = nodo;
    }
    lista->quantidade++;
    return 1;
    };

// remove um valor de uma posição da lista
// resultado: 1=sucesso, 0=falha
int lista_remove(lista_t * lista, uint32_t pos) {
    if (pos >= lista->quantidade) {
        return 0;
    }

    if(pos == 0) {
        nodo_t *ptr = lista->primeiro;
        lista->primeiro = ptr->proximo;
        if(lista->ultimo == ptr){
            lista->ultimo = NULL;
    }
        destroi_nodo(ptr);
    }else{
        nodo_t * anterior = obtem_nodo(lista, pos - 1);
        nodo_t * ptr = anterior->proximo;
        anterior->proximo = ptr->proximo;
        if (lista->ultimo == ptr) {
            lista->ultimo = lista->primeiro;
        }
        destroi_nodo(ptr);
    }
}

void lista_embaralha(lista_t * lista) {
    srand(time(NULL));
    for (int i = lista->quantidade - 1; i >= 0 ; i--) {
        int j = rand() % lista->quantidade;

        nodo_t * nodo_j = obtem_nodo(lista, j);
        nodo_t * nodo_i = obtem_nodo(lista, i);
        char * aux = nodo_j->valor;
        nodo_j->valor = nodo_i->valor;
        nodo_i->valor = aux;
    }
}

int lista_ordena(lista_t * lista)
{
    if (lista->quantidade > 1) {
        //passo 1: Crie uma lista sequencial
        lista_linear_t * lista_cadeada = lista_linear_cria();

        //passo 2: Copie as strings da lista encadeada para a lista sequencial
        nodo_t * ptr = lista->primeiro;
        int pos = 0;

        while (ptr != NULL) {
            lista_linear_adiciona(lista_cadeada, ptr->valor);
            ptr = ptr->proximo;
            pos++;
        }

        //passo 3: Substitua as strings da lista encadeada pelas strings da lista sequencial, na ordem em que estão na lista sequencial
        lista_linear_ordena(lista_cadeada);

        pos = 0;
        for (ptr=lista->primeiro; ptr != NULL; ptr=ptr->proximo, pos++) {
            char * valor = lista_linear_obtem(lista_cadeada, pos);

            free(ptr->valor);
            ptr->valor = strdup(valor);
        }

        //passo 4: Destrua a lista sequencial
        lista_linear_destroi(lista_cadeada);

        return 1;
    }
}

int lista_inverte(lista_t * lista) {
    if (lista == NULL || lista->quantidade <= 1) {
        return 0; // Lista vazia ou com apenas um elemento, não é necessário inverter
    }

    nodo_t* anterior = NULL;
    nodo_t* atual = lista->primeiro;
    nodo_t* proximo = NULL;

    while (atual != NULL) {
        proximo = atual->proximo;
        atual->proximo = anterior;
        anterior = atual;
        atual = proximo;
    }

    // Atualiza o primeiro e o último nó
    nodo_t* temp = lista->primeiro;
    lista->primeiro = lista->ultimo;
    lista->ultimo = temp;

    return 1; // Sucesso
}