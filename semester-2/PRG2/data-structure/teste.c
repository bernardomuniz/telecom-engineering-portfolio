#include <stdio.h>
#include <string.h>
#include <libprg/libprg.h>

#include "libprg/thash.h"


int main() {
    thash_t *t = thash_cria();

    for (int i = 0; i < 10; i++)
    {
        char key[10];
        sprintf(key, "%d", i);
        thash_adiciona(t,key, "0");
    }



    lista_linear_t *l;
    l = thash_chaves(t);

    if(l->quantidade == 0)
    {
        printf("Não foi printado nada pois sua lista tem uma quantidade de %d elementos\n", l->quantidade);
    }else
    {
        for (int i = 0; i < l->quantidade; i++){

            printf("Chave %s\n", lista_linear_obtem(l, i));
        }
    }

    return 0;
}


// int main(int argc, char *argv[]) {
//     FILE *fp = fopen(argv[1], "r");
//
//     if (fp == NULL)
//     {
//         perror("Error opening file");
//     }
//
//     thash_t *t = thash_cria();
//     char matricula[1024];
//
//     while (fgets(matricula, sizeof(matricula), fp) != NULL)
//     {
//         const char *ans = thash_obtem(t, matricula);
//
//         if (ans == NULL)
//         {
//             // se a a matrícula não existir dentro da minha tabela, tenho que adicionar ela
//             // a matrícula lida é igual a minha chave
//             thash_adiciona(t, matricula, "0");
//         }
//     }
//     fclose(fp);
//
//     lista_linear_t * l = thash_chaves(t); //obtenho todas as minhas chaves em uma lista linear
//     lista_linear_ordena(l); // ordeno as matrículas
//
//     for (int i = 0; i < l->quantidade; i++)
//     {
//         printf("Matrícula %d: %s",i, lista_linear_obtem(l, i));
//     }
//
//     lista_linear_destroi(l);
//
//     return 0;
// }
