#include "types.h"
#include "stat.h"
#include "user.h"

int main() 
{
	int ret = fork();
	if (ret == 0) 
	{
		printf(1, "\nchild: pid %d\n", getpid());
		printf(1, "child: parent pid %d\n", getppid());

		int ret2 = fork();
		if (ret2 == 0) 
		{
			printf(1, "\n[2] grandchild: pid %d\n", getpid());
			printf(1, "[2] grandchild: parent pid %d\n", getppid());

			sleep(400);

			printf(1, "\n[2] grandchild: pid %d\n", getpid());
			printf(1, "[2] grandchild: parent pid %d\n", getppid());
		}
		else 
		{
			sleep(100);

			printf(1, "\nchild: pid %d\n", getpid());
			printf(1, "child: parent pid %d\n", getppid());
		}
	}
	else 
	{
		sleep(1000);

		printf(1, "\nparent: pid %d\n", getpid());
		printf(1, "parent: parent pid %d \n", getppid());
		printf(1, "parent: child pid %d\n", ret);
	}
	
	exit();
}