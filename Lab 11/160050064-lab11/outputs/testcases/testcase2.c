#include "emufs.h"
#include "testcase-common.h"

#define TEST_DEVICE_NAME "testcase2.img"
#define TEST_DEVICE_SIZE 42
#define TEST_FS_NUMBER EMUFS_NON_ENCRYPTED
// #define TEST_FS_NUMBER EMUFS_ENCRYPTED

#define FILE1 "file1.txt"
#define FILE2 "file2.txt"

int main(int argc, char *argv[])
{
	//	Opening and mounting device.
	//	Creating file system, if does not exist.
	struct mount_t* mount1 = testcase_mount_device(TEST_DEVICE_NAME, TEST_DEVICE_SIZE, TEST_FS_NUMBER);
	if(!mount1)
		exit(1);

	mount_dump();
	fsdump(mount1);
	printf(" \n");

	//	Opening two files, FILE1 and FILE2.
	struct file_t *f1 = eopen(mount1, FILE1);
	struct file_t *f2 = eopen(mount1, FILE2);

	//	Writing smalltext to FILE1
	testcase_write_to_file(f1, FILE1, smalltext);

	//	Writing veryLargetext to FILE2
	testcase_write_to_file(f2, FILE2, veryLargetext);

	//	Writing veryLargetext to FILE1
	testcase_write_to_file(f1, FILE1, veryLargetext);

	//	Writing largetext to FILE2
	testcase_write_to_file(f2, FILE2, largetext);
	printf("\n");

	eclose(f1);
	eclose(f2);
	
	fsdump(mount1);
	printf("-----------------------------------------------------------------\n\n");

	if(closedevice(mount1) < 0)
		exit(1);

	mount_dump();

	printf("\n......................... Reopening device ...................... \n\n"); 

	struct mount_t* mount2 = testcase_mount_device(TEST_DEVICE_NAME, TEST_DEVICE_SIZE, TEST_FS_NUMBER);
	if(!mount2)
		exit(1);

	mount_dump();
	fsdump(mount2);
	printf("-----------------------------------------------------------------\n\n");

	struct file_t *fa = eopen(mount2, FILE1);
	struct file_t *fb = eopen(mount2, FILE2);

	// Reading  smalltext from FILE1
	testcase_read_from_file(fa, FILE1, strlen(smalltext), 1);

	// Reading  veryLargetext from FILE1
	testcase_read_from_file(fa, FILE1, strlen(veryLargetext), 1);

	// Reading  veryLargetext from FILE2
	testcase_read_from_file(fb, FILE2, strlen(veryLargetext), 1);


	fsdump(mount2);
	printf("-----------------------------------------------------------------\n\n");

	if(closedevice(mount2) < 0)
		exit(1);

	mount_dump();

	return 0;
}
