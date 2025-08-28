#include <stdio.h>
#include <math.h>

float seno_bhaskara (float angulo){
    float angulo_seno, numerador, denominador;
    
        if(angulo > 180){
            angulo = 360 - angulo;
        }
        numerador = (4*angulo*(180 - angulo));
        denominador = (40500 - angulo * (180 - angulo));
        angulo_seno = numerador/denominador;
    
        if (angulo > 180) {
            angulo_seno = -angulo_seno;
        }
    return angulo_seno;
}


float seno_real (float angulo){ 
    //Valor real do seno de x calculado pela função sin da biblioteca math.h.
    float angulo_real;

    angulo_real = angulo * M_PI/180;
    angulo_real = sin(angulo_real);

    return angulo_real;
}


int main(){
     float graus, seno_bhask, seno_verdadeiro;

    printf("Entre com o valor do ângulo em graus (0° - 360°): ");
    scanf("%f", &graus);

    seno_bhask = seno_bhaskara(graus);
    seno_verdadeiro = seno_real(graus);

    printf("Valor aproximado do seno: %.4f\n", seno_bhask);
    printf("Valor real do seno: %.4f\n", seno_verdadeiro);

    return 0;
}