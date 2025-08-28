#include <stdio.h>
#include <string.h>
#define MAX 1024

void RemovoEspacoComeco(char frase[]){
    char *p = frase;
    int i;

    while (*p == ' ') {
        p++;
    }
    strcpy(frase, p); //Aqui ele retorna a string sem o espaço no começo

    int tamanho = strlen(frase);
    
    for (i = tamanho - 1; i >= 0; i--) {
        if (frase[i] != ' ') {
            break;
        }
    }
    frase[i + 1] = '\0';


}

void removemeio(char frase[]){
   

}


int main(){
    char s[MAX];

    printf("Entrada: ");
    scanf("%99s", s);
    strcat(s, ";");
    puts(s);


    return 0;
}