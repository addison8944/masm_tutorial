#include <stdio.h>

void add_array(unsigned char *array, int length, unsigned char increment);

#define LENGTH 800000000
unsigned char array[LENGTH];

void print_array(unsigned char *array, int length) {
	for (int i = 0; i < 4; i++) {
		printf("%d ", array[i]);
	}
	printf("\n");
}

int main() {
	print_array(array, LENGTH);
	add_array(array, LENGTH, 5);
	print_array(array, LENGTH);
	return 0;
}
