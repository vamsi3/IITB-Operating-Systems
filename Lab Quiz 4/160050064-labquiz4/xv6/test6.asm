
_test6:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
		}
	}
}

int main()
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
	int pids[NWORKERS];
	int results[NTASKS];

	init_taskmaster();

	for(int i=0; i<NWORKERS; i++)
  11:	31 db                	xor    %ebx,%ebx
		}
	}
}

int main()
{	
  13:	81 ec d8 01 00 00    	sub    $0x1d8,%esp
	int pid;
	int pids[NWORKERS];
	int results[NTASKS];

	init_taskmaster();
  19:	e8 f4 05 00 00       	call   612 <init_taskmaster>

	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
  1e:	e8 47 05 00 00       	call   56a <fork>
		if(pid == 0)
  23:	85 c0                	test   %eax,%eax
  25:	0f 84 28 02 00 00    	je     253 <main+0x253>
			worker_thread();
						
		pids[i] = pid;
  2b:	89 84 9d 1c fe ff ff 	mov    %eax,-0x1e4(%ebp,%ebx,4)
	int pids[NWORKERS];
	int results[NTASKS];

	init_taskmaster();

	for(int i=0; i<NWORKERS; i++)
  32:	83 c3 01             	add    $0x1,%ebx
  35:	83 fb 05             	cmp    $0x5,%ebx
  38:	75 e4                	jne    1e <main+0x1e>
			worker_thread();
						
		pids[i] = pid;
	}

	printf(1, "\nIssuing tasks 100 to 199 \n");
  3a:	83 ec 08             	sub    $0x8,%esp
	for(int i=0; i<NTASKS; i++)
  3d:	31 db                	xor    %ebx,%ebx
	{
		if(do_task((char *)((i % 2 == 0) ? task1 : task2), 100 + i,	i, i+2) < 0)
  3f:	bf 60 02 00 00       	mov    $0x260,%edi
			worker_thread();
						
		pids[i] = pid;
	}

	printf(1, "\nIssuing tasks 100 to 199 \n");
  44:	68 2f 0b 00 00       	push   $0xb2f
  49:	6a 01                	push   $0x1
	for(int i=0; i<NTASKS; i++)
	{
		if(do_task((char *)((i % 2 == 0) ? task1 : task2), 100 + i,	i, i+2) < 0)
  4b:	be b0 02 00 00       	mov    $0x2b0,%esi
			worker_thread();
						
		pids[i] = pid;
	}

	printf(1, "\nIssuing tasks 100 to 199 \n");
  50:	e8 8b 06 00 00       	call   6e0 <printf>
  55:	83 c4 10             	add    $0x10,%esp
  58:	eb 0e                	jmp    68 <main+0x68>
  5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	for(int i=0; i<NTASKS; i++)
  60:	83 c3 01             	add    $0x1,%ebx
  63:	83 fb 6e             	cmp    $0x6e,%ebx
  66:	74 38                	je     a0 <main+0xa0>
	{
		if(do_task((char *)((i % 2 == 0) ? task1 : task2), 100 + i,	i, i+2) < 0)
  68:	f6 c3 01             	test   $0x1,%bl
  6b:	8d 4b 02             	lea    0x2(%ebx),%ecx
  6e:	8d 53 64             	lea    0x64(%ebx),%edx
  71:	89 f0                	mov    %esi,%eax
  73:	0f 44 c7             	cmove  %edi,%eax
  76:	51                   	push   %ecx
  77:	53                   	push   %ebx
  78:	52                   	push   %edx
  79:	50                   	push   %eax
  7a:	e8 9b 05 00 00       	call   61a <do_task>
  7f:	83 c4 10             	add    $0x10,%esp
  82:	85 c0                	test   %eax,%eax
  84:	79 da                	jns    60 <main+0x60>
			printf(1, "do task failed. task ID: %d \n");
  86:	83 ec 08             	sub    $0x8,%esp
						
		pids[i] = pid;
	}

	printf(1, "\nIssuing tasks 100 to 199 \n");
	for(int i=0; i<NTASKS; i++)
  89:	83 c3 01             	add    $0x1,%ebx
	{
		if(do_task((char *)((i % 2 == 0) ? task1 : task2), 100 + i,	i, i+2) < 0)
			printf(1, "do task failed. task ID: %d \n");
  8c:	68 4b 0b 00 00       	push   $0xb4b
  91:	6a 01                	push   $0x1
  93:	e8 48 06 00 00       	call   6e0 <printf>
  98:	83 c4 10             	add    $0x10,%esp
						
		pids[i] = pid;
	}

	printf(1, "\nIssuing tasks 100 to 199 \n");
	for(int i=0; i<NTASKS; i++)
  9b:	83 fb 6e             	cmp    $0x6e,%ebx
  9e:	75 c8                	jne    68 <main+0x68>
  a0:	8d b5 30 fe ff ff    	lea    -0x1d0(%ebp),%esi
  a6:	bb 64 00 00 00       	mov    $0x64,%ebx
  ab:	90                   	nop
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		if(do_task((char *)((i % 2 == 0) ? task1 : task2), 100 + i,	i, i+2) < 0)
			printf(1, "do task failed. task ID: %d \n");
	}

	for(int i=0; i<100; i++)
		wait_for_task_to_complete(100 + i, &results[i]);
  b0:	83 ec 08             	sub    $0x8,%esp
  b3:	56                   	push   %esi
  b4:	53                   	push   %ebx
  b5:	83 c3 01             	add    $0x1,%ebx
  b8:	83 c6 04             	add    $0x4,%esi
  bb:	e8 62 05 00 00       	call   622 <wait_for_task_to_complete>
	{
		if(do_task((char *)((i % 2 == 0) ? task1 : task2), 100 + i,	i, i+2) < 0)
			printf(1, "do task failed. task ID: %d \n");
	}

	for(int i=0; i<100; i++)
  c0:	83 c4 10             	add    $0x10,%esp
  c3:	81 fb c8 00 00 00    	cmp    $0xc8,%ebx
  c9:	75 e5                	jne    b0 <main+0xb0>
		wait_for_task_to_complete(100 + i, &results[i]);

	sleep(50);
  cb:	83 ec 0c             	sub    $0xc,%esp
  ce:	6a 32                	push   $0x32
  d0:	e8 2d 05 00 00       	call   602 <sleep>
	printf(1, "\n\n--------------------------------------\n");
  d5:	5e                   	pop    %esi
  d6:	5f                   	pop    %edi
  d7:	68 60 0a 00 00       	push   $0xa60
  dc:	6a 01                	push   $0x1
	printf(1, "Tasks 100 to 199 have been completed execution \n");
	printf(1, "Issuing tasks from 200 to 209 \n\n");

	for(int i=100; i<NTASKS; i++)
	{
		if(do_task((char *)((i % 2 == 0) ? task1 : task2), 100 + i,	i, i+2) < 0)
  de:	bf 60 02 00 00       	mov    $0x260,%edi

	for(int i=0; i<100; i++)
		wait_for_task_to_complete(100 + i, &results[i]);

	sleep(50);
	printf(1, "\n\n--------------------------------------\n");
  e3:	e8 f8 05 00 00       	call   6e0 <printf>
	printf(1, "Tasks 100 to 199 have been completed execution \n");
  e8:	58                   	pop    %eax
  e9:	5a                   	pop    %edx
  ea:	68 8c 0a 00 00       	push   $0xa8c
  ef:	6a 01                	push   $0x1
  f1:	e8 ea 05 00 00       	call   6e0 <printf>
	printf(1, "Issuing tasks from 200 to 209 \n\n");
  f6:	59                   	pop    %ecx
  f7:	5e                   	pop    %esi
  f8:	68 c0 0a 00 00       	push   $0xac0
  fd:	6a 01                	push   $0x1

	for(int i=100; i<NTASKS; i++)
  ff:	be 64 00 00 00       	mov    $0x64,%esi
		wait_for_task_to_complete(100 + i, &results[i]);

	sleep(50);
	printf(1, "\n\n--------------------------------------\n");
	printf(1, "Tasks 100 to 199 have been completed execution \n");
	printf(1, "Issuing tasks from 200 to 209 \n\n");
 104:	e8 d7 05 00 00       	call   6e0 <printf>
 109:	83 c4 10             	add    $0x10,%esp
 10c:	eb 0a                	jmp    118 <main+0x118>
 10e:	66 90                	xchg   %ax,%ax

	for(int i=100; i<NTASKS; i++)
 110:	83 c6 01             	add    $0x1,%esi
 113:	83 fe 6e             	cmp    $0x6e,%esi
 116:	74 48                	je     160 <main+0x160>
	{
		if(do_task((char *)((i % 2 == 0) ? task1 : task2), 100 + i,	i, i+2) < 0)
 118:	f7 c6 01 00 00 00    	test   $0x1,%esi
 11e:	8d 4e 02             	lea    0x2(%esi),%ecx
 121:	8d 56 64             	lea    0x64(%esi),%edx
 124:	b8 b0 02 00 00       	mov    $0x2b0,%eax
 129:	0f 44 c7             	cmove  %edi,%eax
 12c:	51                   	push   %ecx
 12d:	56                   	push   %esi
 12e:	52                   	push   %edx
 12f:	50                   	push   %eax
 130:	e8 e5 04 00 00       	call   61a <do_task>
 135:	83 c4 10             	add    $0x10,%esp
 138:	85 c0                	test   %eax,%eax
 13a:	79 d4                	jns    110 <main+0x110>
			printf(1, "do task failed. task ID: %d \n");
 13c:	83 ec 08             	sub    $0x8,%esp
	sleep(50);
	printf(1, "\n\n--------------------------------------\n");
	printf(1, "Tasks 100 to 199 have been completed execution \n");
	printf(1, "Issuing tasks from 200 to 209 \n\n");

	for(int i=100; i<NTASKS; i++)
 13f:	83 c6 01             	add    $0x1,%esi
	{
		if(do_task((char *)((i % 2 == 0) ? task1 : task2), 100 + i,	i, i+2) < 0)
			printf(1, "do task failed. task ID: %d \n");
 142:	68 4b 0b 00 00       	push   $0xb4b
 147:	6a 01                	push   $0x1
 149:	e8 92 05 00 00       	call   6e0 <printf>
 14e:	83 c4 10             	add    $0x10,%esp
	sleep(50);
	printf(1, "\n\n--------------------------------------\n");
	printf(1, "Tasks 100 to 199 have been completed execution \n");
	printf(1, "Issuing tasks from 200 to 209 \n\n");

	for(int i=100; i<NTASKS; i++)
 151:	83 fe 6e             	cmp    $0x6e,%esi
 154:	75 c2                	jne    118 <main+0x118>
 156:	8d 76 00             	lea    0x0(%esi),%esi
 159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 160:	8d 75 c0             	lea    -0x40(%ebp),%esi
 163:	90                   	nop
 164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		if(do_task((char *)((i % 2 == 0) ? task1 : task2), 100 + i,	i, i+2) < 0)
			printf(1, "do task failed. task ID: %d \n");
	}

	for(int i=100; i<NTASKS; i++)
		wait_for_task_to_complete(100 + i, &results[i]);
 168:	83 ec 08             	sub    $0x8,%esp
 16b:	56                   	push   %esi
 16c:	53                   	push   %ebx
 16d:	83 c3 01             	add    $0x1,%ebx
 170:	83 c6 04             	add    $0x4,%esi
 173:	e8 aa 04 00 00       	call   622 <wait_for_task_to_complete>
	{
		if(do_task((char *)((i % 2 == 0) ? task1 : task2), 100 + i,	i, i+2) < 0)
			printf(1, "do task failed. task ID: %d \n");
	}

	for(int i=100; i<NTASKS; i++)
 178:	83 c4 10             	add    $0x10,%esp
 17b:	81 fb d2 00 00 00    	cmp    $0xd2,%ebx
 181:	75 e5                	jne    168 <main+0x168>
		wait_for_task_to_complete(100 + i, &results[i]);

	sleep(50);
 183:	83 ec 0c             	sub    $0xc,%esp
 186:	6a 32                	push   $0x32
 188:	e8 75 04 00 00       	call   602 <sleep>
	printf(1, "\n\n--------------------------------------\n");
 18d:	58                   	pop    %eax
 18e:	5a                   	pop    %edx
 18f:	68 60 0a 00 00       	push   $0xa60
 194:	6a 01                	push   $0x1
 196:	e8 45 05 00 00       	call   6e0 <printf>
	printf(1, "Tasks 200 to 209 have been completed execution \n\n");
 19b:	59                   	pop    %ecx
 19c:	5b                   	pop    %ebx
 19d:	68 e4 0a 00 00       	push   $0xae4
 1a2:	6a 01                	push   $0x1

	for(int i=0; i<NTASKS; i++)
 1a4:	31 db                	xor    %ebx,%ebx
	for(int i=100; i<NTASKS; i++)
		wait_for_task_to_complete(100 + i, &results[i]);

	sleep(50);
	printf(1, "\n\n--------------------------------------\n");
	printf(1, "Tasks 200 to 209 have been completed execution \n\n");
 1a6:	e8 35 05 00 00       	call   6e0 <printf>
 1ab:	83 c4 10             	add    $0x10,%esp
 1ae:	eb 2a                	jmp    1da <main+0x1da>

	for(int i=0; i<NTASKS; i++)
	{
		if(i % 2 == 0)
			printf(1, "Results (%d). %d + %d = %d \n", 100+i, i, i+2, results[i]);
 1b0:	8d 43 02             	lea    0x2(%ebx),%eax
 1b3:	83 ec 08             	sub    $0x8,%esp
 1b6:	ff b4 9d 30 fe ff ff 	pushl  -0x1d0(%ebp,%ebx,4)
 1bd:	50                   	push   %eax
 1be:	8d 43 64             	lea    0x64(%ebx),%eax
 1c1:	53                   	push   %ebx

	sleep(50);
	printf(1, "\n\n--------------------------------------\n");
	printf(1, "Tasks 200 to 209 have been completed execution \n\n");

	for(int i=0; i<NTASKS; i++)
 1c2:	83 c3 01             	add    $0x1,%ebx
	{
		if(i % 2 == 0)
			printf(1, "Results (%d). %d + %d = %d \n", 100+i, i, i+2, results[i]);
 1c5:	50                   	push   %eax
 1c6:	68 69 0b 00 00       	push   $0xb69
 1cb:	6a 01                	push   $0x1
 1cd:	e8 0e 05 00 00       	call   6e0 <printf>
 1d2:	83 c4 20             	add    $0x20,%esp

	sleep(50);
	printf(1, "\n\n--------------------------------------\n");
	printf(1, "Tasks 200 to 209 have been completed execution \n\n");

	for(int i=0; i<NTASKS; i++)
 1d5:	83 fb 6e             	cmp    $0x6e,%ebx
 1d8:	74 2f                	je     209 <main+0x209>
	{
		if(i % 2 == 0)
 1da:	f6 c3 01             	test   $0x1,%bl
 1dd:	74 d1                	je     1b0 <main+0x1b0>
			printf(1, "Results (%d). %d + %d = %d \n", 100+i, i, i+2, results[i]);
		else
			printf(1, "Results (%d). %d * %d = %d \n", 100+i, i, i+2, results[i]);
 1df:	8d 43 02             	lea    0x2(%ebx),%eax
 1e2:	83 ec 08             	sub    $0x8,%esp
 1e5:	ff b4 9d 30 fe ff ff 	pushl  -0x1d0(%ebp,%ebx,4)
 1ec:	50                   	push   %eax
 1ed:	8d 43 64             	lea    0x64(%ebx),%eax
 1f0:	53                   	push   %ebx

	sleep(50);
	printf(1, "\n\n--------------------------------------\n");
	printf(1, "Tasks 200 to 209 have been completed execution \n\n");

	for(int i=0; i<NTASKS; i++)
 1f1:	83 c3 01             	add    $0x1,%ebx
	{
		if(i % 2 == 0)
			printf(1, "Results (%d). %d + %d = %d \n", 100+i, i, i+2, results[i]);
		else
			printf(1, "Results (%d). %d * %d = %d \n", 100+i, i, i+2, results[i]);
 1f4:	50                   	push   %eax
 1f5:	68 86 0b 00 00       	push   $0xb86
 1fa:	6a 01                	push   $0x1
 1fc:	e8 df 04 00 00       	call   6e0 <printf>
 201:	83 c4 20             	add    $0x20,%esp

	sleep(50);
	printf(1, "\n\n--------------------------------------\n");
	printf(1, "Tasks 200 to 209 have been completed execution \n\n");

	for(int i=0; i<NTASKS; i++)
 204:	83 fb 6e             	cmp    $0x6e,%ebx
 207:	75 d1                	jne    1da <main+0x1da>
			printf(1, "Results (%d). %d + %d = %d \n", 100+i, i, i+2, results[i]);
		else
			printf(1, "Results (%d). %d * %d = %d \n", 100+i, i, i+2, results[i]);
	}

	sleep(200);
 209:	83 ec 0c             	sub    $0xc,%esp
	for(int i=0; i<NWORKERS; i++)
 20c:	31 db                	xor    %ebx,%ebx
			printf(1, "Results (%d). %d + %d = %d \n", 100+i, i, i+2, results[i]);
		else
			printf(1, "Results (%d). %d * %d = %d \n", 100+i, i, i+2, results[i]);
	}

	sleep(200);
 20e:	68 c8 00 00 00       	push   $0xc8
 213:	e8 ea 03 00 00       	call   602 <sleep>
 218:	83 c4 10             	add    $0x10,%esp
	for(int i=0; i<NWORKERS; i++)
		kill(pids[i]);
 21b:	83 ec 0c             	sub    $0xc,%esp
 21e:	ff b4 9d 1c fe ff ff 	pushl  -0x1e4(%ebp,%ebx,4)
		else
			printf(1, "Results (%d). %d * %d = %d \n", 100+i, i, i+2, results[i]);
	}

	sleep(200);
	for(int i=0; i<NWORKERS; i++)
 225:	83 c3 01             	add    $0x1,%ebx
		kill(pids[i]);
 228:	e8 75 03 00 00       	call   5a2 <kill>
		else
			printf(1, "Results (%d). %d * %d = %d \n", 100+i, i, i+2, results[i]);
	}

	sleep(200);
	for(int i=0; i<NWORKERS; i++)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	83 fb 05             	cmp    $0x5,%ebx
 233:	75 e6                	jne    21b <main+0x21b>
		kill(pids[i]);

	for(int i=0; i<NWORKERS; i++)
		wait();
 235:	e8 40 03 00 00       	call   57a <wait>
 23a:	e8 3b 03 00 00       	call   57a <wait>
 23f:	e8 36 03 00 00       	call   57a <wait>
 244:	e8 31 03 00 00       	call   57a <wait>
 249:	e8 2c 03 00 00       	call   57a <wait>

	exit();
 24e:	e8 1f 03 00 00       	call   572 <exit>

	for(int i=0; i<NWORKERS; i++)
	{
		pid = fork();
		if(pid == 0)
			worker_thread();
 253:	e8 a8 00 00 00       	call   300 <worker_thread>
 258:	66 90                	xchg   %ax,%ax
 25a:	66 90                	xchg   %ax,%ax
 25c:	66 90                	xchg   %ax,%ax
 25e:	66 90                	xchg   %ax,%ax

00000260 <task1>:

#define NWORKERS 5
#define NTASKS 110

void task1(int id, int a, int b)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
 265:	53                   	push   %ebx
 266:	83 ec 18             	sub    $0x18,%esp
 269:	8b 75 08             	mov    0x8(%ebp),%esi
 26c:	8b 7d 0c             	mov    0xc(%ebp),%edi
	int result;

	sleep(19);
 26f:	6a 13                	push   $0x13

#define NWORKERS 5
#define NTASKS 110

void task1(int id, int a, int b)
{
 271:	8b 5d 10             	mov    0x10(%ebp),%ebx
	int result;

	sleep(19);
 274:	e8 89 03 00 00       	call   602 <sleep>
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 279:	e8 74 03 00 00       	call   5f2 <getpid>
 27e:	5a                   	pop    %edx
 27f:	59                   	pop    %ecx
 280:	53                   	push   %ebx
 281:	57                   	push   %edi

	result = a + b;
	task_ret(id, result);
 282:	01 fb                	add    %edi,%ebx
void task1(int id, int a, int b)
{
	int result;

	sleep(19);
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 284:	56                   	push   %esi
 285:	50                   	push   %eax
 286:	68 00 0a 00 00       	push   $0xa00
 28b:	6a 01                	push   $0x1
 28d:	e8 4e 04 00 00       	call   6e0 <printf>

	result = a + b;
	task_ret(id, result);
 292:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 295:	89 75 08             	mov    %esi,0x8(%ebp)
 298:	83 c4 20             	add    $0x20,%esp
}
 29b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 29e:	5b                   	pop    %ebx
 29f:	5e                   	pop    %esi
 2a0:	5f                   	pop    %edi
 2a1:	5d                   	pop    %ebp

	sleep(19);
	printf(1, "[%d] Executing task1. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);

	result = a + b;
	task_ret(id, result);
 2a2:	e9 8b 03 00 00       	jmp    632 <task_ret>
 2a7:	89 f6                	mov    %esi,%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002b0 <task2>:
}

void task2(int id, int a, int b)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
 2b5:	53                   	push   %ebx
 2b6:	83 ec 18             	sub    $0x18,%esp
 2b9:	8b 7d 0c             	mov    0xc(%ebp),%edi
 2bc:	8b 5d 10             	mov    0x10(%ebp),%ebx
	int result;

	sleep(13);
 2bf:	6a 0d                	push   $0xd
	result = a + b;
	task_ret(id, result);
}

void task2(int id, int a, int b)
{
 2c1:	8b 75 08             	mov    0x8(%ebp),%esi
	int result;

	sleep(13);
 2c4:	e8 39 03 00 00       	call   602 <sleep>
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 2c9:	e8 24 03 00 00       	call   5f2 <getpid>
 2ce:	5a                   	pop    %edx
 2cf:	59                   	pop    %ecx
 2d0:	53                   	push   %ebx
 2d1:	57                   	push   %edi
	
	result = a * b;
	task_ret(id, result);
 2d2:	0f af df             	imul   %edi,%ebx
void task2(int id, int a, int b)
{
	int result;

	sleep(13);
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
 2d5:	56                   	push   %esi
 2d6:	50                   	push   %eax
 2d7:	68 30 0a 00 00       	push   $0xa30
 2dc:	6a 01                	push   $0x1
 2de:	e8 fd 03 00 00       	call   6e0 <printf>
	
	result = a * b;
	task_ret(id, result);
 2e3:	89 5d 0c             	mov    %ebx,0xc(%ebp)
 2e6:	89 75 08             	mov    %esi,0x8(%ebp)
 2e9:	83 c4 20             	add    $0x20,%esp
}
 2ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ef:	5b                   	pop    %ebx
 2f0:	5e                   	pop    %esi
 2f1:	5f                   	pop    %edi
 2f2:	5d                   	pop    %ebp

	sleep(13);
	printf(1, "[%d] Executing task2. ID: %d. a: %d. b: %d \n", getpid(), id, a, b);
	
	result = a * b;
	task_ret(id, result);
 2f3:	e9 3a 03 00 00       	jmp    632 <task_ret>
 2f8:	90                   	nop
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000300 <worker_thread>:
}

void worker_thread()
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	83 ec 08             	sub    $0x8,%esp
 306:	8d 76 00             	lea    0x0(%esi),%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	int count = 0;
	int ret;

	while(1)
	{
		ret = wait_for_task();
 310:	e8 15 03 00 00       	call   62a <wait_for_task>
		if(ret > 0)
 315:	85 c0                	test   %eax,%eax
 317:	7f f7                	jg     310 <worker_thread+0x10>
			count ++;
			// printf(1, "[%d] Completed %d tasks. Last completed ID: %d \n", getpid(), count, ret);
		}
		else
		{
			printf(1, "wait for task failed \n");
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	68 18 0b 00 00       	push   $0xb18
 321:	6a 01                	push   $0x1
 323:	e8 b8 03 00 00       	call   6e0 <printf>
			exit();
 328:	e8 45 02 00 00       	call   572 <exit>
 32d:	66 90                	xchg   %ax,%ax
 32f:	90                   	nop

00000330 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	8b 45 08             	mov    0x8(%ebp),%eax
 337:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 33a:	89 c2                	mov    %eax,%edx
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 340:	83 c1 01             	add    $0x1,%ecx
 343:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 347:	83 c2 01             	add    $0x1,%edx
 34a:	84 db                	test   %bl,%bl
 34c:	88 5a ff             	mov    %bl,-0x1(%edx)
 34f:	75 ef                	jne    340 <strcpy+0x10>
    ;
  return os;
}
 351:	5b                   	pop    %ebx
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    
 354:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 35a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000360 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
 365:	8b 55 08             	mov    0x8(%ebp),%edx
 368:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 36b:	0f b6 02             	movzbl (%edx),%eax
 36e:	0f b6 19             	movzbl (%ecx),%ebx
 371:	84 c0                	test   %al,%al
 373:	75 1e                	jne    393 <strcmp+0x33>
 375:	eb 29                	jmp    3a0 <strcmp+0x40>
 377:	89 f6                	mov    %esi,%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 380:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 383:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 386:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 389:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 38d:	84 c0                	test   %al,%al
 38f:	74 0f                	je     3a0 <strcmp+0x40>
 391:	89 f1                	mov    %esi,%ecx
 393:	38 d8                	cmp    %bl,%al
 395:	74 e9                	je     380 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 397:	29 d8                	sub    %ebx,%eax
}
 399:	5b                   	pop    %ebx
 39a:	5e                   	pop    %esi
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret    
 39d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3a0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3a2:	29 d8                	sub    %ebx,%eax
}
 3a4:	5b                   	pop    %ebx
 3a5:	5e                   	pop    %esi
 3a6:	5d                   	pop    %ebp
 3a7:	c3                   	ret    
 3a8:	90                   	nop
 3a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003b0 <strlen>:

uint
strlen(char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3b6:	80 39 00             	cmpb   $0x0,(%ecx)
 3b9:	74 12                	je     3cd <strlen+0x1d>
 3bb:	31 d2                	xor    %edx,%edx
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
 3c0:	83 c2 01             	add    $0x1,%edx
 3c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3c7:	89 d0                	mov    %edx,%eax
 3c9:	75 f5                	jne    3c0 <strlen+0x10>
    ;
  return n;
}
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 3cd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 3cf:	5d                   	pop    %ebp
 3d0:	c3                   	ret    
 3d1:	eb 0d                	jmp    3e0 <memset>
 3d3:	90                   	nop
 3d4:	90                   	nop
 3d5:	90                   	nop
 3d6:	90                   	nop
 3d7:	90                   	nop
 3d8:	90                   	nop
 3d9:	90                   	nop
 3da:	90                   	nop
 3db:	90                   	nop
 3dc:	90                   	nop
 3dd:	90                   	nop
 3de:	90                   	nop
 3df:	90                   	nop

000003e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ed:	89 d7                	mov    %edx,%edi
 3ef:	fc                   	cld    
 3f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3f2:	89 d0                	mov    %edx,%eax
 3f4:	5f                   	pop    %edi
 3f5:	5d                   	pop    %ebp
 3f6:	c3                   	ret    
 3f7:	89 f6                	mov    %esi,%esi
 3f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000400 <strchr>:

char*
strchr(const char *s, char c)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	53                   	push   %ebx
 404:	8b 45 08             	mov    0x8(%ebp),%eax
 407:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 40a:	0f b6 10             	movzbl (%eax),%edx
 40d:	84 d2                	test   %dl,%dl
 40f:	74 1d                	je     42e <strchr+0x2e>
    if(*s == c)
 411:	38 d3                	cmp    %dl,%bl
 413:	89 d9                	mov    %ebx,%ecx
 415:	75 0d                	jne    424 <strchr+0x24>
 417:	eb 17                	jmp    430 <strchr+0x30>
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 420:	38 ca                	cmp    %cl,%dl
 422:	74 0c                	je     430 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 424:	83 c0 01             	add    $0x1,%eax
 427:	0f b6 10             	movzbl (%eax),%edx
 42a:	84 d2                	test   %dl,%dl
 42c:	75 f2                	jne    420 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 42e:	31 c0                	xor    %eax,%eax
}
 430:	5b                   	pop    %ebx
 431:	5d                   	pop    %ebp
 432:	c3                   	ret    
 433:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000440 <gets>:

