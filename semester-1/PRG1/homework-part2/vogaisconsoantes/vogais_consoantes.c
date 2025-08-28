#include <stdio.h>


int main (){
    int i = 0;
    char caractere;
    int vogais = 0, consoantes = 0;
    printf("Entre com uma frase: ");
    scanf("%c", &caractere);
    while (caractere != '\n') {
        if ('A' <= caractere && caractere <= 'Z') {
        caractere += 32;
        }
        if (caractere == 'a' || caractere == 'e' || caractere == 'i' || caractere == 'o' || caractere == 'u') {
            vogais++;
        }else if('a' <= caractere && caractere <= 'z'){
            consoantes++;
        }
        scanf("%c", &caractere);
    }
    printf("Números de vogais: %d\n", vogais);
    printf("Números de consoantes: %d\n", consoantes);


    return 0;
}