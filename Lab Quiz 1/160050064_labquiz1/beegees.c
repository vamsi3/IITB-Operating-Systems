#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>

#define MAX_INPUT_SIZE 1024
#define MAX_TOKEN_SIZE 64
#define MAX_NUM_TOKENS 64

typedef long long int ll;

char **tokenize(char *line)
{
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

void sig_handler(int signum) {
	if (signum == SIGINT) return;
	if (signum == SIGCHLD) {
		while (1) {
			pid_t pid = waitpid(-1, NULL, WNOHANG);
			if (pid == 0 || pid == -1) break;
			printf("Child %d terminated.\n", pid);
		}
	}
}

void run_command(char **subcommand, ll background) {
	pid_t pid = fork();
	if (pid == 0) {
		if (execvp(subcommand[0], subcommand) == -1) {
			printf("%d error: %s not found\n", getpid(), subcommand[0]);
		}
		exit(0);
	}
	else {
		if (background == 0) wait(NULL);
	}
}


void main(void)
{
	signal(SIGINT, sig_handler);
	signal(SIGCHLD, sig_handler);
	signal(SIGTERM, sig_handler);
    char  line[MAX_INPUT_SIZE];            
    char  **tokens;              
    int i;

    while (1) {           
       
        printf("$> ");     
        bzero(line, MAX_INPUT_SIZE);
        fgets(line, 1024, stdin);
        line[strlen(line)] = '\n';
        tokens = tokenize(line);

        if (tokens[0] != NULL && strcmp(tokens[0], "exit") == 0) {
        	kill(0, SIGTERM);
        	sleep(10);
			while (1) {
				pid_t pid = waitpid(-1, NULL, WNOHANG);
				if (pid == -1) break;
				if (pid != 0) printf("Child %d terminated.\n", pid);
			}
        	exit(0);
        }
   		

        ll background = 0, start = 0;
        for(i=0;tokens[i]!=NULL;i++){
            if (strcmp(tokens[i], "&&") == 0) {
            	background = 1;

            	ll cnt = i-start;
            	if (cnt > 0) {
            		char *subcommand[cnt];
            		for (ll i=0; i<cnt; i++) {
						subcommand[i] = (char *)malloc(MAX_TOKEN_SIZE * sizeof(char));
						strcpy(subcommand[i], tokens[start+i]);
					}
					subcommand[cnt] = NULL;
            		run_command(subcommand, background);
            	}
            	start = i+1;
            }
        }
    	ll cnt = i-start;
    	if (cnt > 0) {
    		char *subcommand[cnt];
	    	for (ll i=0; i<cnt; i++) {
				subcommand[i] = (char *)malloc(MAX_TOKEN_SIZE * sizeof(char));
				strcpy(subcommand[i], tokens[start+i]);
			}
			subcommand[cnt] = NULL;
	        run_command(subcommand, background);
	    }


        for(i=0;tokens[i]!=NULL;i++){
            free(tokens[i]);
        }
        free(tokens);
    }
     

}

                
