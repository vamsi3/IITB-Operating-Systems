#include "types.h"
#include "stat.h"
#include "user.h"

void signal_handler(int sig_type)
{
  printf(1, "Signal handler invoked !!!. signal type: %d \n", sig_type);

  if(sig_type == 1)
    exit();

  signal_ret();
}

int
main(int argc, char *argv[])
{
  signal((char *)signal_handler);
 
  sleep(3 * 100);
  signal_send(getpid(), 5);

  sleep(3 * 100);
  signal_send(getpid(), 10);

  sleep(3 * 100);
  signal_send(getpid(), 1);

  printf(1, "Done \n");

  while(1);
  exit();
}
