#include "types.h"
#include "stat.h"
#include "user.h"

void mutex_lock(int index)
{
	/*
		Todo
	*/
}

void mutex_unlock(int index)
{
	/*
		Todo
	*/
}

int main(int argc, char* argv[])
{
	int ret;
	int with_locks;

	with_locks = 0;
	if(argc == 2 && atoi(argv[1]) == 2 )
		with_locks = 1;

	init_counters();
	init_mutex();

	ret = fork();				//	Two process update shared counter

	for (int j=0; j<10000; j++) 
	{
		if(with_locks)
			mutex_lock(0);

		set_var(0, get_var(0)+1);
		
		if(with_locks)
			mutex_unlock(0);
	}

	if(ret == 0)
		exit();

	wait();

	printf(1, "\nCounter %s lock \n", with_locks ? "with mutex": "without");
	printf(1, "Data[0] = %d\n\n", get_var(0));

	exit();
}