char*
gets(char *buf, int max)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 446:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 448:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 44b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 44e:	eb 29                	jmp    479 <gets+0x39>
    cc = read(0, &c, 1);
 450:	83 ec 04             	sub    $0x4,%esp
 453:	6a 01                	push   $0x1
 455:	57                   	push   %edi
 456:	6a 00                	push   $0x0
 458:	e8 2d 01 00 00       	call   58a <read>
    if(cc < 1)
 45d:	83 c4 10             	add    $0x10,%esp
 460:	85 c0                	test   %eax,%eax
 462:	7e 1d                	jle    481 <gets+0x41>
      break;
    buf[i++] = c;
 464:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 468:	8b 55 08             	mov    0x8(%ebp),%edx
 46b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 46d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 46f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 473:	74 1b                	je     490 <gets+0x50>
 475:	3c 0d                	cmp    $0xd,%al
 477:	74 17                	je     490 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 479:	8d 5e 01             	lea    0x1(%esi),%ebx
 47c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 47f:	7c cf                	jl     450 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 481:	8b 45 08             	mov    0x8(%ebp),%eax
 484:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 488:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48b:	5b                   	pop    %ebx
 48c:	5e                   	pop    %esi
 48d:	5f                   	pop    %edi
 48e:	5d                   	pop    %ebp
 48f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 490:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 493:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 495:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 499:	8d 65 f4             	lea    -0xc(%ebp),%esp
 49c:	5b                   	pop    %ebx
 49d:	5e                   	pop    %esi
 49e:	5f                   	pop    %edi
 49f:	5d                   	pop    %ebp
 4a0:	c3                   	ret    
 4a1:	eb 0d                	jmp    4b0 <stat>
 4a3:	90                   	nop
 4a4:	90                   	nop
 4a5:	90                   	nop
 4a6:	90                   	nop
 4a7:	90                   	nop
 4a8:	90                   	nop
 4a9:	90                   	nop
 4aa:	90                   	nop
 4ab:	90                   	nop
 4ac:	90                   	nop
 4ad:	90                   	nop
 4ae:	90                   	nop
 4af:	90                   	nop

