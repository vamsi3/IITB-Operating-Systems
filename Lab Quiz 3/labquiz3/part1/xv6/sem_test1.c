#include "types.h"
#include "stat.h"
#include "user.h"

#define sem1 0
#define NPROCESS 10

void delay(int ticks)
{
    int endtime;

    endtime = uptime() + ticks;
    while(uptime() < endtime);
}


int main(int argc, char *argv[])
{
    sem_init(sem1, 0);

    for(int i=0; i<NPROCESS; i++)
    {
        if(fork() > 0)
            continue;

        sem_down(sem1);

        exit();
    }

    printf(1, "[%d] Parent: Waiting for 10 seconds \n", getpid());
    delay(10 * 100);

    for(int i=0; i<NPROCESS; i++)
    {
        sem_up(sem1);
        delay(2);
    }

    for(int i=0; i<NPROCESS; i++)
        wait();

    exit();
}
