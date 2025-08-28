#include <stdio.h>

int main(){

    float valor_negociado, comissão;

    printf("Entre com o valor negociado: ");
    scanf("%f", &valor_negociado);

    if(valor_negociado < 2500.0){
        comissão = (0.017 * valor_negociado) + 30.0;
        
        if (comissão < 39.0) {
            comissão = 39.0;
        }else {
            comissão = comissão;
        }
    }else if (valor_negociado < 6250.0) {
        comissão = (0.0066 * valor_negociado) + 56.0;
        if (comissão < 39.0) {
            comissão = 39.0;
        }else {
            comissão = comissão;
        } 
    }else if (valor_negociado < 20000.0) {
        comissão = (0.0034 * valor_negociado) + 76.0;
         if (comissão < 39.0) {
            comissão = 39.0;
        }else {
            comissão = comissão;
        } 
    }else if (valor_negociado < 50000) {
        comissão = (0.0022 * valor_negociado) + 100.0;

        if (comissão < 39.0) {
            comissão = 39.0;
        }else {
            comissão = comissão;
        } 
    }else if (valor_negociado < 500000.0) {
       comissão = (0.0011 * valor_negociado) + 155.0; 
        if (comissão < 39.0) {
            comissão = 39.0;
        }else {
            comissão = comissão;
        } 
    }else{
        comissão = (0.0009 * valor_negociado) + 255.0; 
        if (comissão < 39.0) {
            comissão = 39.0;
        }else {
            comissão = comissão;
        } 
    }

    printf("Taxa de corretagem: $%.2f\n", comissão);
    return 0;
}