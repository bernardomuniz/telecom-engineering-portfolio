#ifndef LISTA_LINEAR_H
#define LISTA_LINEAR_H

#include <stdint.h>
#define CAPACIDADE_LISTA 8
typedef struct {
    // atributos da lista_linear linear
    char* * area; // um vetor de ponteiros do tipo char*
    int cap; // a capacidade da lista (tamanho da área de armazenamento)
    int quantidade; // quantidade de valores armazenados: quantidade deve ser sempre <= cap
} lista_linear_t;

// cria uma lista_linear vazia
// retorna: um ponteiro para a lista que foi criada, ou NULL se ocorrer um erro
lista_linear_t * lista_linear_cria(); //feito

// destroi uma lista_linear
void lista_linear_destroi(lista_linear_t * l);

// esvazia uma lista
void lista_linear_limpa(lista_linear_t * l);

// adiciona um valor ao final da lista_linear
// resultado: 1=sucesso, 0=falha
int lista_linear_adiciona(lista_linear_t * l, char* valor); //feito

// remove um valor da lista_linear
// resultado: 1=sucesso, 0=falha
int lista_linear_remove(lista_linear_t * l, char* valor); //feito

// remove o último valor da lista_linear
// resultado: 1=sucesso, 0=falha
int lista_linear_remove_ultimo(lista_linear_t * l); //feito

// procura um valor na lista sequencial
// resultado: -1=falha, >=0: posição do valor
int lista_linear_procura(lista_linear_t * l, char* valor); //feito

//Só funciona se a lista estiver ordenada
//Busca binária
//Retorna : a posição encontrada, se o valor existir.
//-1, se o valor não existir na lista
int procura_ordenada(lista_linear_t * l, char* valor);

// obtém valor da posição "pos"
/// se pos inválida, retorna NULL
char* lista_linear_obtem(lista_linear_t * l, uint32_t pos); //feito

// obtém valor no fim da lista
/// se lista vazia, retorna NULL
char* lista_linear_ultimo(lista_linear_t * l); //feito

// obtém valor no início da lista
/// se lista vazia, retorna NULL
char* lista_linear_primeiro(lista_linear_t * l); //feito

// retorna 1 se lista estiver vazia, e 0 caso contrário
int lista_linear_vazia(lista_linear_t * l); //feito

// retorna o comprimento da lista
int lista_linear_comprimento(lista_linear_t * l); //feito

// Usar para ordenamento de strings
void lista_linear_ordena(lista_linear_t * l);

//Usar para ordenamento de números em formato de string
// ex: "1", "2", "3" e etc
void lista_linear_ordena_num(lista_linear_t *l);

#endif
