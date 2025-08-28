//Faça um algoritmo para ler uma string e retorne o número de palavras da mesma.


#include <stdio.h>
#include <string.h>

int main(){
    char palavra[100], espaço[] = {" "};
    int contagem = 0;

    printf("Entre com a palavra: ");
    fgets(palavra, sizeof(palavra),stdin);

    for (int i = 0; i < strlen(palavra);i++) {
        if (palavra[i] == ' ') {
            contagem++;
        }
    }
    printf("Número de palavras: %d\n", contagem);


    return 0;
}