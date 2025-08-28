#include <stdio.h>

int main(){

    char caractere;
    int total = 0;
    printf("Digite uma frase: ");
    scanf("%c", &caractere); //O programa lê o primeiro caractere fora do loop para iniciar a variável caractere
    while(caractere != '\n'){ //o progrma vai ler os caracteres enquanto o usuário não digitar ENTER, que em ASCII é \n
        scanf("%c", &caractere); 
        total++;
    }
    printf("Caractere: %d\n",total);
    return 0;
}