#include <ctype.h>
#include <stdio.h>
#include <string.h>

#define  MAX 100
int main(){
    char palavra[MAX];
    int vogais = 0, consoantes = 0;
    char letra;

    printf("Entrada: ");
    fgets(palavra, sizeof(palavra), stdin);
    palavra[strcspn(palavra, "\n")] = '\0';

    for (int i = 0; i < strlen(palavra);i++) {
        letra = tolower(palavra[i]);

        if (letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u') {
            vogais++;
        }else {
            consoantes++;
        }
    }
    printf("A string tem %d %s e %d %s\n", consoantes, consoantes > 1 ? "consoantes" : "consoante", vogais, vogais > 1 ? "vogais": "vogal");
    
    



    return 0;
}