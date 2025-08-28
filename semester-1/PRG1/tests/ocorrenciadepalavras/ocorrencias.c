#include <stdio.h>
#include <string.h>

#define MAX 100
int main(){
    char frase[MAX], substring[MAX], *p = frase;
    int ocorrencia = 0, encontrou = 1;

    printf("Entrada: ");
    fgets(frase, sizeof(frase), stdin);
    printf("Substring: ");
    scanf("%99s", substring);

    while ((p = strstr(p, substring)) != NULL) {
        ocorrencia++;
        p++;
        encontrou = 1;
    }
    if (!encontrou) {
        printf("A substring não está contida na frase!\n");
    }else {
        printf("A substring /%s/ ocorre %d %s\n", substring, ocorrencia, ocorrencia > 1 ? "vezes" : "vez");
    }

    return 0;
}