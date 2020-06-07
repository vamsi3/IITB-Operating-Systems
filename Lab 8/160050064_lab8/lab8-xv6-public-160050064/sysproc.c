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
	int index;
	if(argint(0, &index) < 0) return -1;
	if (index < 0 || index >= NLOCKS) return -1;

	spinlock_acquire(&m[index].s);       // defined in spinlock.c
	return 1;
}

int 
sys_release_mutex_spinlock(void)
{
	int index;
	if(argint(0, &index) < 0) return -1;
	if (index < 0 || index >= NLOCKS) return -1;
	
	spinlock_release(&m[index].s);      // defined in spinlock.c
	return 1;
}

int
sys_cond_wait(void)
{
	int variable, index;
	if(argint(0, &variable) < 0) return -1;
	if(argint(1, &index) < 0) return -1;
	if (index < 0 || index >= NLOCKS) return -1;

	cv_sleep(variable, &m[index].s);               // defined in proc.c
	return 1;
}

int 
sys_cond_signal(void)
{
	int variable;
	if(argint(0, &variable) < 0) return -1;

	wakeup((void *) variable);
	return 1;
}

int 
sys_get_mutex_value(void)
{
	int index;
	if(argint(0, &index) < 0) return -1;
	if (index < 0 || index >= NLOCKS) return -1;

	return m[index].value;
}


int 
sys_set_mutex_value(void)
{
	int index, value;
	if(argint(0, &index) < 0) return -1;
	if(argint(1, &value) < 0) return -1;
	if (index < 0 || index >= NLOCKS) return -1;

	m[index].value = value;
	return 1;
}


int 
sys_init_mutex(void)
{
	for(int i=0; i<NLOCKS; i++){
		m[i].value = 0;
		initlock(&m[i].s, "temp");
	}
	return 1;
}


int 
sys_init_counters(void)
{
	for(int i=0; i<NLOCKS; i++){
		counters[i] = 0;
	}
	return 1;
}


int sys_get_var(void)
{
 	int num;
 	if(argint(0, &num) < 0) return -1;
 	if (num < 0 || num >= NLOCKS) return -1;

 	return counters[num];
}


int 
sys_set_var(void)
{
	int num, newVal;
	if(argint(0, &num) < 0) return -1;
	if(argint(1, &newVal) < 0) return -1;
 	if (num < 0 || num >= NLOCKS) return -1;

 	counters[num] = newVal;
 	return 1;
}


/*************** Lab 8 ***************/
