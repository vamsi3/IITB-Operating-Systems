#include "emufs.h"
#include "testcase-common.h"

#define TEST_DEVICE_NAME "testcase5.img"
#define TEST_DEVICE_SIZE 6
#define TEST_FS_NUMBER EMUFS_NON_ENCRYPTED
// #define TEST_FS_NUMBER EMUFS_ENCRYPTED

#define FILE1 "file1.txt"
#define FILE2 "file2.txt"
#define FILE3 "file3.txt"

int main(int argc, char *argv[])
{
	char readBuf[2048];

	//	Opening and mounting device.
	//	Creating file system, if does not exist.
	struct mount_t* mount1 = testcase_mount_device(TEST_DEVICE_NAME, TEST_DEVICE_SIZE, TEST_FS_NUMBER);
	if(!mount1)
		exit(1);

	mount_dump();
	printf(" \n");
	
	//	Opening two files, FILE1 and FILE2, on TEST_DEVICE_NAME_A
	struct file_t *f1 = eopen(mount1, FILE1);
	struct file_t *f2 = eopen(mount1, FILE2);
	struct file_t *f3 = eopen(mount1, FILE3);
	
	fsdump(mount1);
	printf("-----------------------------------------------------------------\n");
	
	//	Writing smalltext to FILE1
	testcase_write_to_file(f1, FILE1, smalltext);
	
	//	Writing largetext to FILE2
	testcase_write_to_file(f2, FILE2, largetext);
	
	fsdump(mount1);
	printf("-----------------------------------------------------------------\n");

	//	Writing veryLargetext to FILE3
	testcase_write_to_file(f3, FILE3, veryLargetext);

	//	Writing smalltext to FILE3
	testcase_write_to_file(f3, FILE3, smalltext);

	fsdump(mount1);
	printf("-----------------------------------------------------------------\n");

	mount_dump();
	printf(" \n");

	closedevice(mount1);

	return 0;
}
