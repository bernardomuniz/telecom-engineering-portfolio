#include <stdio.h>
#include <string.h>

#define MAX 100
int main(){
    char palavra[MAX];

    printf("Entrada: ");
    fgets(palavra, sizeof(palavra),stdin);
    
    for (int i = strlen(palavra) - 1; i >= 0; i--) {
        printf("%c", palavra[i]);
    }
    puts(" ");
    return 0;
}