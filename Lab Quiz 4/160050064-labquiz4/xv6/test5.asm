
_test5:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
		}
	}
}

int main(int argc, char* argv[])
{	
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 68             	sub    $0x68,%esp
	int end_time;
	int* pids;
	int results[NTASKS];
	int nworkers;

	if(argc <2 )
  14:	83 39 01             	cmpl   $0x1,(%ecx)
		}
	}
}

int main(int argc, char* argv[])
{	
  17:	8b 41 04             	mov    0x4(%ecx),%eax
	int end_time;
	int* pids;
	int results[NTASKS];
	int nworkers;

	if(argc <2 )
  1a:	0f 8e a1 01 00 00    	jle    1c1 <main+0x1c1>
	{
		printf(1, "./test5 <# workers> \n");
		exit();
	}
	nworkers = atoi(argv[1]);
  20:	83 ec 0c             	sub    $0xc,%esp
  23:	ff 70 04             	pushl  0x4(%eax)

	pids = (int *)sbrk(nworkers * sizeof(int));
	init_taskmaster();

	//	Creating n workers
	for(int i=0; i<nworkers; i++)
  26:	31 db                	xor    %ebx,%ebx
	if(argc <2 )
	{
		printf(1, "./test5 <# workers> \n");
		exit();
	}
	nworkers = atoi(argv[1]);
  28:	e8 33 04 00 00       	call   460 <atoi>
  2d:	89 c6                	mov    %eax,%esi

	pids = (int *)sbrk(nworkers * sizeof(int));
  2f:	8d 04 85 00 00 00 00 	lea    0x0(,%eax,4),%eax
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 1c 05 00 00       	call   55a <sbrk>
  3e:	89 45 94             	mov    %eax,-0x6c(%ebp)
	init_taskmaster();
  41:	e8 2c 05 00 00       	call   572 <init_taskmaster>

	//	Creating n workers
	for(int i=0; i<nworkers; i++)
  46:	83 c4 10             	add    $0x10,%esp
  49:	85 f6                	test   %esi,%esi
  4b:	8b 7d 94             	mov    -0x6c(%ebp),%edi
  4e:	7f 12                	jg     62 <main+0x62>
  50:	eb 1e                	jmp    70 <main+0x70>
  52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	{
		pid = fork();
		if(pid == 0)
			worker_thread();
						
		pids[i] = pid;
  58:	89 04 9f             	mov    %eax,(%edi,%ebx,4)

	pids = (int *)sbrk(nworkers * sizeof(int));
	init_taskmaster();

	//	Creating n workers
	for(int i=0; i<nworkers; i++)
  5b:	83 c3 01             	add    $0x1,%ebx
  5e:	39 de                	cmp    %ebx,%esi
  60:	74 0e                	je     70 <main+0x70>
	{
		pid = fork();
  62:	e8 63 04 00 00       	call   4ca <fork>
		if(pid == 0)
  67:	85 c0                	test   %eax,%eax
  69:	75 ed                	jne    58 <main+0x58>
			worker_thread();
  6b:	e8 f0 01 00 00       	call   260 <worker_thread>
						
		pids[i] = pid;
	}

	start_time = uptime();
  70:	e8 f5 04 00 00       	call   56a <uptime>
  75:	bb 64 00 00 00       	mov    $0x64,%ebx
  7a:	89 45 90             	mov    %eax,-0x70(%ebp)

	// Master process issues NTASK tasks
	for(int i=0; i<NTASKS; i++)
	{
		if(i % 3 == 0)
  7d:	bf 56 55 55 55       	mov    $0x55555556,%edi
  82:	eb 1c                	jmp    a0 <main+0xa0>
  84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			do_task((char *)task1, 100 + i,	i, i+2);
  88:	50                   	push   %eax
  89:	51                   	push   %ecx
  8a:	53                   	push   %ebx
  8b:	68 e0 01 00 00       	push   $0x1e0
  90:	83 c3 01             	add    $0x1,%ebx
  93:	e8 e2 04 00 00       	call   57a <do_task>
  98:	83 c4 10             	add    $0x10,%esp
	}

	start_time = uptime();

	// Master process issues NTASK tasks
	for(int i=0; i<NTASKS; i++)
  9b:	83 fb 78             	cmp    $0x78,%ebx
  9e:	74 30                	je     d0 <main+0xd0>
  a0:	8d 4b 9c             	lea    -0x64(%ebx),%ecx
	{
		if(i % 3 == 0)
  a3:	89 c8                	mov    %ecx,%eax
  a5:	f7 ef                	imul   %edi
  a7:	89 c8                	mov    %ecx,%eax
  a9:	c1 f8 1f             	sar    $0x1f,%eax
  ac:	29 c2                	sub    %eax,%edx
  ae:	8d 04 52             	lea    (%edx,%edx,2),%eax
  b1:	39 c1                	cmp    %eax,%ecx
			do_task((char *)task1, 100 + i,	i, i+2);
  b3:	8d 43 9e             	lea    -0x62(%ebx),%eax
	start_time = uptime();

	// Master process issues NTASK tasks
	for(int i=0; i<NTASKS; i++)
	{
		if(i % 3 == 0)
  b6:	74 d0                	je     88 <main+0x88>
			do_task((char *)task1, 100 + i,	i, i+2);
		else
			do_task((char *)task2, 100 + i, i, i+2);
  b8:	50                   	push   %eax
  b9:	51                   	push   %ecx
  ba:	53                   	push   %ebx
  bb:	68 20 02 00 00       	push   $0x220
  c0:	83 c3 01             	add    $0x1,%ebx
  c3:	e8 b2 04 00 00       	call   57a <do_task>
  c8:	83 c4 10             	add    $0x10,%esp
	}

	start_time = uptime();

	// Master process issues NTASK tasks
	for(int i=0; i<NTASKS; i++)
  cb:	83 fb 78             	cmp    $0x78,%ebx
  ce:	75 d0                	jne    a0 <main+0xa0>
  d0:	8d 7d 98             	lea    -0x68(%ebp),%edi
  d3:	bb 64 00 00 00       	mov    $0x64,%ebx
  d8:	90                   	nop
  d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			do_task((char *)task2, 100 + i, i, i+2);
	}

	//	Master process waits for all tasks to complete
	for(int i=0; i<NTASKS; i++)
		wait_for_task_to_complete(100 + i, &results[i]);
  e0:	83 ec 08             	sub    $0x8,%esp
  e3:	57                   	push   %edi
  e4:	53                   	push   %ebx
  e5:	83 c3 01             	add    $0x1,%ebx
  e8:	83 c7 04             	add    $0x4,%edi
  eb:	e8 92 04 00 00       	call   582 <wait_for_task_to_complete>
		else
			do_task((char *)task2, 100 + i, i, i+2);
	}

	//	Master process waits for all tasks to complete
	for(int i=0; i<NTASKS; i++)
  f0:	83 c4 10             	add    $0x10,%esp
  f3:	83 fb 78             	cmp    $0x78,%ebx
  f6:	75 e8                	jne    e0 <main+0xe0>
		wait_for_task_to_complete(100 + i, &results[i]);

	end_time = uptime();
  f8:	e8 6d 04 00 00       	call   56a <uptime>

	sleep(100);
  fd:	83 ec 0c             	sub    $0xc,%esp

	//	Master process waits for all tasks to complete
	for(int i=0; i<NTASKS; i++)
		wait_for_task_to_complete(100 + i, &results[i]);

	end_time = uptime();
 100:	89 c7                	mov    %eax,%edi

	sleep(100);
	printf(1, "\n--------------------------------------\n");
	for(int i=0; i<NTASKS; i++)
 102:	31 db                	xor    %ebx,%ebx
	for(int i=0; i<NTASKS; i++)
		wait_for_task_to_complete(100 + i, &results[i]);

	end_time = uptime();

	sleep(100);
 104:	6a 64                	push   $0x64
 106:	e8 57 04 00 00       	call   562 <sleep>
	printf(1, "\n--------------------------------------\n");
 10b:	5a                   	pop    %edx
 10c:	59                   	pop    %ecx
 10d:	68 d4 09 00 00       	push   $0x9d4
 112:	6a 01                	push   $0x1
 114:	e8 27 05 00 00       	call   640 <printf>
 119:	83 c4 10             	add    $0x10,%esp
 11c:	eb 25                	jmp    143 <main+0x143>
 11e:	66 90                	xchg   %ax,%ax
	for(int i=0; i<NTASKS; i++)
	{
		if(i % 2 == 0)
			printf(1, "Results. %d + %d = %d \n", i, i+2, results[i]);
 120:	8d 43 02             	lea    0x2(%ebx),%eax
 123:	83 ec 0c             	sub    $0xc,%esp
 126:	ff 74 9d 98          	pushl  -0x68(%ebp,%ebx,4)
 12a:	50                   	push   %eax
 12b:	53                   	push   %ebx

	end_time = uptime();

	sleep(100);
	printf(1, "\n--------------------------------------\n");
	for(int i=0; i<NTASKS; i++)
 12c:	83 c3 01             	add    $0x1,%ebx
	{
		if(i % 2 == 0)
			printf(1, "Results. %d + %d = %d \n", i, i+2, results[i]);
 12f:	68 8d 09 00 00       	push   $0x98d
 134:	6a 01                	push   $0x1
 136:	e8 05 05 00 00       	call   640 <printf>
 13b:	83 c4 20             	add    $0x20,%esp

	end_time = uptime();

	sleep(100);
	printf(1, "\n--------------------------------------\n");
	for(int i=0; i<NTASKS; i++)
 13e:	83 fb 14             	cmp    $0x14,%ebx
 141:	74 28                	je     16b <main+0x16b>
	{
		if(i % 2 == 0)
 143:	f6 c3 01             	test   $0x1,%bl
 146:	74 d8                	je     120 <main+0x120>
			printf(1, "Results. %d + %d = %d \n", i, i+2, results[i]);
		else 
			printf(1, "Results. %d * %d = %d \n", i, i+2, results[i]);
 148:	8d 43 02             	lea    0x2(%ebx),%eax
 14b:	83 ec 0c             	sub    $0xc,%esp
 14e:	ff 74 9d 98          	pushl  -0x68(%ebp,%ebx,4)
 152:	50                   	push   %eax
 153:	53                   	push   %ebx

	end_time = uptime();

	sleep(100);
	printf(1, "\n--------------------------------------\n");
	for(int i=0; i<NTASKS; i++)
 154:	83 c3 01             	add    $0x1,%ebx
	{
		if(i % 2 == 0)
			printf(1, "Results. %d + %d = %d \n", i, i+2, results[i]);
		else 
			printf(1, "Results. %d * %d = %d \n", i, i+2, results[i]);
 157:	68 a5 09 00 00       	push   $0x9a5
 15c:	6a 01                	push   $0x1
 15e:	e8 dd 04 00 00       	call   640 <printf>
 163:	83 c4 20             	add    $0x20,%esp

	end_time = uptime();

	sleep(100);
	printf(1, "\n--------------------------------------\n");
	for(int i=0; i<NTASKS; i++)
 166:	83 fb 14             	cmp    $0x14,%ebx
 169:	75 d8                	jne    143 <main+0x143>
			printf(1, "Results. %d + %d = %d \n", i, i+2, results[i]);
		else 
			printf(1, "Results. %d * %d = %d \n", i, i+2, results[i]);
	}

	printf(1, "\nDuration: %d ticks \n", end_time - start_time);
 16b:	2b 7d 90             	sub    -0x70(%ebp),%edi
 16e:	50                   	push   %eax

	for(int i=0; i<nworkers; i++)
 16f:	31 db                	xor    %ebx,%ebx
			printf(1, "Results. %d + %d = %d \n", i, i+2, results[i]);
		else 
			printf(1, "Results. %d * %d = %d \n", i, i+2, results[i]);
	}

	printf(1, "\nDuration: %d ticks \n", end_time - start_time);
 171:	57                   	push   %edi
 172:	68 bd 09 00 00       	push   $0x9bd
 177:	6a 01                	push   $0x1
 179:	e8 c2 04 00 00       	call   640 <printf>

	for(int i=0; i<nworkers; i++)
 17e:	83 c4 10             	add    $0x10,%esp
 181:	85 f6                	test   %esi,%esi
 183:	8b 7d 94             	mov    -0x6c(%ebp),%edi
 186:	7e 34                	jle    1bc <main+0x1bc>
 188:	90                   	nop
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		kill(pids[i]);
 190:	83 ec 0c             	sub    $0xc,%esp
 193:	ff 34 9f             	pushl  (%edi,%ebx,4)
			printf(1, "Results. %d * %d = %d \n", i, i+2, results[i]);
	}

	printf(1, "\nDuration: %d ticks \n", end_time - start_time);

	for(int i=0; i<nworkers; i++)
 196:	83 c3 01             	add    $0x1,%ebx
		kill(pids[i]);
 199:	e8 64 03 00 00       	call   502 <kill>
			printf(1, "Results. %d * %d = %d \n", i, i+2, results[i]);
	}

	printf(1, "\nDuration: %d ticks \n", end_time - start_time);

	for(int i=0; i<nworkers; i++)
 19e:	83 c4 10             	add    $0x10,%esp
 1a1:	39 de                	cmp    %ebx,%esi
 1a3:	75 eb                	jne    190 <main+0x190>
 1a5:	31 db                	xor    %ebx,%ebx
 1a7:	89 f6                	mov    %esi,%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		kill(pids[i]);

	for(int i=0; i<nworkers; i++)
 1b0:	83 c3 01             	add    $0x1,%ebx
		wait();
 1b3:	e8 22 03 00 00       	call   4da <wait>
	printf(1, "\nDuration: %d ticks \n", end_time - start_time);

	for(int i=0; i<nworkers; i++)
		kill(pids[i]);

	for(int i=0; i<nworkers; i++)
 1b8:	39 de                	cmp    %ebx,%esi
 1ba:	75 f4                	jne    1b0 <main+0x1b0>
		wait();

	exit();
 1bc:	e8 11 03 00 00       	call   4d2 <exit>
	int results[NTASKS];
	int nworkers;

	if(argc <2 )
	{
		printf(1, "./test5 <# workers> \n");
 1c1:	53                   	push   %ebx
 1c2:	53                   	push   %ebx
 1c3:	68 77 09 00 00       	push   $0x977
 1c8:	6a 01                	push   $0x1
 1ca:	e8 71 04 00 00       	call   640 <printf>
		exit();
 1cf:	e8 fe 02 00 00       	call   4d2 <exit>
 1d4:	66 90                	xchg   %ax,%ax
 1d6:	66 90                	xchg   %ax,%ax
 1d8:	66 90                	xchg   %ax,%ax
 1da:	66 90                	xchg   %ax,%ax
 1dc:	66 90                	xchg   %ax,%ax
 1de:	66 90                	xchg   %ax,%ax

000001e0 <task1>:
#include "user.h"

#define NTASKS 20

void task1(int id, int a, int b)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
 1e5:	53                   	push   %ebx
 1e6:	83 ec 18             	sub    $0x18,%esp
 1e9:	8b 7d 0c             	mov    0xc(%ebp),%edi
 1ec:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1ef:	8b 75 08             	mov    0x8(%ebp),%esi
	int result;

	sleep(50);
 1f2:	6a 32                	push   $0x32
	// printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a + b;
 1f4:	01 fb                	add    %edi,%ebx

void task1(int id, int a, int b)
{
	int result;

	sleep(50);
 1f6:	e8 67 03 00 00       	call   562 <sleep>
	// printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a + b;

	sleep(150);
 1fb:	c7 04 24 96 00 00 00 	movl   $0x96,(%esp)
 202:	e8 5b 03 00 00       	call   562 <sleep>
	task_ret(id, result);
 207:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 20a:	89 75 08             	mov    %esi,0x8(%ebp)
 20d:	83 c4 10             	add    $0x10,%esp
}
 210:	8d 65 f4             	lea    -0xc(%ebp),%esp
 213:	5b                   	pop    %ebx
 214:	5e                   	pop    %esi
 215:	5f                   	pop    %edi
 216:	5d                   	pop    %ebp
	// printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a + b;

	sleep(150);
	task_ret(id, result);
 217:	e9 76 03 00 00       	jmp    592 <task_ret>
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000220 <task2>:
}

void task2(int id, int a, int b)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
 225:	53                   	push   %ebx
 226:	83 ec 18             	sub    $0x18,%esp
 229:	8b 7d 0c             	mov    0xc(%ebp),%edi
 22c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 22f:	8b 75 08             	mov    0x8(%ebp),%esi
	int result;

	sleep(100);
 232:	6a 64                	push   $0x64
	// printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a * b;
 234:	0f af df             	imul   %edi,%ebx

void task2(int id, int a, int b)
{
	int result;

	sleep(100);
 237:	e8 26 03 00 00       	call   562 <sleep>
	// printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a * b;

	sleep(100);
 23c:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 243:	e8 1a 03 00 00       	call   562 <sleep>
	task_ret(id, result);
 248:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 24b:	89 75 08             	mov    %esi,0x8(%ebp)
 24e:	83 c4 10             	add    $0x10,%esp
}
 251:	8d 65 f4             	lea    -0xc(%ebp),%esp
 254:	5b                   	pop    %ebx
 255:	5e                   	pop    %esi
 256:	5f                   	pop    %edi
 257:	5d                   	pop    %ebp
	// printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a * b;

	sleep(100);
	task_ret(id, result);
 258:	e9 35 03 00 00       	jmp    592 <task_ret>
 25d:	8d 76 00             	lea    0x0(%esi),%esi

00000260 <worker_thread>:
}

