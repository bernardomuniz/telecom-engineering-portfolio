#include <stdio.h>
#include <string.h>

int main()
{
    FILE *arquivo = fopen("teste.txt", "r"); //Abre o arquivo em modo leitura
    int linhas = 0, caracteres = 0, palavras = 0;
    char ch, frase[10240];
    int nova_linha;

    if (arquivo == NULL) {
        printf("Não foi possível abrir o arquivo\n");
    }
    while ((ch = fgetc(arquivo)) != EOF) {
         if (ch != ' ' && ch != '\n') {
            caracteres++;
        }
        if (ch == '\n') {
            linhas++;
            nova_linha = 1;
        }else {
            nova_linha = 0;
        }
      
    }

    fseek(arquivo, 0, SEEK_SET);

    while (fscanf(arquivo, "%s", frase) == 1) {
        palavras++;
    }

    if (caracteres > 0 && !nova_linha) {
     linhas++;
    }


    printf("Caracteres: %d\n", caracteres);
    printf("Palavras: %d\n", palavras);
    printf("Linhas: %d\n", linhas);


    return 0;
}