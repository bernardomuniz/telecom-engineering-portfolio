#include <stdio.h>


int main(void)
{
    char caracter;
    int num_vogais = 0, num_consoantes = 0;
    printf("Digite uma frase: ");
    scanf("%c", &caracter);
    while (caracter != '\n') {
        if ('A' <= caracter && caracter <= 'Z') {
            caracter += 32; // Converte para minúsculo
        }
        if (caracter == 'a' || caracter == 'e' || caracter == 'i' || caracter == 'o' || caracter == 'u') {
            num_vogais++;
        }
        else if ('a' <= caracter && caracter <= 'z') {
            num_consoantes++;
        }
        scanf("%c", &caracter);
    }
    printf("Numero de vogais: %d\n", num_vogais);
    printf("Numero de consoantes: %d\n", num_consoantes);
    return 0;
}

