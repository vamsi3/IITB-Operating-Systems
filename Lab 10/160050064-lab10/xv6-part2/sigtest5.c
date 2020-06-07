#include "types.h"
#include "stat.h"
#include "user.h"

void signal_handler1(int sig_type)
{
  printf(1, "Signal handler 1 invoked !!!. signal type: %d \n", sig_type);

  if(sig_type == 1)
    exit();
  else
    signal_ret();  
}

void signal_handler2(int sig_type)
{
  printf(1, "Signal handler 2 invoked !!!. signal type: %d \n", sig_type);

  if(sig_type == 1)
    exit();
  else
    signal_ret();  
}

int
main(int argc, char *argv[])
{
  int pid1;
  int pid2;

  pid1 = fork();
  if(pid1 == 0)
  {
    signal((char *)signal_handler1);
    
    while(1);
    exit();
  }

  pid2 = fork();
  if(pid2 == 0)
  {
    signal((char *)signal_handler2);
    
    while(1);
    exit();
  }

  sleep(3 * 100);
  printf(1, " \n");
  signal_send(pid1, 5);
  sleep(2);
  signal_send(pid2, 6);


  sleep(3 * 100);
  printf(1, " \n");
  signal_send(pid1, 10);
  sleep(2);
  signal_send(pid2, 11);

  sleep(3 * 100);
  printf(1, " \n");
  signal_send(pid1, 1);
  sleep(2);
  signal_send(pid2, 1);
  
  wait();  
  wait();
  exit();
}
