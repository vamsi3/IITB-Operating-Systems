#include "types.h"
#include "stat.h"
#include "user.h"

int MAX_LIMIT = 10;

int read_inputfile(char *filename, char *actions, int *sleeptimes)
{
	int fd;
	int bufferSize = 1024;
	int bytesRead;
	char buffer[bufferSize];

	fd = open(filename, 0);
	bytesRead = read(fd, buffer, bufferSize);

	// find number of lines
	int line_count = 0;
	for (int i = 0; i < bytesRead; i++)
	{
		if (buffer[i] == '\n')
		{
			line_count++;
		}
		else if (i == bytesRead - 1)
		{
			line_count++;
		}
	}

	int index = 0;
	int prev = 0;
	for (int i = 0; i < bytesRead; i++)
	{
		if (buffer[i] == '\n' || (buffer[i] != '\n' && i == bytesRead - 1))
		{
			if (buffer[prev] == 'P' || buffer[prev] == 'C')
			{
				actions[index] = buffer[prev];
			}
			else
			{
				printf(1, "incorrect format of input file [No extra newlines]\n");
				return 0;
			}
			prev++;
			while (buffer[prev] > '9' || buffer[prev] < '0')
				prev++;
			int temp = 0;
			while (buffer[prev] <= '9' && buffer[prev] >= '0')
			{
				temp *= 10;
				temp += buffer[prev] - '0';
				prev++;
			}
			sleeptimes[index] = temp;
			index++;
			prev = i + 1;
		}
	}
	return line_count;
}

void produce(void)
{
	acquire_mutex_spinlock(0);
	if (get_mutex_value(0) >= MAX_LIMIT) cond_wait(1, 0);
	set_mutex_value(0, get_mutex_value(0)+1);
	printf(1, "[%d]: Produced an item. Curernt buffer size: %d\n", getpid(), get_mutex_value(0));
	cond_signal(2);
	release_mutex_spinlock(0);
}

void consume(void)
{
	acquire_mutex_spinlock(0);
	if (get_mutex_value(0) <= 0) cond_wait(2, 0);
	set_mutex_value(0, get_mutex_value(0)-1);
	printf(1, "[%d]: Consumed an item. Curernt buffer size: %d\n", getpid(), get_mutex_value(0));
	cond_signal(1);
	release_mutex_spinlock(0);
}

int main(int argc, char *argv[])
{
	int  pid;
	int count;
	int sleep_times[40];
	char action[40];

	if(argc < 3)
	{
		printf(1, "./prodcon <input1.txt> <input2.txt> \n");
		exit();    
	}

	init_mutex();
	pid = fork();

	if(pid == 0)
	{
		count = read_inputfile(argv[1], action, sleep_times);
		// printf(1, "[%d]: Number of operation: %d \n", getpid(), count);
	}
	else
	{
		count = read_inputfile(argv[2], action, sleep_times);
		// printf(1, "[%d]: Number of operation: %d \n", getpid(), count);
	}

	for(int i=0; i < count; i++)
	{
		if(action[i] == 'P')
			produce();
		else if(action[i] == 'C')
			consume();

		sleep(sleep_times[i]);
	}

	if(pid == 0)
		exit();

	wait();
	exit();
}
