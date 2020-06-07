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
		sleep(100);
		exit();
	}
	
	sleep(50);
	
	if(fork() == 0)
	{
		addr = shm_get(5);
		printf(1, "\nChild %d: VA of shared object with key 5: 0x%x \n", getpid(), addr);
		shm_stat();
		exit();
	}


	while (wait() > 0) shm_stat();

	exit();
}