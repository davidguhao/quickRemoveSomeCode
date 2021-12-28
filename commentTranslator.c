#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
	char *input;

	if(argc == 1) {
		input = malloc(512);
		fgets(input, 512, stdin);
	} else if(argc == 2)
		input = argv[1];
	else {
		puts("Not supported.");
		return 1;
	}

	// startNode-skklfiownvkldklwo
	char output[256];

	int index_output = 0;
	for(int i = 0; input[i] != 0 && input[i] != '\n' && i < 100; i++) {
		char current = input[i];
		if(current == '/') {
			output[index_output] = '\\';
			output[index_output + 1] = '/';
			index_output++;
			index_output++;
		} else {
			output[index_output] = input[i];
			index_output++;
		}
	}
	output[index_output] = 0;
	puts(output);
	// endNode-skflwvnownfkvnwowkd

	if(argc == 1) 
		free(input);
	return 0;
}