000004b0 <stat>:

int
stat(char *n, struct stat *st)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	56                   	push   %esi
 4b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b5:	83 ec 08             	sub    $0x8,%esp
 4b8:	6a 00                	push   $0x0
 4ba:	ff 75 08             	pushl  0x8(%ebp)
 4bd:	e8 f0 00 00 00       	call   5b2 <open>
  if(fd < 0)
 4c2:	83 c4 10             	add    $0x10,%esp
 4c5:	85 c0                	test   %eax,%eax
 4c7:	78 27                	js     4f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4c9:	83 ec 08             	sub    $0x8,%esp
 4cc:	ff 75 0c             	pushl  0xc(%ebp)
 4cf:	89 c3                	mov    %eax,%ebx
 4d1:	50                   	push   %eax
 4d2:	e8 f3 00 00 00       	call   5ca <fstat>
 4d7:	89 c6                	mov    %eax,%esi
  close(fd);
 4d9:	89 1c 24             	mov    %ebx,(%esp)
 4dc:	e8 b9 00 00 00       	call   59a <close>
  return r;
 4e1:	83 c4 10             	add    $0x10,%esp
 4e4:	89 f0                	mov    %esi,%eax
}
 4e6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4e9:	5b                   	pop    %ebx
 4ea:	5e                   	pop    %esi
 4eb:	5d                   	pop    %ebp
 4ec:	c3                   	ret    
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 4f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4f5:	eb ef                	jmp    4e6 <stat+0x36>
 4f7:	89 f6                	mov    %esi,%esi
 4f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000500 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	53                   	push   %ebx
 504:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 507:	0f be 11             	movsbl (%ecx),%edx
 50a:	8d 42 d0             	lea    -0x30(%edx),%eax
 50d:	3c 09                	cmp    $0x9,%al
 50f:	b8 00 00 00 00       	mov    $0x0,%eax
 514:	77 1f                	ja     535 <atoi+0x35>
 516:	8d 76 00             	lea    0x0(%esi),%esi
 519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 520:	8d 04 80             	lea    (%eax,%eax,4),%eax
 523:	83 c1 01             	add    $0x1,%ecx
 526:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 52a:	0f be 11             	movsbl (%ecx),%edx
 52d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 530:	80 fb 09             	cmp    $0x9,%bl
 533:	76 eb                	jbe    520 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 535:	5b                   	pop    %ebx
 536:	5d                   	pop    %ebp
 537:	c3                   	ret    
 538:	90                   	nop
 539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000540 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	56                   	push   %esi
 544:	53                   	push   %ebx
 545:	8b 5d 10             	mov    0x10(%ebp),%ebx
 548:	8b 45 08             	mov    0x8(%ebp),%eax
 54b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 54e:	85 db                	test   %ebx,%ebx
 550:	7e 14                	jle    566 <memmove+0x26>
 552:	31 d2                	xor    %edx,%edx
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 558:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 55c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 55f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 562:	39 da                	cmp    %ebx,%edx
 564:	75 f2                	jne    558 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 566:	5b                   	pop    %ebx
 567:	5e                   	pop    %esi
 568:	5d                   	pop    %ebp
 569:	c3                   	ret    