void worker_thread()
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	83 ec 08             	sub    $0x8,%esp
 266:	8d 76 00             	lea    0x0(%esi),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	int count = 0;
	int ret;

	while(1)
	{
		ret = wait_for_task();
 270:	e8 15 03 00 00       	call   58a <wait_for_task>
		if(ret > 0)
 275:	85 c0                	test   %eax,%eax
 277:	7f f7                	jg     270 <worker_thread+0x10>
			count ++;
			// printf(1, "[%d] Completed %d tasks. Last completed ID: %d \n", getpid(), count, ret);
		}
		else
		{
			printf(1, "wait for task failed \n");
 279:	83 ec 08             	sub    $0x8,%esp
 27c:	68 60 09 00 00       	push   $0x960
 281:	6a 01                	push   $0x1
 283:	e8 b8 03 00 00       	call   640 <printf>
			exit();
 288:	e8 45 02 00 00       	call   4d2 <exit>
 28d:	66 90                	xchg   %ax,%ax
 28f:	90                   	nop

00000290 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 29a:	89 c2                	mov    %eax,%edx
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2a0:	83 c1 01             	add    $0x1,%ecx
 2a3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 2a7:	83 c2 01             	add    $0x1,%edx
 2aa:	84 db                	test   %bl,%bl
 2ac:	88 5a ff             	mov    %bl,-0x1(%edx)
 2af:	75 ef                	jne    2a0 <strcpy+0x10>
    ;
  return os;
}
 2b1:	5b                   	pop    %ebx
 2b2:	5d                   	pop    %ebp
 2b3:	c3                   	ret    
 2b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	56                   	push   %esi
 2c4:	53                   	push   %ebx
 2c5:	8b 55 08             	mov    0x8(%ebp),%edx
 2c8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 2cb:	0f b6 02             	movzbl (%edx),%eax
 2ce:	0f b6 19             	movzbl (%ecx),%ebx
 2d1:	84 c0                	test   %al,%al
 2d3:	75 1e                	jne    2f3 <strcmp+0x33>
 2d5:	eb 29                	jmp    300 <strcmp+0x40>
 2d7:	89 f6                	mov    %esi,%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 2e0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 2e3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 2e6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 2e9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 2ed:	84 c0                	test   %al,%al
 2ef:	74 0f                	je     300 <strcmp+0x40>
 2f1:	89 f1                	mov    %esi,%ecx
 2f3:	38 d8                	cmp    %bl,%al
 2f5:	74 e9                	je     2e0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 2f7:	29 d8                	sub    %ebx,%eax
}
 2f9:	5b                   	pop    %ebx
 2fa:	5e                   	pop    %esi
 2fb:	5d                   	pop    %ebp
 2fc:	c3                   	ret    
 2fd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 300:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 302:	29 d8                	sub    %ebx,%eax
}
 304:	5b                   	pop    %ebx
 305:	5e                   	pop    %esi
 306:	5d                   	pop    %ebp
 307:	c3                   	ret    
 308:	90                   	nop
 309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000310 <strlen>:

uint
strlen(char *s)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 316:	80 39 00             	cmpb   $0x0,(%ecx)
 319:	74 12                	je     32d <strlen+0x1d>
 31b:	31 d2                	xor    %edx,%edx
 31d:	8d 76 00             	lea    0x0(%esi),%esi
 320:	83 c2 01             	add    $0x1,%edx
 323:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 327:	89 d0                	mov    %edx,%eax
 329:	75 f5                	jne    320 <strlen+0x10>
    ;
  return n;
}
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 32d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    
 331:	eb 0d                	jmp    340 <memset>
 333:	90                   	nop
 334:	90                   	nop
 335:	90                   	nop
 336:	90                   	nop
 337:	90                   	nop
 338:	90                   	nop
 339:	90                   	nop
 33a:	90                   	nop
 33b:	90                   	nop
 33c:	90                   	nop
 33d:	90                   	nop
 33e:	90                   	nop
 33f:	90                   	nop

00000340 <memset>:

void*
memset(void *dst, int c, uint n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 347:	8b 4d 10             	mov    0x10(%ebp),%ecx
 34a:	8b 45 0c             	mov    0xc(%ebp),%eax
 34d:	89 d7                	mov    %edx,%edi
 34f:	fc                   	cld    
 350:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 352:	89 d0                	mov    %edx,%eax
 354:	5f                   	pop    %edi
 355:	5d                   	pop    %ebp
 356:	c3                   	ret    
 357:	89 f6                	mov    %esi,%esi
 359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <strchr>:

char*
strchr(const char *s, char c)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 36a:	0f b6 10             	movzbl (%eax),%edx
 36d:	84 d2                	test   %dl,%dl
 36f:	74 1d                	je     38e <strchr+0x2e>
    if(*s == c)
 371:	38 d3                	cmp    %dl,%bl
 373:	89 d9                	mov    %ebx,%ecx
 375:	75 0d                	jne    384 <strchr+0x24>
 377:	eb 17                	jmp    390 <strchr+0x30>
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 380:	38 ca                	cmp    %cl,%dl
 382:	74 0c                	je     390 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 384:	83 c0 01             	add    $0x1,%eax
 387:	0f b6 10             	movzbl (%eax),%edx
 38a:	84 d2                	test   %dl,%dl
 38c:	75 f2                	jne    380 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 38e:	31 c0                	xor    %eax,%eax
}
 390:	5b                   	pop    %ebx
 391:	5d                   	pop    %ebp
 392:	c3                   	ret    
 393:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003a0 <gets>:

char*
gets(char *buf, int max)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	56                   	push   %esi
 3a5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3a6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 3a8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 3ab:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3ae:	eb 29                	jmp    3d9 <gets+0x39>
    cc = read(0, &c, 1);
 3b0:	83 ec 04             	sub    $0x4,%esp
 3b3:	6a 01                	push   $0x1
 3b5:	57                   	push   %edi
 3b6:	6a 00                	push   $0x0
 3b8:	e8 2d 01 00 00       	call   4ea <read>
    if(cc < 1)
 3bd:	83 c4 10             	add    $0x10,%esp
 3c0:	85 c0                	test   %eax,%eax
 3c2:	7e 1d                	jle    3e1 <gets+0x41>
      break;
    buf[i++] = c;
 3c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3c8:	8b 55 08             	mov    0x8(%ebp),%edx
 3cb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 3cd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 3cf:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 3d3:	74 1b                	je     3f0 <gets+0x50>
 3d5:	3c 0d                	cmp    $0xd,%al
 3d7:	74 17                	je     3f0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3d9:	8d 5e 01             	lea    0x1(%esi),%ebx
 3dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3df:	7c cf                	jl     3b0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 3e1:	8b 45 08             	mov    0x8(%ebp),%eax
 3e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 3e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3eb:	5b                   	pop    %ebx
 3ec:	5e                   	pop    %esi
 3ed:	5f                   	pop    %edi
 3ee:	5d                   	pop    %ebp
 3ef:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 3f0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3f3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 3f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 3f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3fc:	5b                   	pop    %ebx
 3fd:	5e                   	pop    %esi
 3fe:	5f                   	pop    %edi
 3ff:	5d                   	pop    %ebp
 400:	c3                   	ret    
 401:	eb 0d                	jmp    410 <stat>
 403:	90                   	nop
 404:	90                   	nop
 405:	90                   	nop
 406:	90                   	nop
 407:	90                   	nop
 408:	90                   	nop
 409:	90                   	nop
 40a:	90                   	nop
 40b:	90                   	nop
 40c:	90                   	nop
 40d:	90                   	nop
 40e:	90                   	nop
 40f:	90                   	nop

