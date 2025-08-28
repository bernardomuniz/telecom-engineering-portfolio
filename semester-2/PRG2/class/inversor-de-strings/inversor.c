#include <stdio.h>
#include <string.h>

#define MAX 100
int main(){
    char palavra[MAX];
    int tamanho = 0;

    printf("Entre com a palavra: ");
    scanf("%99s", palavra);

    tamanho = strlen(palavra);

    for (int i = tamanho - 1; i >= 0; i--) {
        printf("%c", palavra[i]);
    }
    printf("\n");

    return 0;
}