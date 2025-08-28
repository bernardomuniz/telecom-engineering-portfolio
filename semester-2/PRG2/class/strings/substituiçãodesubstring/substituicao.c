#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define MAX 100

void substitui(char* texto, char* sub, char* outra, char *resultado) {
    char *p = texto;
    int posicao;
    int i = 0;

    while((p = strstr(p, sub)) != NULL) {
        posicao = p - texto;
        p++;
    }

    while (i != posicao){
        resultado[i] = texto[i];
        i++;
    }
    strcat(resultado, outra);
    int tamanhoNovaString = strlen(resultado); //Tamanho da nova string sem o resto da string original
    int tamanhoStringOriginal = strlen(texto);
    int tamanho = tamanhoStringOriginal - tamanhoNovaString;

    if ((tamanhoStringOriginal - tamanhoNovaString) > 0) { //Ainda faltam caracteres para serem incluidos
        for (int i  = 0; i < (tamanho); i++) {
            resultado[tamanhoNovaString + i] = texto[tamanhoNovaString + i];
        }
    }
    printf("%s\n", resultado);
}

int main(){
    char texto[MAX * 2];
    char sub[MAX];
    char outra[MAX];
    char resultado[MAX];


    printf("Insira a palavra: ");
    fgets(texto, sizeof(texto), stdin);
    texto[strcspn(texto, "\n")] = 0;
    printf("Insira a substring a ser procurada na palavra: ");
    fgets(sub, sizeof(sub), stdin);
    sub[strcspn(sub, "\n")] = 0;
    printf("Insira a substring a ser substituida: ");
    fgets(outra, sizeof(outra), stdin);
    outra[strcspn(outra, "\n")] = 0;

    substitui(texto, sub, outra, resultado);
}