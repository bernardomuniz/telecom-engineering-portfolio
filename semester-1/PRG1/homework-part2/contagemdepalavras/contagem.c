#include <stdio.h>
#include <stdbool.h>


int main(){
    int soma = 0;
    char caracter, espaco, caractere_atual;

    printf("Entre com um texto: ");
    scanf("%c", &caracter);
    while (caracter != '\n') {
        if (('A' <= caracter && caracter <= 'Z') || ('a' <= caracter && caracter <= 'z')) {
            caractere_atual = 1;
        }else {
            caractere_atual = 0;
        }

        if (caracter == ' ') {
            espaco = '1';
        }else{
            espaco = '0';
        }

        if (caractere_atual = '1' && espaco == '1') {
        
        }
        scanf("%c", &caracter);
    }
    printf("Número de palavras: %d\n",soma );

    return 0;
}