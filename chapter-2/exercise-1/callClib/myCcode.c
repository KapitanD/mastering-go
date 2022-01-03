#include <stdio.h>
#include "myCHeader.h"

int add(int x, int y) {
	return x + y;
}

void print_message(char* msg) {
	printf("From C code: %s\n", msg);
}