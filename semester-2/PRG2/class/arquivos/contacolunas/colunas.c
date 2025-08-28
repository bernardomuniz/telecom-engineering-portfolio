#include <ctype.h>
#include <stdio.h>

int main(){
    FILE *arquivo = fopen("teste.txt", "r");
    char atual, proximo;
    int colunas = 1;   

    atual = fgetc(arquivo); //Lê o primeiro caractere do arquivo
    
    while (atual != EOF) {
        proximo = fgetc(arquivo);

        if (atual == ',' && (isalnum(proximo))) {
            colunas++;
        }
        atual = proximo;
    }
    printf("%d\n", colunas);
    return 0;
}