0000056a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 56a:	b8 01 00 00 00       	mov    $0x1,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <exit>:
SYSCALL(exit)
 572:	b8 02 00 00 00       	mov    $0x2,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <wait>:
SYSCALL(wait)
 57a:	b8 03 00 00 00       	mov    $0x3,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <pipe>:
SYSCALL(pipe)
 582:	b8 04 00 00 00       	mov    $0x4,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <read>:
SYSCALL(read)
 58a:	b8 05 00 00 00       	mov    $0x5,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <write>:
SYSCALL(write)
 592:	b8 10 00 00 00       	mov    $0x10,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <close>:
SYSCALL(close)
 59a:	b8 15 00 00 00       	mov    $0x15,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <kill>:
SYSCALL(kill)
 5a2:	b8 06 00 00 00       	mov    $0x6,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <exec>:
SYSCALL(exec)
 5aa:	b8 07 00 00 00       	mov    $0x7,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <open>:
SYSCALL(open)
 5b2:	b8 0f 00 00 00       	mov    $0xf,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <mknod>:
SYSCALL(mknod)
 5ba:	b8 11 00 00 00       	mov    $0x11,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <unlink>:
SYSCALL(unlink)
 5c2:	b8 12 00 00 00       	mov    $0x12,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <fstat>:
