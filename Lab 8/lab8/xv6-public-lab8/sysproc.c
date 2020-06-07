#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

	int
sys_fork(void)
{
	return fork();
}

	int
sys_exit(void)
{
	exit();
	return 0;  // not reached
}

	int
sys_wait(void)
{
	return wait();
}

	int
sys_kill(void)
{
	int pid;

	if(argint(0, &pid) < 0)
		return -1;
	return kill(pid);
}

	int
sys_getpid(void)
{
	return myproc()->pid;
}

	int
sys_sbrk(void)
{
	int addr;
	int n;

	if(argint(0, &n) < 0)
		return -1;
	addr = myproc()->sz;
	if(growproc(n) < 0)
		return -1;
	return addr;
}

	int
sys_sleep(void)
{
	int n;
	uint ticks0;

	if(argint(0, &n) < 0)
		return -1;
	acquire(&tickslock);
	ticks0 = ticks;
	while(ticks - ticks0 < n){
		if(myproc()->killed){
			release(&tickslock);
			return -1;
		}
		sleep(&ticks, &tickslock);
	}
	release(&tickslock);
	return 0;
}

// return how many clock tick interrupts have occurred
// since start.
	int
sys_uptime(void)
{
	uint xticks;

	acquire(&tickslock);
	xticks = ticks;
	release(&tickslock);
	return xticks;
}


/*************** Lab 8 ***************/
/*

#define NLOCKS 20             

struct mutex
{
int value;    // stores lock state if used as mutex and 
// stores buffer size for producer-consumer
struct spinlock s;
};

struct mutex m[NLOCKS];       
int counters[NLOCKS];         //  Shared counters


int 
sys_acquire_mutex_spinlock(void)
{
	//    todo
	// . . .
	// . . .

	// spinlock_acquire(...);       // defined in spinlock.c

	// . . .
	// . . .

}

int 
sys_release_mutex_spinlock(void)
{
	//    todo    
	// . . .
	// . . .
	//  spinlock_release(...);      // defined in spinlock.c
	// . . .
	// . . .

}

int
sys_cond_wait(void)
{
	//    todo    
	// . . .
	// . . .
	// cv_sleep(...);               // defined in proc.c
	// close duplicate of xv6 sleep 
	// . . .
	// . . .
}

int 
sys_cond_signal(void)
{
	//    todo    
	// . . .
	// . . .
	// wakeup(...);               // Use existing xv6 wake up
	// . . .
	// . . .

}

int 
sys_get_mutex_value(void)
{
	// . . .
	// . . .
	//    todo    
	// . . .
	// . . .
}


	int 
sys_set_mutex_value(void)
{
	// . . .
	// . . .

	//    todo    
	// . . .
	// . . .

}


	int 
sys_init_mutex(void)
{
	// . . .
	// . . .

	//    todo    
	// . . .
	// . . .
}


	int 
sys_init_counters(void)
{
	// . . .
	// . . .
	//    todo    
	// . . .
	// . . .
}

int sys_get_var(void)
{
	// . . .
	// . . .
	//    todo    
	// . . .
	// . . .
}


	int 
sys_set_var(void)
{
	// . . .
	// . . .
	//    todo    
	// . . .
	// . . .
}

*/
/*************** Lab 8 ***************/
