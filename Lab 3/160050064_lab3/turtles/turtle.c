#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>

#define MAX_INPUT_SIZE 1024
#define MAX_TOKEN_SIZE 64
#define MAX_NUM_TOKENS 64

char **tokenize(char *line) {
	char **tokens = (char **)malloc(MAX_NUM_TOKENS * sizeof(char *));
	char *token = (char *)malloc(MAX_TOKEN_SIZE * sizeof(char));
	int i, tokenIndex = 0, tokenNo = 0;

	for(i =0; i < strlen(line); i++){

		char readChar = line[i];

		if (readChar == ' ' || readChar == '\n' || readChar == '\t') {
			token[tokenIndex] = '\0';
			if (tokenIndex != 0){
				tokens[tokenNo] = (char*)malloc(MAX_TOKEN_SIZE*sizeof(char));
				strcpy(tokens[tokenNo++], token);
				tokenIndex = 0; 
			}
		} 
		else {
			token[tokenIndex++] = readChar;
		}
	}
 
	free(token);
	tokens[tokenNo] = NULL ;
	return tokens;
}

void signal_handler(int signal_number) {
	if (signal_number == SIGINT) return;
}

int equal_strings(char *a, char *b) {
	return strcmp(a, b) == 0? 1 : 0;
}

void execute_command(char **tokens) {
	if (tokens[0] == NULL) return;
	else if (strcmp(tokens[0], "exit") == 0) {
		while (wait(NULL) > 0);
		printf("\nClosed all Background processes\n");
		exit(0);
	}

	int argc = 0;
	while (tokens[argc] != NULL) argc++;

	int iter = 0;
	while (iter < argc && !equal_strings(tokens[iter], ">")) iter++;
	int output_redirect = (iter == argc)? 0 : 1;
	if (output_redirect && argc - iter != 2) {
		printf("Multiple files found after > . Check again\n");
		return;
	}

	if (strcmp(tokens[0], "cd") == 0) {
		if (argc != 2) {
			printf("Wrong number of arguments\n");
			return;
		}

		if (chdir(tokens[1]) == -1) {
			printf("Some error\n");
		}
	}
	else {
		pid_t child_pid = fork();
		if (child_pid == 0) {
			char filename[MAX_TOKEN_SIZE];
			if (output_redirect) {
				strcpy(filename, tokens[iter+1]);
				int fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
				dup2(fd, 1);
				close(fd);
				tokens[iter] = NULL;
			}
			if (execvp(tokens[0], tokens) < 0) printf("No command found\n");
			exit(0);
		}
		else {
			pid_t wpid = wait(NULL);
			return;
		}
	}
}


int main() {
	signal(SIGINT, signal_handler);

	char  line[MAX_INPUT_SIZE];            
	char  **tokens;              

	while (1) {
		printf("\nvamsi-turtle> ");     
		bzero(line, MAX_INPUT_SIZE);
		gets(line);

		line[strlen(line)] = '\n';
		tokens = tokenize(line);

		char **temp_tokens = (char **)malloc(MAX_NUM_TOKENS * sizeof(char *));
		int temp_i=0;
		for (int i=0; tokens[i]!=NULL; i++, temp_i++) {
			if (strcmp(tokens[i], ";;") == 0) {
				temp_tokens[temp_i] = NULL;
				execute_command(temp_tokens);
				temp_i = -1;
			}
			else temp_tokens[temp_i] = tokens[i];
		}
		temp_tokens[temp_i] = NULL;
		execute_command(temp_tokens);

		for(int i=0; tokens[i]!=NULL; i++){
			free(tokens[i]);
		}
		free(tokens);
		free(temp_tokens);
	}

}
