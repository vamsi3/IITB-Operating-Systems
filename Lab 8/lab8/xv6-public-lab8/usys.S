#include "syscall.h"
#include "traps.h"

#define SYSCALL(name) \
  .globl name; \
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
SYSCALL(exit)
SYSCALL(wait)
SYSCALL(pipe)
SYSCALL(read)
SYSCALL(write)
SYSCALL(close)
SYSCALL(kill)
SYSCALL(exec)
SYSCALL(open)
SYSCALL(mknod)
SYSCALL(unlink)
SYSCALL(fstat)
SYSCALL(link)
SYSCALL(mkdir)
SYSCALL(chdir)
SYSCALL(dup)
SYSCALL(getpid)
SYSCALL(sbrk)
SYSCALL(sleep)
SYSCALL(uptime)

# SYSCALL(acquire_mutex_spinlock)
# SYSCALL(release_mutex_spinlock)
# SYSCALL(cond_wait)
# SYSCALL(cond_signal)
# SYSCALL(get_mutex_value)
# SYSCALL(set_mutex_value)
# SYSCALL(init_mutex)
# SYSCALL(init_counters)
# SYSCALL(get_var)
# SYSCALL(set_var)
