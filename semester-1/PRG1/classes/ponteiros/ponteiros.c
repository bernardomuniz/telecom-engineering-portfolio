#include <stdio.h>

int main(){

    int number = 15;
    int *ptr; //Declarando um ponteiro.

    ptr = &number; //Atribuindo o endereço físico ao ponteiro

    printf("Conteúdo de number: %d\n", number);
    printf("Endereço de number: %p\n", &number); //0x7ffedc40e27c
    printf("Conteúdo apontado por ptr: %d\n", *ptr); //15
    printf("Endereço apontado por ptr: %p\n", ptr); //0x7ffedc40e27c

    *ptr = 56; //Mudando o conteúdo de number

    printf("\n\n");
    printf("Conteúdo de number: %d\n", number);
    printf("Endereço de number: %p\n", &number); //0x7ffedc40e27c
    printf("Conteúdo apontado por ptr: %d\n", *ptr); //15
    printf("Endereço apontado por ptr: %p\n", ptr); //0x7ffedc40e27c

    *ptr = 100;

    printf("Conteúdo novo do ponteiro: %d\n", *ptr);




    return 0;
}

//PONTEIROS
//*ptr: O conteúdo de outra variável apontado pelo ponteiro
// ptr: Endereço da váriavel apontada pelo ponteiro
// &ptr: Endereço do ponteiro