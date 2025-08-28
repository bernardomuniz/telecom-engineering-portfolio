#include <stdio.h>
#include <string.h>

int main(){
    char palavra1[100], palavra2[100];

    printf("Entre com a primeira palavra: ");
    fgets(palavra1, sizeof(palavra1), stdin);
    printf("Entre com a segunda palavra: ");
    fgets(palavra2, sizeof(palavra2),stdin);

    if (strcmp(palavra1, palavra2) == 0) {
        printf("As duas palavras são iguais!\n");
    }else {
        printf("As duas palavras não são iguais!\n");
    }




    return 0;
}