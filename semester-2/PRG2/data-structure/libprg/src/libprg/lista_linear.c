#include <libprg/lista_linear.h>
#include <string.h>
#include <stdlib.h>

lista_linear_t *lista_linear_cria() {
    lista_linear_t *lista = malloc(sizeof(lista_linear_t)); //Criação da lista dinamicamente
    //malloc: quanto de memoria eu quero armazenar
    lista->quantidade = 0;
    lista->cap = CAPACIDADE_LISTA;
    lista->area = calloc(CAPACIDADE_LISTA, sizeof(char *));

    return lista;
}

//Static: não vou conseguir usar em outros códigos, só aqui
//Return 1 = sucesso, return 0 = falha;
//Expande a lista dobrando suza capacidade de armazenamento
static int lista_linear_expande(lista_linear_t *l) {

       l->cap *= 2;
        int cap2 = l->cap *sizeof(char*);
        void *p = realloc(l->area, cap2);

    if (p == NULL) {
        return 0;
    }
    l->area = p; //l aponta para a nova área p
    return 1;

}

int lista_linear_adiciona(lista_linear_t *l, char *valor) { //Adiciona um valor ao final da sequencia, ao final da lista

    //Se a lista estiver cheia, retorna 0
    if (l->quantidade == l->cap) {
        if (!lista_linear_expande(l)) {
            return 0;
        }
    }
    l->area[l->quantidade] = strdup(valor);
    l->quantidade++;
    return 1;
}

//Obtḿ o valor da posição 'pos'
//Se pos inválida, retorna NULL
char* lista_linear_obtem(lista_linear_t * l, uint32_t pos)
{
    if (pos >= l->quantidade) {
        return NULL;
    }else {
        return l->area[pos];
    }
}

char* lista_linear_ultimo(lista_linear_t * l) {
    if (l->quantidade == 0) {
        return NULL;
    }else {
        return l->area[l->quantidade - 1];
    }
}
int lista_linear_vazia(lista_linear_t * l)
{
    return (l->quantidade == 0);
}

int lista_linear_comprimento(lista_linear_t * l) {
    return l->quantidade;
}

char* lista_linear_primeiro(lista_linear_t * l) {
    if (l->quantidade == 0) {
        return NULL;
    }else {
        return l->area[0];
    }
}

// procura um valor na lista sequencial
// resultado: -1=falha, >=0: posição do valor
int lista_linear_procura(lista_linear_t * l, char* valor) {
    if (l->quantidade == 0) {
        return 0;
    };
    int i;
    for (i = 0; i < l->quantidade; i++) {
        if (!strcmp(l->area[i], valor)) {
            return i;
        }
    }
    return -1;

    }

int lista_linear_remove(lista_linear_t * l, char* valor) {
    int posicao = lista_linear_procura(l, valor);
    if (posicao < 0) {
        return 0;
    }
    //obtive a posicao do valor que eu quero remover
    free(l->area[posicao]); //Libera a posição no lugar que vai ser copiado a string
    l->quantidade--;
    l->area[posicao] = l->area[l->quantidade];
   return 1;
};


// esvazia uma lista
void lista_linear_limpa(lista_linear_t * l) {
    for (int i = 0; i < l->quantidade; i++) {
        free(l->area[i]);
    }
    l->quantidade = 0;

}

void lista_linear_destroi(lista_linear_t * l) {
    lista_linear_limpa(l);
    free(l->area);
    free(l);

};

// Usar para ordenamento de strings
void  lista_linear_ordena(lista_linear_t * l) {
    if (l->quantidade < 2) {
        return;
    }
    for(int j = l->quantidade; j > 1; j--) {
        for(int i = 0; i < (j-1); i++) {
            if(strcmp(l->area[i], l->area[i+1]) > 0) {
                char *aux = l->area[i + 1];
                l->area[i+1] = l->area[i];
                l->area[i] = aux;

            }
        }
    }
}


int procura_ordenada(lista_linear_t * l, char* valor) {
    lista_linear_ordena(l); // Ordena a lista
    int inicio = 1, meio, fim;
    fim = l->quantidade;

    while (inicio <= fim) {
        meio = inicio + (fim - inicio)/2;
        if (strcmp(l->area[meio], valor) == 0) {
            return meio;
        }else if (strcmp(l->area[meio], valor) < 0) {
            inicio = meio + 1;
        }else {
            fim = meio - 1;
        }
    }
    return -1;
};

//Usar para ordenamento de números em formato de string
// ex: "1", "2", "3" e etc
void lista_linear_ordena_num(lista_linear_t *l) {
    if (l == NULL || l->quantidade < 2 || l->area == NULL) {
        return;
    }

    int troca_feita;
    for (int j = l->quantidade; j > 1; j--) {
        troca_feita = 0;

        for (int i = 0; i < (j - 1); i++) {
            // Converte as strings para inteiros antes de comparar
            int num1 = atoi(l->area[i]);
            int num2 = atoi(l->area[i + 1]);

            if (num1 > num2) {  // Comparação numérica
                char *aux = l->area[i];  // Troca os ponteiros das strings
                l->area[i] = l->area[i + 1];
                l->area[i + 1] = aux;

                troca_feita = 1;
            }
        }

        if (!troca_feita) {
            break;
        }
    }
}