00000410 <stat>:

int
stat(char *n, struct stat *st)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	56                   	push   %esi
 414:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 415:	83 ec 08             	sub    $0x8,%esp
 418:	6a 00                	push   $0x0
 41a:	ff 75 08             	pushl  0x8(%ebp)
 41d:	e8 f0 00 00 00       	call   512 <open>
  if(fd < 0)
 422:	83 c4 10             	add    $0x10,%esp
 425:	85 c0                	test   %eax,%eax
 427:	78 27                	js     450 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 429:	83 ec 08             	sub    $0x8,%esp
 42c:	ff 75 0c             	pushl  0xc(%ebp)
 42f:	89 c3                	mov    %eax,%ebx
 431:	50                   	push   %eax
 432:	e8 f3 00 00 00       	call   52a <fstat>
 437:	89 c6                	mov    %eax,%esi
  close(fd);
 439:	89 1c 24             	mov    %ebx,(%esp)
 43c:	e8 b9 00 00 00       	call   4fa <close>
  return r;
 441:	83 c4 10             	add    $0x10,%esp
 444:	89 f0                	mov    %esi,%eax
}
 446:	8d 65 f8             	lea    -0x8(%ebp),%esp
 449:	5b                   	pop    %ebx
 44a:	5e                   	pop    %esi
 44b:	5d                   	pop    %ebp
 44c:	c3                   	ret    
 44d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 450:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 455:	eb ef                	jmp    446 <stat+0x36>
 457:	89 f6                	mov    %esi,%esi
 459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000460 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	53                   	push   %ebx
 464:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 467:	0f be 11             	movsbl (%ecx),%edx
 46a:	8d 42 d0             	lea    -0x30(%edx),%eax
 46d:	3c 09                	cmp    $0x9,%al
 46f:	b8 00 00 00 00       	mov    $0x0,%eax
 474:	77 1f                	ja     495 <atoi+0x35>
 476:	8d 76 00             	lea    0x0(%esi),%esi
 479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 480:	8d 04 80             	lea    (%eax,%eax,4),%eax
 483:	83 c1 01             	add    $0x1,%ecx
 486:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 48a:	0f be 11             	movsbl (%ecx),%edx
 48d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 490:	80 fb 09             	cmp    $0x9,%bl
 493:	76 eb                	jbe    480 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 495:	5b                   	pop    %ebx
 496:	5d                   	pop    %ebp
 497:	c3                   	ret    
 498:	90                   	nop
 499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004a0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	56                   	push   %esi
 4a4:	53                   	push   %ebx
 4a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4a8:	8b 45 08             	mov    0x8(%ebp),%eax
 4ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4ae:	85 db                	test   %ebx,%ebx
 4b0:	7e 14                	jle    4c6 <memmove+0x26>
 4b2:	31 d2                	xor    %edx,%edx
 4b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 4b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 4bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 4bf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4c2:	39 da                	cmp    %ebx,%edx
 4c4:	75 f2                	jne    4b8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 4c6:	5b                   	pop    %ebx
 4c7:	5e                   	pop    %esi
 4c8:	5d                   	pop    %ebp
 4c9:	c3                   	ret    

000004ca <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4ca:	b8 01 00 00 00       	mov    $0x1,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <exit>:
SYSCALL(exit)
 4d2:	b8 02 00 00 00       	mov    $0x2,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <wait>:
SYSCALL(wait)
 4da:	b8 03 00 00 00       	mov    $0x3,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <pipe>:
SYSCALL(pipe)
 4e2:	b8 04 00 00 00       	mov    $0x4,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <read>:
SYSCALL(read)
 4ea:	b8 05 00 00 00       	mov    $0x5,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <write>:
SYSCALL(write)
 4f2:	b8 10 00 00 00       	mov    $0x10,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <close>:
