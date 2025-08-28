#ifndef LIBPRG_PILHA_H
#define LIBPRG_PILHA_H

#define PILHA_CAPACIDADE 16

typedef struct {
    // atributos da pilha
    char* * area;
    int cap;
    int quantidade;
} pilha_t;

// operações da pilha

// cria uma pilha
// retorna: um ponteiro para a pilha criada
pilha_t* pilha_cria(); //feito

// destroi uma pilha
void pilha_destroi(pilha_t * pilha); //feito

// adiciona um valor ao final da pilha
// resultado: 1=sucesso, 0=falha
int pilha_adiciona(pilha_t * pilha, char* valor); //feito

// desempilha o valor que está na frente da pilha
// resultado: o valor, ou NULL em caso de falha
char* pilha_remove(pilha_t * pilha); //feito

// retorna o valor que está no topo da pilha
// resultado: o valor, ou NULL em caso de falha
char* pilha_topo(pilha_t * pilha); //feito

// esvazia uma pilha
void pilha_limpa(pilha_t * pilha); //feito

// testa se pilha está vazia
int pilha_vazia(pilha_t * pilha); //feito

// retorna o comprimento da pilha
int pilha_comprimento(pilha_t * pilha); //feito


#endif