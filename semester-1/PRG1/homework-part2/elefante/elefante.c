#include <stdio.h>


void elefante(int n){
    switch(n){
        case 1: printf("Um"); break;
        case 2: printf("Dois"); break;
        case 3: printf("Três"); break;
        case 4: printf("Quatro"); break;
        case 5: printf("Cinco"); break;
        case 6: printf("Seis"); break;
        case 7: printf("Sete"); break;
        case 8: printf("Oito"); break;
        case 9: printf("Nove"); break;
        case 10: printf("Dez"); break;    
    }
}

int main(){
    int indice;
    printf("Um elefante incomoda muita gente\n");
    for (int i = 2; i <= 10; i++) {
        elefante(i);
        if (i % 2 == 0) {
            printf(" elefantes");
            for (int j = 0; j < i - 1; j++) {
                printf(" incomodam,");
            }
            printf(" incomodam ");
            printf("muitos mais!\n");
        }else {
            printf(" elefantes incomodam muita gente.\n");
        }
    }
    for (int i = 10; i > 1; i--) {
        elefante(i);
        if (i % 2 == 0) {
            printf(" elefantes incomodam muita gente.\n");
        }else {
            printf(" elefantes");
            for (int k = 0; k < i - 1; k++) {
                printf(" incomodam,");
            }
            printf(" incomodam ");
            printf("muitos menos!\n");
        }
    }
    printf("Um elefante incomoda muito menos!\n");
    
    return 0;
}