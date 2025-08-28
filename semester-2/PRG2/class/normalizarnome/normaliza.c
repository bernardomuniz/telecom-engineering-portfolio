#include <stdio.h>
#include <string.h>

#define MAX 100
int main(){
   char nome[MAX], sobrenome[MAX], *p = nome;
    int tamanho;
    int posição;

    printf("Entrada: ");
    fgets(nome, MAX, stdin);
    nome[strcspn(nome, "\n")] = 0;
    tamanho = strlen(nome);
    
    p = strrchr(nome, ' '); //Me da a posição em que se inicia o sobrenome
    posição = p - nome;
    nome[posição] = '\0'; // Me da o nome sem o ultimo sobrenome
    posição += 1;

    for (int  i = 0; i < (tamanho - posição); i++) {
       sobrenome[i] = nome[posição + i];
   }

    printf("%s, %s\n", sobrenome, nome);
    return 0;
}