SYSCALL(fstat)
 5ca:	b8 08 00 00 00       	mov    $0x8,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <link>:
SYSCALL(link)
 5d2:	b8 13 00 00 00       	mov    $0x13,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <mkdir>:
SYSCALL(mkdir)
 5da:	b8 14 00 00 00       	mov    $0x14,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <chdir>:
SYSCALL(chdir)
 5e2:	b8 09 00 00 00       	mov    $0x9,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <dup>:
SYSCALL(dup)
 5ea:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <getpid>:
SYSCALL(getpid)
 5f2:	b8 0b 00 00 00       	mov    $0xb,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <sbrk>:
SYSCALL(sbrk)
 5fa:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <sleep>:
SYSCALL(sleep)
 602:	b8 0d 00 00 00       	mov    $0xd,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <uptime>:
SYSCALL(uptime)
 60a:	b8 0e 00 00 00       	mov    $0xe,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <init_taskmaster>:
#/***************** LAB QUIZ 4 *****************/
SYSCALL(init_taskmaster)
 612:	b8 16 00 00 00       	mov    $0x16,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <do_task>:
SYSCALL(do_task)
 61a:	b8 17 00 00 00       	mov    $0x17,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <wait_for_task_to_complete>:
SYSCALL(wait_for_task_to_complete)
 622:	b8 18 00 00 00       	mov    $0x18,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <wait_for_task>:
