#include <stdio.h>
#include <string.h>
#include <threads.h>

#define MAX 100
int main(){
    char palavra[MAX];
    int tamanho = 0;


    printf("Entrada: ");
    scanf("%99s", palavra);

    tamanho = strlen(palavra);


    for (int i = 0; i < tamanho; i++) {
        printf("%c", palavra[1 - tamanho]);
        
    }


    return 0;
}