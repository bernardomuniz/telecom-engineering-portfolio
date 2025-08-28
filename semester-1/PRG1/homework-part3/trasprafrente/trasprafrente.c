//Escreva um algoritmo que receba uma frase e a retorne escrita de trás pra frente.
#include <stdio.h>
#include <string.h>


int main(){
    char frase[100];
    int tamanho;

    printf("Entre com a frase: ");
    fgets(frase, sizeof(frase),stdin);

    tamanho = strlen(frase);

    for (int i = tamanho - 1; i >= 0 ; i--) {
        printf("%c", frase[i]);
    }
    printf("\n");
}