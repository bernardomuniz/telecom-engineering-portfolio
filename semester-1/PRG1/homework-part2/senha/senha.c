#include <stdio.h>
#include <stdbool.h>


#define SENHA 314159
#define TENTATIVAS 3
int main(){
    int senha;
    int tentativas;
    bool verificação;

    do {
        printf("Entre com a senha: ");
        scanf("%d", &senha);

        if (senha == SENHA) {
            verificação = true;
            break;
        }else {
            printf("Acesso negado (senha incorreta)\n");
            tentativas++;
        }

        if (tentativas == TENTATIVAS) {
            verificação = false;
            break;
        }
    }while (tentativas != TENTATIVAS);
   
    if (verificação) {
         printf("Acesso autorizado\n");
    }else {
       printf("Sistema bloqueado\n");
    }

    return 0;
}