#include "types.h"
#include "stat.h"
#include "user.h"

void mutex_lock(int index)
{
	acquire_mutex_spinlock(index);

	while(get_mutex_value(index)){
		cond_wait(index, index);
	}
	set_mutex_value(index, 1);

	release_mutex_spinlock(index);
}

void mutex_unlock(int index)
{
	acquire_mutex_spinlock(index);

	set_mutex_value(index, 0);
	cond_signal(index);

	release_mutex_spinlock(index);
}

int main()
{
	int ret;
	int i;

	init_counters();
	init_mutex();

	for (int child=0; child<10; child++) {
		ret = fork();
		for(i=0; i<1000; i++)
		{
			mutex_lock(child);
			set_var(child, get_var(child)+1);
			mutex_unlock(child);
		}

		if(ret == 0)
		{
			exit();
		}
	}
	if (ret != 0) {
		for (int child=0; child<10; child++)
			wait();

		for (i=0; i<10; i++) {
			int val = get_var(0);
			printf(1, "data[%d] = %d\n", i, val);
		}
		exit();
	}
}

