#include "types.h"
#include "stat.h"
#include "user.h"


int
main(int argc, char *argv[])
{


	for(int i=0; i<25; i++)
	{
		if(fork() == 0)
		{
			sleep(1000);
			exit();
		}
	}

	char *args[] = {"ps", NULL};

	exec("./ps", args);

	exit();
}