SYSCALL(close)
 4fa:	b8 15 00 00 00       	mov    $0x15,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <kill>:
SYSCALL(kill)
 502:	b8 06 00 00 00       	mov    $0x6,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <exec>:
SYSCALL(exec)
 50a:	b8 07 00 00 00       	mov    $0x7,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <open>:
SYSCALL(open)
 512:	b8 0f 00 00 00       	mov    $0xf,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <mknod>:
SYSCALL(mknod)
 51a:	b8 11 00 00 00       	mov    $0x11,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <unlink>:
SYSCALL(unlink)
 522:	b8 12 00 00 00       	mov    $0x12,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <fstat>:
SYSCALL(fstat)
 52a:	b8 08 00 00 00       	mov    $0x8,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <link>:
SYSCALL(link)
 532:	b8 13 00 00 00       	mov    $0x13,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <mkdir>:
SYSCALL(mkdir)
 53a:	b8 14 00 00 00       	mov    $0x14,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <chdir>:
SYSCALL(chdir)
 542:	b8 09 00 00 00       	mov    $0x9,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <dup>:
SYSCALL(dup)
 54a:	b8 0a 00 00 00       	mov    $0xa,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <getpid>:
SYSCALL(getpid)
 552:	b8 0b 00 00 00       	mov    $0xb,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <sbrk>:
SYSCALL(sbrk)
 55a:	b8 0c 00 00 00       	mov    $0xc,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <sleep>:
SYSCALL(sleep)
 562:	b8 0d 00 00 00       	mov    $0xd,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <uptime>:
SYSCALL(uptime)
 56a:	b8 0e 00 00 00       	mov    $0xe,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <init_taskmaster>:
#/***************** LAB QUIZ 4 *****************/
SYSCALL(init_taskmaster)
 572:	b8 16 00 00 00       	mov    $0x16,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <do_task>:
SYSCALL(do_task)
 57a:	b8 17 00 00 00       	mov    $0x17,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <wait_for_task_to_complete>:
SYSCALL(wait_for_task_to_complete)
 582:	b8 18 00 00 00       	mov    $0x18,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <wait_for_task>:
SYSCALL(wait_for_task)
 58a:	b8 19 00 00 00       	mov    $0x19,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <task_ret>:
SYSCALL(task_ret)
 592:	b8 1a 00 00 00       	mov    $0x1a,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    
 59a:	66 90                	xchg   %ax,%ax
 59c:	66 90                	xchg   %ax,%ax
 59e:	66 90                	xchg   %ax,%ax

