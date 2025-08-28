#ifndef LIBPRG_THASH_H
#define LIBPRG_THASH_H

#define CAPACIDADE_THASH 31
#define FATOR_CARGA 7
#include <libprg/linearhash.h>
#include <libprg/lista_linear.h>

 // typedef struct {
 //     char * chave;
 //    char * valor;
 // } par_t;

typedef struct {
    lista_linear_hash_t ** tab; // um vetor de par_t*
    int linhas; // quantidade de linhas da tabela
    int quantidade;
    // campos usados para iteração
    int _linha;
} thash_t;

// cria uma tabela hash
// retorna: um ponteiro para a tabela criada
thash_t * thash_cria(); //feito e ok

// destroi uma tabela hash
void thash_destroi(thash_t * tab); //feito e ok

// adiciona um par (chave, valor) à tabela hash
// retorna: 1=sucesso, 0=falha
int thash_adiciona(thash_t * tab, char * chave, char* valor); //feito e ok

// procura um par com determinada chave na tabela, e retorna o valor nele contido
// retorna: o valor, ou NULL em caso de falha
char* thash_obtem(thash_t * tab, char* chave); //feito e ok

char* thash_obtem_chave(thash_t * tab, char* chave);


// remove o par da tabela que contém chave
int thash_remove(thash_t * tab, char* chave); //feito e ok

// testa se tabela está vazia
// retorna: 1 se vazia, 0 caso contrário
int thash_vazia(thash_t * tab); //feito e ok

// Verifica se a chave existe na tabela.
// Retorna: 1=existe, 0=não existe
int thash_existe(thash_t * tab, char * chave); //feito e ok

// retorna a quantidade de pares (chave, valor) contidos na tabela
inline int thash_tamanho(thash_t * tab) {
    return tab->quantidade;
}

// retorna as chaves presentes dentro de uma tabela hash em formato de lista
lista_linear_t * thash_chaves(thash_t * tab);

// retorna os valores presentes dentro de uma tabela hash em formato de lista
lista_linear_t * thash_valores(thash_t * tab);

// para iniciar uma iteração, deve-se chamar esta função
void thash_inicia_iteracao(thash_t * tab);

// para acessar o próximo valor da iteração, chama-se esta outra função
// ela retorna: o valor da próxima iteração, ou NULL em caso de falha ou fim de iteração
par_t * thash_proximo(thash_t * tab);

#endif //LIBPRG_THASH_