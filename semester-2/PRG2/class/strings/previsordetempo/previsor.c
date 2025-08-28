#include <stdio.h>
#include <string.h>


#define MAX  1024
int main(){
  char barometro[MAX], termometro[MAX];
  int tot;

  printf("Barometro: ");
  fgets(barometro,sizeof(barometro), stdin);
  printf("Termometro: ");
  fgets(termometro, sizeof(termometro),stdin);

  if ((strcmp(barometro, termometro) == 0)) {
    printf("Tempo bom, ventos quentes e secos\n");
  }




  return 0;
}