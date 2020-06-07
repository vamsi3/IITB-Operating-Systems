#include "types.h"
#include "stat.h"
#include "user.h"

#define sem1 0
#define sem2 1
#define sem3 2
#define NPROCESS 10

void delay(int ticks)
{
    int endtime;

    endtime = uptime() + ticks;
    while(uptime() < endtime);
}


int main(int argc, char *argv[])
{
    sem_init(sem1, 1);
    sem_init(sem2, 0);
    sem_init(sem3, 0);

    for(int i=0; i<3; i++)
    {
        if(fork() > 0)
            continue;

        for(int loop=0; loop<5; loop++)
        {

            if(i == 0)      // child 1
            {   
                sem_down(sem1);
                sem_up(sem2);
            }
            else if(i == 1) //  child 2
            {
                sem_down(sem2);
                sem_up(sem3);
            }
            else            //  child 3
            {
                sem_down(sem3);
                sem_up(sem1);
            }
        }

        exit();
    }

    for(int i=0; i<3; i++)
        wait();

    exit();
}
