#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
	char *addr;

	shm_stat();

	if(fork() == 0)
	{

		addr = shm_get(5);
		printf(1, "\nChild %d: VA of shared object with key 5: 0x%x \n", getpid(), addr);
		shm_stat();

		strcpy(addr, "Hello!!!  How are you parent ? \n");

		sleep(400);		

		printf(1, "Child: Message recevied form parent : %s \n", addr);
		
		exit();
	}

	sleep(200);

	sbrk(5);

	addr = shm_get(5);
//	printf(1, "\nParent %d: address: 0x%x \n", getpid(), addr);
	printf(1, "\nParent %d: VA of shared object with key 5: 0x%x \n", getpid(), addr);
	shm_stat();

	printf(1, "Parent: Message recevied form child : %s \n", addr);

	strcpy(addr, "I'm fine. \n");


	wait();
	exit();
}