#include <stdlib.h>
#include <libprg/thash.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <libprg/linearhash.h>
#include <libprg/lista_linear.h>

// função de calculo de hash
uint32_t hash_simples(char* chave, int N) {
    uint32_t soma = 0;
    uint8_t * c=(uint8_t *)chave;

    for (; *c != 0; c++) {
        soma = ((soma << 8) + *c) % N;
    }
    return soma % N;  // retorna exatamente a linha onde a chave se encontra
}

par_t *cria_par (char *chave, char* valor)
{
    par_t *par = malloc(sizeof(par_t));
    if (par == NULL)
    {
        return NULL;
    }
    par->chave = strdup(chave);
    par->valor = strdup(valor);
    return par;
}


thash_t * thash_cria() {
    thash_t * tab = malloc(sizeof(thash_t));
    if (tab != NULL) {
        tab->linhas = CAPACIDADE_THASH;
        tab->quantidade = 0;
        //Cria tabela, usa calloc para que cada posição seja preenchida com NULL
        tab->tab = calloc(CAPACIDADE_THASH, sizeof(par_t*));
        for (int i = 0; i < CAPACIDADE_THASH; i++) {
            tab->tab[i] = lista_linear_hash_cria();
        }
    }
    return tab;
}

// adiciona um par (chave, valor) à tabela hash
// retorna: 1=sucesso, 0=falha
 int thash_adiciona(thash_t * tab, char * chave, char* valor) {
     // calcula o hash da chave - Número da linha onde a chave se encontra
     uint32_t linha =  hash_simples(chave, tab->linhas);
     int pos = lista_linear_hash_procura_pos(tab->tab[linha], chave);

     if (pos != -1) {
         tab->tab[linha]->area[pos]->valor = valor; //se quiser adicionar um valor a uma chave que ja existe
         return 1;
     }

    par_t *par = cria_par(chave, valor);
    if (par == NULL)
    {
        return 0;
    }
    lista_linear_hash_adiciona(tab->tab[linha], par);
    tab->quantidade++;
    return 1;
 };

// procura um par com determinada chave na tabela, e retorna o valor nele contido
// retorna: o valor, ou NULL em caso de falha
char* thash_obtem(thash_t * tab, char* chave) {
    // calcula o hash da chave
    uint32_t linha =  hash_simples(chave, tab->linhas);
    int pos = lista_linear_hash_procura_pos(tab->tab[linha], chave);

    if (pos != -1) {
        return tab->tab[linha]->area[pos]->valor;
    }

    // retorna NULL em qualquer caso
    return NULL;
};


char* thash_obtem_chave(thash_t * tab, char* chave)
{
    uint32_t linha =  hash_simples(chave, tab->linhas);
    int pos = lista_linear_hash_procura_pos(tab->tab[linha], chave);

    if (pos != -1) {
        return tab->tab[linha]->area[pos]->chave;
    }

    // retorna NULL em qualquer caso
    return NULL;
};


// remove o par da tabela que contém chave
int thash_remove(thash_t * tab, char* chave)
{
    uint32_t linha =  hash_simples(chave, tab->linhas);
    int pos = lista_linear_hash_procura_pos(tab->tab[linha], chave);

    if (pos != -1)
    {
        free(tab->tab[linha]->area[pos]->valor);
        free(tab->tab[linha]->area[pos]->chave);
        tab->quantidade--;

        return 1;
    }

    return 0;
};

// testa se tabela está vazia
// retorna: 1 se vazia, 0 caso contrário
int thash_vazia(thash_t * tab)
{
        if (tab->quantidade == 0)
    {
        return 1; // tabela vazia
    }
    return 0;
};

// Verifica se a chave existe na tabela.
// Retorna: 1=existe, 0=não existe
int thash_existe(thash_t * tab, char * chave)
{
    uint32_t linha =  hash_simples(chave, tab->linhas);
    int pos = lista_linear_hash_procura_pos(tab->tab[linha], chave);

    if (pos != -1)
    {
        return 1; //Se ele encontrou a posição, então a chave existe
    }
    return 0;
};

// destroi uma tabela hash
void thash_destroi(thash_t * tab)
{
    for (int i = 0; i < tab->quantidade; i++)
    {
        free(tab->tab[i]);
    }
    tab->quantidade = 0;
    free(tab->tab);
    free(tab);
};

// retorna as chaves presentes dentro de uma tabela hash em formato de lista
lista_linear_t * thash_chaves(thash_t * tab)
{
    if (tab == NULL)
    {
        return NULL;
    }
    lista_linear_t * chaves = lista_linear_cria();
    for (int i = 0; i < tab->linhas; i++)
    {
        lista_linear_hash_t * hash = tab->tab[i];
        for (int j = 0; j < lista_linear_hash_comprimento(hash); j++)
        {
            char *key = lista_linear_hash_obtem(hash,j ); // aqui a função da lista_hash deve retornar l->area[pos]->chave
            lista_linear_adiciona(chaves, key);
        }
    }

    return chaves;
};

// retorna os valores presentes dentro de uma tabela hash em formato de lista
lista_linear_t * thash_valores(thash_t * tab)
{
    if (tab == NULL)
    {
        return NULL;
    }
    lista_linear_t * valores = lista_linear_cria();
    for (int i = 0; i < tab->linhas; i++)
    {
        lista_linear_hash_t * hash = tab->tab[i];
        for (int j = 0; j < lista_linear_hash_comprimento(hash); j++)
        {
            char *value = lista_linear_hash_obtem_valor(hash,j );
            lista_linear_adiciona(valores, value);
        }
    }

    return valores;
};