SYSCALL(wait_for_task)
 62a:	b8 19 00 00 00       	mov    $0x19,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <task_ret>:
SYSCALL(task_ret)
 632:	b8 1a 00 00 00       	mov    $0x1a,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    
 63a:	66 90                	xchg   %ax,%ax
 63c:	66 90                	xchg   %ax,%ax
 63e:	66 90                	xchg   %ax,%ax

00000640 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
 646:	89 c6                	mov    %eax,%esi
 648:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 64b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 64e:	85 db                	test   %ebx,%ebx
 650:	74 7e                	je     6d0 <printint+0x90>
 652:	89 d0                	mov    %edx,%eax
 654:	c1 e8 1f             	shr    $0x1f,%eax
 657:	84 c0                	test   %al,%al
 659:	74 75                	je     6d0 <printint+0x90>
    neg = 1;
    x = -xx;
 65b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 65d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 664:	f7 d8                	neg    %eax
 666:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 669:	31 ff                	xor    %edi,%edi
 66b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 66e:	89 ce                	mov    %ecx,%esi
 670:	eb 08                	jmp    67a <printint+0x3a>
 672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 678:	89 cf                	mov    %ecx,%edi
 67a:	31 d2                	xor    %edx,%edx
 67c:	8d 4f 01             	lea    0x1(%edi),%ecx
 67f:	f7 f6                	div    %esi
 681:	0f b6 92 ac 0b 00 00 	movzbl 0xbac(%edx),%edx
  }while((x /= base) != 0);
 688:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 68a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 68d:	75 e9                	jne    678 <printint+0x38>
  if(neg)
 68f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 692:	8b 75 c0             	mov    -0x40(%ebp),%esi
 695:	85 c0                	test   %eax,%eax
 697:	74 08                	je     6a1 <printint+0x61>
    buf[i++] = '-';
 699:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 69e:	8d 4f 02             	lea    0x2(%edi),%ecx
 6a1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 6a5:	8d 76 00             	lea    0x0(%esi),%esi
 6a8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6ab:	83 ec 04             	sub    $0x4,%esp
 6ae:	83 ef 01             	sub    $0x1,%edi
 6b1:	6a 01                	push   $0x1
 6b3:	53                   	push   %ebx
 6b4:	56                   	push   %esi
 6b5:	88 45 d7             	mov    %al,-0x29(%ebp)
 6b8:	e8 d5 fe ff ff       	call   592 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 6bd:	83 c4 10             	add    $0x10,%esp
 6c0:	39 df                	cmp    %ebx,%edi
 6c2:	75 e4                	jne    6a8 <printint+0x68>
    putc(fd, buf[i]);
}
 6c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6c7:	5b                   	pop    %ebx
 6c8:	5e                   	pop    %esi
 6c9:	5f                   	pop    %edi
 6ca:	5d                   	pop    %ebp
 6cb:	c3                   	ret    
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6d0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6d2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6d9:	eb 8b                	jmp    666 <printint+0x26>
 6db:	90                   	nop
 6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006e0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6e6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6e9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6ec:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6ef:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6f2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6f5:	0f b6 1e             	movzbl (%esi),%ebx
 6f8:	83 c6 01             	add    $0x1,%esi
 6fb:	84 db                	test   %bl,%bl
 6fd:	0f 84 b0 00 00 00    	je     7b3 <printf+0xd3>
 703:	31 d2                	xor    %edx,%edx
 705:	eb 39                	jmp    740 <printf+0x60>
 707:	89 f6                	mov    %esi,%esi
 709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 710:	83 f8 25             	cmp    $0x25,%eax
 713:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 716:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 71b:	74 18                	je     735 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 71d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 720:	83 ec 04             	sub    $0x4,%esp
 723:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 726:	6a 01                	push   $0x1
 728:	50                   	push   %eax
 729:	57                   	push   %edi
 72a:	e8 63 fe ff ff       	call   592 <write>
 72f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 732:	83 c4 10             	add    $0x10,%esp
 735:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 738:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 73c:	84 db                	test   %bl,%bl
 73e:	74 73                	je     7b3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 740:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 742:	0f be cb             	movsbl %bl,%ecx
 745:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 748:	74 c6                	je     710 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 74a:	83 fa 25             	cmp    $0x25,%edx
 74d:	75 e6                	jne    735 <printf+0x55>
      if(c == 'd'){
 74f:	83 f8 64             	cmp    $0x64,%eax
 752:	0f 84 f8 00 00 00    	je     850 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 758:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 75e:	83 f9 70             	cmp    $0x70,%ecx
 761:	74 5d                	je     7c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 763:	83 f8 73             	cmp    $0x73,%eax
 766:	0f 84 84 00 00 00    	je     7f0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 76c:	83 f8 63             	cmp    $0x63,%eax
 76f:	0f 84 ea 00 00 00    	je     85f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 775:	83 f8 25             	cmp    $0x25,%eax
 778:	0f 84 c2 00 00 00    	je     840 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 77e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 781:	83 ec 04             	sub    $0x4,%esp
 784:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 788:	6a 01                	push   $0x1
 78a:	50                   	push   %eax
 78b:	57                   	push   %edi
 78c:	e8 01 fe ff ff       	call   592 <write>
 791:	83 c4 0c             	add    $0xc,%esp
 794:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 797:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 79a:	6a 01                	push   $0x1
 79c:	50                   	push   %eax
 79d:	57                   	push   %edi
 79e:	83 c6 01             	add    $0x1,%esi
 7a1:	e8 ec fd ff ff       	call   592 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7a6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7aa:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7ad:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7af:	84 db                	test   %bl,%bl
 7b1:	75 8d                	jne    740 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7b6:	5b                   	pop    %ebx
 7b7:	5e                   	pop    %esi
 7b8:	5f                   	pop    %edi
 7b9:	5d                   	pop    %ebp
 7ba:	c3                   	ret    
 7bb:	90                   	nop
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 7c0:	83 ec 0c             	sub    $0xc,%esp
 7c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7c8:	6a 00                	push   $0x0
 7ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 7cd:	89 f8                	mov    %edi,%eax
 7cf:	8b 13                	mov    (%ebx),%edx
 7d1:	e8 6a fe ff ff       	call   640 <printint>
        ap++;
 7d6:	89 d8                	mov    %ebx,%eax
 7d8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7db:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 7dd:	83 c0 04             	add    $0x4,%eax
 7e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7e3:	e9 4d ff ff ff       	jmp    735 <printf+0x55>
 7e8:	90                   	nop
 7e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 7f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7f3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7f5:	83 c0 04             	add    $0x4,%eax
 7f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 7fb:	b8 a3 0b 00 00       	mov    $0xba3,%eax
 800:	85 db                	test   %ebx,%ebx
 802:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 805:	0f b6 03             	movzbl (%ebx),%eax
 808:	84 c0                	test   %al,%al
 80a:	74 23                	je     82f <printf+0x14f>
 80c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 810:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 813:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 816:	83 ec 04             	sub    $0x4,%esp
 819:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 81b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 81e:	50                   	push   %eax
 81f:	57                   	push   %edi
 820:	e8 6d fd ff ff       	call   592 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 825:	0f b6 03             	movzbl (%ebx),%eax
 828:	83 c4 10             	add    $0x10,%esp
 82b:	84 c0                	test   %al,%al
 82d:	75 e1                	jne    810 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 82f:	31 d2                	xor    %edx,%edx
 831:	e9 ff fe ff ff       	jmp    735 <printf+0x55>
 836:	8d 76 00             	lea    0x0(%esi),%esi
 839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 840:	83 ec 04             	sub    $0x4,%esp
 843:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 846:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 849:	6a 01                	push   $0x1
 84b:	e9 4c ff ff ff       	jmp    79c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 850:	83 ec 0c             	sub    $0xc,%esp
 853:	b9 0a 00 00 00       	mov    $0xa,%ecx
 858:	6a 01                	push   $0x1
 85a:	e9 6b ff ff ff       	jmp    7ca <printf+0xea>
 85f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 862:	83 ec 04             	sub    $0x4,%esp
 865:	8b 03                	mov    (%ebx),%eax
 867:	6a 01                	push   $0x1
 869:	88 45 e4             	mov    %al,-0x1c(%ebp)
 86c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 86f:	50                   	push   %eax
 870:	57                   	push   %edi
 871:	e8 1c fd ff ff       	call   592 <write>
 876:	e9 5b ff ff ff       	jmp    7d6 <printf+0xf6>
 87b:	66 90                	xchg   %ax,%ax
 87d:	66 90                	xchg   %ax,%ax
 87f:	90                   	nop

00000880 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 880:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 881:	a1 c4 0e 00 00       	mov    0xec4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 886:	89 e5                	mov    %esp,%ebp
 888:	57                   	push   %edi
 889:	56                   	push   %esi
 88a:	53                   	push   %ebx
 88b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 88e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 890:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 893:	39 c8                	cmp    %ecx,%eax
 895:	73 19                	jae    8b0 <free+0x30>
 897:	89 f6                	mov    %esi,%esi
 899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8a0:	39 d1                	cmp    %edx,%ecx
 8a2:	72 1c                	jb     8c0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a4:	39 d0                	cmp    %edx,%eax
 8a6:	73 18                	jae    8c0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8aa:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ac:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ae:	72 f0                	jb     8a0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b0:	39 d0                	cmp    %edx,%eax
 8b2:	72 f4                	jb     8a8 <free+0x28>
 8b4:	39 d1                	cmp    %edx,%ecx
 8b6:	73 f0                	jae    8a8 <free+0x28>
 8b8:	90                   	nop
 8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 8c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8c3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8c6:	39 d7                	cmp    %edx,%edi
 8c8:	74 19                	je     8e3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8cd:	8b 50 04             	mov    0x4(%eax),%edx
 8d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8d3:	39 f1                	cmp    %esi,%ecx
 8d5:	74 23                	je     8fa <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8d7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8d9:	a3 c4 0e 00 00       	mov    %eax,0xec4
}
 8de:	5b                   	pop    %ebx
 8df:	5e                   	pop    %esi
 8e0:	5f                   	pop    %edi
 8e1:	5d                   	pop    %ebp
 8e2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8e3:	03 72 04             	add    0x4(%edx),%esi
 8e6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8e9:	8b 10                	mov    (%eax),%edx
 8eb:	8b 12                	mov    (%edx),%edx
 8ed:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8f0:	8b 50 04             	mov    0x4(%eax),%edx
 8f3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8f6:	39 f1                	cmp    %esi,%ecx
 8f8:	75 dd                	jne    8d7 <free+0x57>
    p->s.size += bp->s.size;
 8fa:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 8fd:	a3 c4 0e 00 00       	mov    %eax,0xec4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 902:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 905:	8b 53 f8             	mov    -0x8(%ebx),%edx
 908:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 90a:	5b                   	pop    %ebx
 90b:	5e                   	pop    %esi
 90c:	5f                   	pop    %edi
 90d:	5d                   	pop    %ebp
 90e:	c3                   	ret    
 90f:	90                   	nop

