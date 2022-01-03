#include <stdio.h>
#include "usedByC.h"

int main() {
    GoInt x = 12;
	GoInt y = 23;
    printf("About to call a Go function!\n");
    PrintMessage();

	GoInt p = Square(x);
    printf("Square: %d\n",(int)p);
    printf("It worked!\n");
    return 0;
}