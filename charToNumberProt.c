#include <stdio.h>
#include <stdlib.h>

int main() {

    char *digitOne = calloc(sizeof(char), 1);
    char *digitTwo = calloc(sizeof(char), 1);

    //*digitOne = '9';
    //*digitTwo = '9';

    scanf("%c", digitOne);
    scanf("%c", digitTwo);

    conversion:
    int tensDigit = ((int)*digitOne - 48) * (10);
    int onesDigit = ((int)*digitTwo - 48);

    int finalNumber = tensDigit + onesDigit;

    printf("%d\n", finalNumber);

    free(digitOne);
    free(digitTwo);

    return 0;
}