000005a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	89 c6                	mov    %eax,%esi
 5a8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5ae:	85 db                	test   %ebx,%ebx
 5b0:	74 7e                	je     630 <printint+0x90>
 5b2:	89 d0                	mov    %edx,%eax
 5b4:	c1 e8 1f             	shr    $0x1f,%eax
 5b7:	84 c0                	test   %al,%al
 5b9:	74 75                	je     630 <printint+0x90>
    neg = 1;
    x = -xx;
 5bb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 5bd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 5c4:	f7 d8                	neg    %eax
 5c6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5c9:	31 ff                	xor    %edi,%edi
 5cb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 5ce:	89 ce                	mov    %ecx,%esi
 5d0:	eb 08                	jmp    5da <printint+0x3a>
 5d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5d8:	89 cf                	mov    %ecx,%edi
 5da:	31 d2                	xor    %edx,%edx
 5dc:	8d 4f 01             	lea    0x1(%edi),%ecx
 5df:	f7 f6                	div    %esi
 5e1:	0f b6 92 08 0a 00 00 	movzbl 0xa08(%edx),%edx
  }while((x /= base) != 0);
 5e8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 5ea:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 5ed:	75 e9                	jne    5d8 <printint+0x38>
  if(neg)
 5ef:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 5f2:	8b 75 c0             	mov    -0x40(%ebp),%esi
 5f5:	85 c0                	test   %eax,%eax
 5f7:	74 08                	je     601 <printint+0x61>
    buf[i++] = '-';
 5f9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 5fe:	8d 4f 02             	lea    0x2(%edi),%ecx
 601:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 605:	8d 76 00             	lea    0x0(%esi),%esi
 608:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 60b:	83 ec 04             	sub    $0x4,%esp
 60e:	83 ef 01             	sub    $0x1,%edi
 611:	6a 01                	push   $0x1
 613:	53                   	push   %ebx
 614:	56                   	push   %esi
 615:	88 45 d7             	mov    %al,-0x29(%ebp)
 618:	e8 d5 fe ff ff       	call   4f2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 61d:	83 c4 10             	add    $0x10,%esp
 620:	39 df                	cmp    %ebx,%edi
 622:	75 e4                	jne    608 <printint+0x68>
    putc(fd, buf[i]);
}
 624:	8d 65 f4             	lea    -0xc(%ebp),%esp
 627:	5b                   	pop    %ebx
 628:	5e                   	pop    %esi
 629:	5f                   	pop    %edi
 62a:	5d                   	pop    %ebp
 62b:	c3                   	ret    
 62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 630:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 632:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 639:	eb 8b                	jmp    5c6 <printint+0x26>
 63b:	90                   	nop
 63c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000640 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 646:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 649:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 64c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 64f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 652:	89 45 d0             	mov    %eax,-0x30(%ebp)
 655:	0f b6 1e             	movzbl (%esi),%ebx
 658:	83 c6 01             	add    $0x1,%esi
 65b:	84 db                	test   %bl,%bl
 65d:	0f 84 b0 00 00 00    	je     713 <printf+0xd3>
 663:	31 d2                	xor    %edx,%edx
 665:	eb 39                	jmp    6a0 <printf+0x60>
 667:	89 f6                	mov    %esi,%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 670:	83 f8 25             	cmp    $0x25,%eax
 673:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 676:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 67b:	74 18                	je     695 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 67d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 680:	83 ec 04             	sub    $0x4,%esp
 683:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 686:	6a 01                	push   $0x1
 688:	50                   	push   %eax
 689:	57                   	push   %edi
 68a:	e8 63 fe ff ff       	call   4f2 <write>
 68f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 692:	83 c4 10             	add    $0x10,%esp
 695:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 698:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 69c:	84 db                	test   %bl,%bl
 69e:	74 73                	je     713 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 6a0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 6a2:	0f be cb             	movsbl %bl,%ecx
 6a5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6a8:	74 c6                	je     670 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 6aa:	83 fa 25             	cmp    $0x25,%edx
 6ad:	75 e6                	jne    695 <printf+0x55>
      if(c == 'd'){
 6af:	83 f8 64             	cmp    $0x64,%eax
 6b2:	0f 84 f8 00 00 00    	je     7b0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6b8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6be:	83 f9 70             	cmp    $0x70,%ecx
 6c1:	74 5d                	je     720 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6c3:	83 f8 73             	cmp    $0x73,%eax
 6c6:	0f 84 84 00 00 00    	je     750 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6cc:	83 f8 63             	cmp    $0x63,%eax
 6cf:	0f 84 ea 00 00 00    	je     7bf <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6d5:	83 f8 25             	cmp    $0x25,%eax
 6d8:	0f 84 c2 00 00 00    	je     7a0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6de:	8d 45 e7             	lea    -0x19(%ebp),%eax
 6e1:	83 ec 04             	sub    $0x4,%esp
 6e4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6e8:	6a 01                	push   $0x1
 6ea:	50                   	push   %eax
 6eb:	57                   	push   %edi
 6ec:	e8 01 fe ff ff       	call   4f2 <write>
 6f1:	83 c4 0c             	add    $0xc,%esp
 6f4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 6f7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 6fa:	6a 01                	push   $0x1
 6fc:	50                   	push   %eax
 6fd:	57                   	push   %edi
 6fe:	83 c6 01             	add    $0x1,%esi
 701:	e8 ec fd ff ff       	call   4f2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 706:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 70a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 70d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 70f:	84 db                	test   %bl,%bl
 711:	75 8d                	jne    6a0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 713:	8d 65 f4             	lea    -0xc(%ebp),%esp
 716:	5b                   	pop    %ebx
 717:	5e                   	pop    %esi
 718:	5f                   	pop    %edi
 719:	5d                   	pop    %ebp
 71a:	c3                   	ret    
 71b:	90                   	nop
 71c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 720:	83 ec 0c             	sub    $0xc,%esp
 723:	b9 10 00 00 00       	mov    $0x10,%ecx
 728:	6a 00                	push   $0x0
 72a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 72d:	89 f8                	mov    %edi,%eax
 72f:	8b 13                	mov    (%ebx),%edx
 731:	e8 6a fe ff ff       	call   5a0 <printint>
        ap++;
 736:	89 d8                	mov    %ebx,%eax
 738:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 73b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 73d:	83 c0 04             	add    $0x4,%eax
 740:	89 45 d0             	mov    %eax,-0x30(%ebp)
 743:	e9 4d ff ff ff       	jmp    695 <printf+0x55>
 748:	90                   	nop
 749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 750:	8b 45 d0             	mov    -0x30(%ebp),%eax
 753:	8b 18                	mov    (%eax),%ebx
        ap++;
 755:	83 c0 04             	add    $0x4,%eax
 758:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 75b:	b8 00 0a 00 00       	mov    $0xa00,%eax
 760:	85 db                	test   %ebx,%ebx
 762:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 765:	0f b6 03             	movzbl (%ebx),%eax
 768:	84 c0                	test   %al,%al
 76a:	74 23                	je     78f <printf+0x14f>
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 770:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 773:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 776:	83 ec 04             	sub    $0x4,%esp
 779:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 77b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 77e:	50                   	push   %eax
 77f:	57                   	push   %edi
 780:	e8 6d fd ff ff       	call   4f2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 785:	0f b6 03             	movzbl (%ebx),%eax
 788:	83 c4 10             	add    $0x10,%esp
 78b:	84 c0                	test   %al,%al
 78d:	75 e1                	jne    770 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 78f:	31 d2                	xor    %edx,%edx
 791:	e9 ff fe ff ff       	jmp    695 <printf+0x55>
 796:	8d 76 00             	lea    0x0(%esi),%esi
 799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7a0:	83 ec 04             	sub    $0x4,%esp
 7a3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 7a6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 7a9:	6a 01                	push   $0x1
 7ab:	e9 4c ff ff ff       	jmp    6fc <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 7b0:	83 ec 0c             	sub    $0xc,%esp
 7b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7b8:	6a 01                	push   $0x1
 7ba:	e9 6b ff ff ff       	jmp    72a <printf+0xea>
 7bf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7c2:	83 ec 04             	sub    $0x4,%esp
 7c5:	8b 03                	mov    (%ebx),%eax
 7c7:	6a 01                	push   $0x1
 7c9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 7cc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 7cf:	50                   	push   %eax
 7d0:	57                   	push   %edi
 7d1:	e8 1c fd ff ff       	call   4f2 <write>
 7d6:	e9 5b ff ff ff       	jmp    736 <printf+0xf6>
 7db:	66 90                	xchg   %ax,%ax
 7dd:	66 90                	xchg   %ax,%ax
 7df:	90                   	nop

000007e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e1:	a1 20 0d 00 00       	mov    0xd20,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 7e6:	89 e5                	mov    %esp,%ebp
 7e8:	57                   	push   %edi
 7e9:	56                   	push   %esi
 7ea:	53                   	push   %ebx
 7eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ee:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7f0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f3:	39 c8                	cmp    %ecx,%eax
 7f5:	73 19                	jae    810 <free+0x30>
 7f7:	89 f6                	mov    %esi,%esi
 7f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 800:	39 d1                	cmp    %edx,%ecx
 802:	72 1c                	jb     820 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 804:	39 d0                	cmp    %edx,%eax
 806:	73 18                	jae    820 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 808:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 80a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 80c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 80e:	72 f0                	jb     800 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 810:	39 d0                	cmp    %edx,%eax
 812:	72 f4                	jb     808 <free+0x28>
 814:	39 d1                	cmp    %edx,%ecx
 816:	73 f0                	jae    808 <free+0x28>
 818:	90                   	nop
 819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 820:	8b 73 fc             	mov    -0x4(%ebx),%esi
 823:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 826:	39 d7                	cmp    %edx,%edi
 828:	74 19                	je     843 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 82a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 82d:	8b 50 04             	mov    0x4(%eax),%edx
 830:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 833:	39 f1                	cmp    %esi,%ecx
 835:	74 23                	je     85a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 837:	89 08                	mov    %ecx,(%eax)
  freep = p;
 839:	a3 20 0d 00 00       	mov    %eax,0xd20
}
 83e:	5b                   	pop    %ebx
 83f:	5e                   	pop    %esi
 840:	5f                   	pop    %edi
 841:	5d                   	pop    %ebp
 842:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 843:	03 72 04             	add    0x4(%edx),%esi
 846:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 849:	8b 10                	mov    (%eax),%edx
 84b:	8b 12                	mov    (%edx),%edx
 84d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 850:	8b 50 04             	mov    0x4(%eax),%edx
 853:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 856:	39 f1                	cmp    %esi,%ecx
 858:	75 dd                	jne    837 <free+0x57>
    p->s.size += bp->s.size;
 85a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 85d:	a3 20 0d 00 00       	mov    %eax,0xd20
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 862:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 865:	8b 53 f8             	mov    -0x8(%ebx),%edx
 868:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 86a:	5b                   	pop    %ebx
 86b:	5e                   	pop    %esi
 86c:	5f                   	pop    %edi
 86d:	5d                   	pop    %ebp
 86e:	c3                   	ret    
 86f:	90                   	nop

