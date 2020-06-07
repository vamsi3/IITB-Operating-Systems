#include "types.h"
#include "stat.h"
#include "user.h"

#define NWORKERS 2

void task1(int id, int a, int b)
{
	int result;

	sleep(5);
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
	result = a + b;

	sleep(300);
	task_ret(id, result);
}

void task2(int id, int a, int b)
{
	int result;

	sleep(15);
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a * b;
	
	sleep(450);
	task_ret(id, result);
}

void worker_thread()
{
	int count = 0;
	int ret;

	while(1)
	{
		ret = wait_for_task();
		if(ret > 0)
		{
			count ++;
			printf(1, "[%d] Completed %d tasks. Last completed task ID: %d \n", getpid(), count, ret);
		}
		else
		{
			printf(1, "wait for task failed \n");
			exit();
		}
	}
}


int main()
{	
	int result1;
	int result2;
	int result3;
	int pid;
	int pids[NWORKERS];

	init_taskmaster();

	//	Creating N worker threads
	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
		if(pid == 0)
			worker_thread();
						
		pids[i] = pid;
	}

	//	Creating 3 tasks	
	do_task((char *)task1, 100,	10, 11);
	do_task((char *)task2, 101, 20, 21);
	do_task((char *)task1, 102, 30, 31);

	//	Waiting for all tasks to complete
	wait_for_task_to_complete(100, &result1);
	wait_for_task_to_complete(101, &result2);
	wait_for_task_to_complete(102, &result3);

	sleep(100);
	//	Printing the results
	printf(1, "\n\nResult (100): %d.  Result (101): %d. Result (102): %d. \n", result1, result2, result3);

	//	Master process kills all worker processes
	for(int i=0; i<NWORKERS; i++)
		kill(pids[i]);

	for(int i=0; i<NWORKERS; i++)
		wait();

	exit();
}


