#include <stdio.h>
#include <string.h>

#define MAX 100
int main(){
    char palavra[MAX];
    int caracteres = 0;

    printf("Entrada: ");
    fgets(palavra, sizeof(palavra), stdin);

    for (int i = 0; i < strlen(palavra); i++) {
        if (palavra[i] != '\0' && palavra[i] != '\n') {
            caracteres++;
        }
    }
    printf("Saída: %d\n", caracteres);
    return 0;
}