#include <stdio.h>
#include <math.h>

float bhaskara (float a, float b, float c){
    float delta, x1;
    delta = pow(b, 2) - 4*a*c;
    x1 = (-b + sqrt(delta))/(2*a); //X1 postivo    return x1;
    return x1;
}

float bhaskara2(float a, float b, float c){
    float delta2,x2;
    delta2 = pow(b, 2) - 4*a*c;
    x2 = (-b - sqrt(delta2))/(2*a); //X1 postivo    return x1;
    return x2;
}

int main(){
    float a, b , c, x1, x2;
    printf("Entre com os coeficientes: ");
    scanf("%f%f%f", &a, &b, &c);

    x1 = bhaskara(a, b, c);
    x2 = bhaskara2(a,b, c);

    printf("X1: %.1f\n", x1);
    printf("X2: %.1f\n", x2);

    return 0;
}