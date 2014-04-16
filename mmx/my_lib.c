void add_array(unsigned char *array, int length, unsigned char increment) {
	for (int i = 0; i < length; i++) {
		array[i] += increment;
	}
}