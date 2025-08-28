#ifndef LINEARHASH_H
#define LINEARHASH_H

#include <stdint.h>
#define CAPACIDADE_LISTA 8

typedef struct {
    char * chave;
    char * valor;
} par_t;

typedef struct {
    par_t* * area; // um vetor de ponteiros do tipo char*
    int cap; // a capacidade da lista (tamanho da área de armazenamento)
    int quantidade; // quantidade de valores armazenados: quantidade deve ser sempre <= cap
} lista_linear_hash_t;

//Cria uma lista linear hash para armazenar um par
//Retorna a lista se conseguir criar ou NULL se não conseguir criar
lista_linear_hash_t * lista_linear_hash_cria(); //feito e ok

// adiciona um valor ao final da lista_hash
// necessario criar um par com malloc
// resultado: 1=sucesso, 0=falha
int lista_linear_hash_adiciona(lista_linear_hash_t * l, par_t *par); //feito e ok

//procura um valor dentro da lista a a partir da chave, caso a chave for igual vai retornar o valor apontado pela chave
// resultado: NULL = não encontrou/chave errada, valor = se a chave existir e for igual
char *lista_linear_hash_procura_valor(lista_linear_hash_t * l, char* chave); //feito e ok

//retorna a posição de um valor dentro da lista a partir da chave
// resultado: -1= não encontrou , se encontrou vai retornar a posição (!= =1)
int lista_linear_hash_procura_pos(lista_linear_hash_t * l, char* chave); //feito e ok

// testa se a lista está vazia
// 1 = verdadeiro, 0=falso
int lista_linear_hash_vazia(lista_linear_hash_t * l); //feito e ok

//Obtḿ a chave da posição 'pos' - usar em thash_chaves
//Se pos inválida, retorna NULL
char* lista_linear_hash_obtem(lista_linear_hash_t * l, uint32_t pos); //feito e ok

//Obtḿ a valor da posição 'pos' - usar em thash_valores
//Se pos inválida, retorna NULL
char* lista_linear_hash_obtem_valor(lista_linear_hash_t * l, uint32_t pos);

// destroi uma lista_linear
void lista_linear_hash_destroi(lista_linear_hash_t * l);

// esvazia uma lista
void lista_linear_hash_limpa(lista_linear_hash_t * l);

int lista_linear_hash_comprimento(lista_linear_hash_t * l);



#endif //LINEARHASH_H
