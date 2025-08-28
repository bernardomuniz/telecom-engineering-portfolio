#include <stdio.h>
#include <string.h>

void captura (char fra[], char pala[]){
    char *p;
    for (int i = 0; i < strlen(fra);i++) {
        p = strstr(fra, pala);
        if (p != NULL) {
            int posicao = p - fra;
            printf("%d\n", posicao);
        }else {
            printf("-1\n");
        }
    }

}

#define MAX 100
int main(){
    char frase[MAX], palavra[MAX];

    printf("Entre com uma frase: ");
    fgets(frase, sizeof(frase),stdin);
    printf("Entre com a palavra a ser procurada na frase: ");
    fgets(palavra, sizeof(palavra), stdin);
    captura(frase, palavra);


    return 0;
}