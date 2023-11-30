#include <stdio.h>
#include "dependencies/header.h"

int main(void) {
    int a = add(1, 2);
    int b = square(a);
    if (b != 9) {
        printf("b is not 9\n");
        return 1;
    }
    printf("hello world\n");
    return 0;
}