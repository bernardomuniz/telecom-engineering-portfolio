#include <stdio.h>
#include <string.h>

int main()
{
    FILE *arquivo = fopen("teste.txt", "r");
    char palavra[100];
    char *p;
    char frase[1024];
    int encontrou = 0;

    if (arquivo == NULL) {
        printf("Não foi possível abrir o arquivo\n");
    } else {
        printf("Entre com a palavra a ser procurada no texto: ");
        scanf("%99s", palavra);

        while (fgets(frase, sizeof(frase), arquivo) != NULL) {
            p = frase;
            while ((p = strstr(p, palavra)) != NULL) {
                printf("%s", frase);
                p++;
                encontrou = 1;
            }
        }
        if (!encontrou) {
            puts("A palavra não está contida dentro do texto!");
        }
    }

    return 0;
}