00000910 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	57                   	push   %edi
 914:	56                   	push   %esi
 915:	53                   	push   %ebx
 916:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 919:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 91c:	8b 15 c4 0e 00 00    	mov    0xec4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 922:	8d 78 07             	lea    0x7(%eax),%edi
 925:	c1 ef 03             	shr    $0x3,%edi
 928:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 92b:	85 d2                	test   %edx,%edx
 92d:	0f 84 a3 00 00 00    	je     9d6 <malloc+0xc6>
 933:	8b 02                	mov    (%edx),%eax
 935:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 938:	39 cf                	cmp    %ecx,%edi
 93a:	76 74                	jbe    9b0 <malloc+0xa0>
 93c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 942:	be 00 10 00 00       	mov    $0x1000,%esi
 947:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 94e:	0f 43 f7             	cmovae %edi,%esi
 951:	ba 00 80 00 00       	mov    $0x8000,%edx
 956:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 95c:	0f 46 da             	cmovbe %edx,%ebx
 95f:	eb 10                	jmp    971 <malloc+0x61>
 961:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 968:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 96a:	8b 48 04             	mov    0x4(%eax),%ecx
 96d:	39 cf                	cmp    %ecx,%edi
 96f:	76 3f                	jbe    9b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 971:	39 05 c4 0e 00 00    	cmp    %eax,0xec4
 977:	89 c2                	mov    %eax,%edx
 979:	75 ed                	jne    968 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 97b:	83 ec 0c             	sub    $0xc,%esp
 97e:	53                   	push   %ebx
 97f:	e8 76 fc ff ff       	call   5fa <sbrk>
  if(p == (char*)-1)
 984:	83 c4 10             	add    $0x10,%esp
 987:	83 f8 ff             	cmp    $0xffffffff,%eax
 98a:	74 1c                	je     9a8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 98c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 98f:	83 ec 0c             	sub    $0xc,%esp
 992:	83 c0 08             	add    $0x8,%eax
 995:	50                   	push   %eax
 996:	e8 e5 fe ff ff       	call   880 <free>
  return freep;
 99b:	8b 15 c4 0e 00 00    	mov    0xec4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 9a1:	83 c4 10             	add    $0x10,%esp
 9a4:	85 d2                	test   %edx,%edx
 9a6:	75 c0                	jne    968 <malloc+0x58>
        return 0;
 9a8:	31 c0                	xor    %eax,%eax
 9aa:	eb 1c                	jmp    9c8 <malloc+0xb8>
 9ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9b0:	39 cf                	cmp    %ecx,%edi
 9b2:	74 1c                	je     9d0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9b4:	29 f9                	sub    %edi,%ecx
 9b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9bc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 9bf:	89 15 c4 0e 00 00    	mov    %edx,0xec4
      return (void*)(p + 1);
 9c5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9cb:	5b                   	pop    %ebx
 9cc:	5e                   	pop    %esi
 9cd:	5f                   	pop    %edi
 9ce:	5d                   	pop    %ebp
 9cf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 9d0:	8b 08                	mov    (%eax),%ecx
 9d2:	89 0a                	mov    %ecx,(%edx)
 9d4:	eb e9                	jmp    9bf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 9d6:	c7 05 c4 0e 00 00 c8 	movl   $0xec8,0xec4
 9dd:	0e 00 00 
 9e0:	c7 05 c8 0e 00 00 c8 	movl   $0xec8,0xec8
 9e7:	0e 00 00 
    base.s.size = 0;
 9ea:	b8 c8 0e 00 00       	mov    $0xec8,%eax
 9ef:	c7 05 cc 0e 00 00 00 	movl   $0x0,0xecc
 9f6:	00 00 00 
 9f9:	e9 3e ff ff ff       	jmp    93c <malloc+0x2c>