00000870 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	57                   	push   %edi
 874:	56                   	push   %esi
 875:	53                   	push   %ebx
 876:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 879:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 87c:	8b 15 20 0d 00 00    	mov    0xd20,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 882:	8d 78 07             	lea    0x7(%eax),%edi
 885:	c1 ef 03             	shr    $0x3,%edi
 888:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 88b:	85 d2                	test   %edx,%edx
 88d:	0f 84 a3 00 00 00    	je     936 <malloc+0xc6>
 893:	8b 02                	mov    (%edx),%eax
 895:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 898:	39 cf                	cmp    %ecx,%edi
 89a:	76 74                	jbe    910 <malloc+0xa0>
 89c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 8a2:	be 00 10 00 00       	mov    $0x1000,%esi
 8a7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 8ae:	0f 43 f7             	cmovae %edi,%esi
 8b1:	ba 00 80 00 00       	mov    $0x8000,%edx
 8b6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 8bc:	0f 46 da             	cmovbe %edx,%ebx
 8bf:	eb 10                	jmp    8d1 <malloc+0x61>
 8c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8ca:	8b 48 04             	mov    0x4(%eax),%ecx
 8cd:	39 cf                	cmp    %ecx,%edi
 8cf:	76 3f                	jbe    910 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8d1:	39 05 20 0d 00 00    	cmp    %eax,0xd20
 8d7:	89 c2                	mov    %eax,%edx
 8d9:	75 ed                	jne    8c8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 8db:	83 ec 0c             	sub    $0xc,%esp
 8de:	53                   	push   %ebx
 8df:	e8 76 fc ff ff       	call   55a <sbrk>
  if(p == (char*)-1)
 8e4:	83 c4 10             	add    $0x10,%esp
 8e7:	83 f8 ff             	cmp    $0xffffffff,%eax
 8ea:	74 1c                	je     908 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8ec:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 8ef:	83 ec 0c             	sub    $0xc,%esp
 8f2:	83 c0 08             	add    $0x8,%eax
 8f5:	50                   	push   %eax
 8f6:	e8 e5 fe ff ff       	call   7e0 <free>
  return freep;
 8fb:	8b 15 20 0d 00 00    	mov    0xd20,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 901:	83 c4 10             	add    $0x10,%esp
 904:	85 d2                	test   %edx,%edx
 906:	75 c0                	jne    8c8 <malloc+0x58>
        return 0;
 908:	31 c0                	xor    %eax,%eax
 90a:	eb 1c                	jmp    928 <malloc+0xb8>
 90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 910:	39 cf                	cmp    %ecx,%edi
 912:	74 1c                	je     930 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 914:	29 f9                	sub    %edi,%ecx
 916:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 919:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 91c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 91f:	89 15 20 0d 00 00    	mov    %edx,0xd20
      return (void*)(p + 1);
 925:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 928:	8d 65 f4             	lea    -0xc(%ebp),%esp
 92b:	5b                   	pop    %ebx
 92c:	5e                   	pop    %esi
 92d:	5f                   	pop    %edi
 92e:	5d                   	pop    %ebp
 92f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 930:	8b 08                	mov    (%eax),%ecx
 932:	89 0a                	mov    %ecx,(%edx)
 934:	eb e9                	jmp    91f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 936:	c7 05 20 0d 00 00 24 	movl   $0xd24,0xd20
 93d:	0d 00 00 
 940:	c7 05 24 0d 00 00 24 	movl   $0xd24,0xd24
 947:	0d 00 00 
    base.s.size = 0;
 94a:	b8 24 0d 00 00       	mov    $0xd24,%eax
 94f:	c7 05 28 0d 00 00 00 	movl   $0x0,0xd28
 956:	00 00 00 
 959:	e9 3e ff ff ff       	jmp    89c <malloc+0x2c>
