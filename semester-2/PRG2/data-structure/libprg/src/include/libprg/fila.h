#ifndef LIBPRG_FILA_H
#define LIBPRG_FILA_H

#define FILA_CAPACIDADE 16

typedef struct {
    // atributos da fila
    char* * area;
    int cap;
    int quantidade;
    int inicio, fim;
} fila_t;

// operações da fila

// cria uma fila
// retorna: ponteiro para a fila criada
fila_t* fila_cria(); //feito

// destroi uma fila
void fila_destroi(fila_t * fila); //feito

// adiciona um valor ao final da fila
// resultado: 1=sucesso, 0=falha
int fila_adiciona(fila_t * fila, char* valor); //feito

// desnfileira o valor que está na frente da fila
// resultado: o valor, ou NULL em caso de falha
char* fila_remove(fila_t * fila); //feito

// retorna o valor que está na frente da fila
// resultado: o valor, ou NULL em caso de falha
char* fila_frente(fila_t * fila); //feito

// esvazia uma fila
void fila_limpa(fila_t * fila); //feito

// testa se fila está vazia
int fila_vazia(fila_t * fila); //feito

// retorna o comprimento da fila
int fila_comprimento(fila_t * fila); //feito

//retorna o valor que está no fim da fila
char* fila_fim(fila_t *fila); //feito

#endif //LIBPRG_FILA_H