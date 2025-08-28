#include <stdio.h>

//Para converter uma temperatura de graus Celsius para graus Fahrenheit, utiliza-se: TF ​= 1,8TC​+32.
//e para converter uma temperatura de graus Celsius para Kelvin, utiliza-se TK = TC+273,15.

float converte_c_para_f (float c){
    float fahrenheit;
    fahrenheit = 1.8 * c + 32; //Converte de celsius para fahrenheit.
    return fahrenheit;
}

float converte_f_para_c(float f){
    float celsius;
    celsius = (f - 32.0) * 5/9;
    return celsius;
}

float converte_c_para_k(float c){
    float kelvin;
    kelvin = c + 273.15;
    return kelvin;
}

float converte_k_para_c (float k){
    float celsius;
    celsius = k - 273.15;
    return celsius;
}

float converte_f_para_k(float f){
    float kelvin;
    kelvin = converte_f_para_c(f); //Tudo em celsius
    kelvin = converte_c_para_k(kelvin);

    return kelvin;
}

float converte_k_para_f (float k){
    float fahrenheit;
    fahrenheit = converte_f_para_c(k); //Tudo em celsius
    fahrenheit = converte_c_para_f(fahrenheit);

    return fahrenheit;
}

float converte_temperatura (float t, char origem, char destino){
    float temperatura_convertida;

    switch (origem) {
        //Converter de graus celsius para outro grau
        case 'C':
            if (destino == 'F') {
                temperatura_convertida = converte_c_para_f(t);
            }else if (destino == 'K') {
                temperatura_convertida = converte_c_para_k(t);
            }
            break;
        //Converter de fahrenheit para outro grau
        case 'F':
            if (destino == 'C') {
                temperatura_convertida = converte_f_para_c(t);
            }else if (destino == 'K') {
                temperatura_convertida = converte_f_para_k(t);
            }
            break;
        //Converter de kelvin para outro grau
        case 'K':
            if (destino == 'C') {
                temperatura_convertida = converte_k_para_c(t);
            }else if (destino == 'F') {
                temperatura_convertida = converte_k_para_f(t);
            } 
            break;
        default:
            printf("Temperatura inválida");
    }
    return temperatura_convertida;
}


int main (){
    float temperatura;
    char escala_entrada, escala_destino;

    printf("Entre com o valor da temperatura: ");
    scanf("%f", &temperatura);
    printf("Entre com a escala de origem (C, F, K): ");
    scanf(" %c", &escala_entrada);
    printf("Entre com a escala de destino (C, F, K): ");
    scanf(" %c", &escala_destino);
    
    temperatura = converte_temperatura(temperatura, escala_entrada, escala_destino);

    printf("Temperatura convertida: %.2f\n", temperatura);

    return 0;
}