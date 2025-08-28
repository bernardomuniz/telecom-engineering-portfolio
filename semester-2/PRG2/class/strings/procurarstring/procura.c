#include <stdio.h>
#include <string.h>


#define MAX 100
int main(){
    char frase[MAX], palavra[MAX];
    char *p = frase;
    int encontrou = 0;

    printf("Entre com a frase: ");
    fgets(frase, sizeof(frase),stdin);
    printf("Entre com a palavra a ser procurada dentro da frase: ");
    scanf("%99s", palavra);

    while ((p = strstr(p, palavra)) != NULL) {
        printf("Encontrado  na posição: %ld\n",p - frase );
        p++;
        encontrou = 1;
    }

    if (!encontrou) {
        printf("Palavra não encontrada.\n");
    }

    return 0;
}