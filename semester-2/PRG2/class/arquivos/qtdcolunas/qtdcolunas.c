#include <ctype.h>
#include <stdio.h>

int main(){
    FILE *arquivo = fopen("teste.txt", "r");
    char atual, proximo;
    int colunasatual = 1, colunasproximo = 1;   

    atual = fgetc(arquivo); //Lê o primeiro caractere do arquivo
    
    while (atual != EOF) {
        proximo = fgetc(arquivo);

        if (atual == ',' && (isalnum(proximo))) {
            colunasatual++;
        }
        if (atual == '\n') {
            
        if (atual == ',' && (isalnum(proximo))) {
            colunasproximo++;
        }
        }
        atual = proximo;
    }

    if (colunasatual != colunasproximo) {
        printf("Falso\n");
    }else {
        printf("True\n");
    }



    return 0;
}