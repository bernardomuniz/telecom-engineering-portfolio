#ifndef LISTA_ENCADEADA_H
#define LISTA_ENCADEADA_H
#endif //LISTA_ENCADEADA_H
#include <stdint.h>

struct NODO {
    char * valor;
    struct NODO * proximo;
};

typedef struct NODO nodo_t;

typedef struct {
    nodo_t * primeiro, * ultimo;
    int quantidade;
} lista_t;

// cria uma lista vazia
lista_t* lista_cria(); //feito

// destroi uma lista
void lista_destroi(lista_t * lista); //feito

// adiciona um valor ao final da lista
// resultado: 1=sucesso, 0=falha
int lista_adiciona(lista_t * lista, char* valor); //feito

// insere um valor em uma posição da lista
// resultado: 1=sucesso, 0=falha
int lista_insere(lista_t * lista, uint32_t  pos, char* valor); //feito

// remove um valor de uma posição da lista
// resultado: 1=sucesso, 0=falha
int lista_remove(lista_t * lista, uint32_t pos); //feito

// remove um valor do final da lista
// resultado: 1=sucesso, 0=falha
int lista_remove_final(lista_t * lista);

// procura um valor dentro da lista
// retorna: a posição do valor encontrado (em caso de falha, retorna -1)
int lista_procura(lista_t * lista, char * valor); //feito

// retorna o valor que está na posição da lista
// Retorna: o valor, ou NULL em caso de falha
char* lista_obtem(lista_t * lista, uint32_t pos); //feito

// retorna o valor que está no início da lista
// Retorna: o valor, ou NULL em caso de falha
char* lista_obtem_primeiro(lista_t * lista); //feito

// retorna o valor que está no final da lista
// Retorna: o valor, ou NULL em caso de falha
char* lista_obtem_ultimo(lista_t * lista); //feito

// substitui o valor que está nesta posição da lista
// Retorna: 1=sucesso, 0=falha
int lista_substitui(lista_t * lista, uint32_t pos, char * valor);

// esvazia uma lista
void lista_limpa(lista_t * lista); //feito

// testa se lista está vazia
int lista_vazia(lista_t * lista); //feito

int lista_comprimento(lista_t * lista); //feito

void lista_embaralha(lista_t * lista); //feito

int lista_ordena(lista_t * lista);//feito

int lista_inverte(lista_t * lista); //feio