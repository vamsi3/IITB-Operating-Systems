#include "emufs.h"
#include "testcase-common.h"

#define TEST_DEVICE_NAME "testcase4.img"
#define TEST_DEVICE_SIZE 42
#define TEST_FS_NUMBER EMUFS_NON_ENCRYPTED
// #define TEST_FS_NUMBER EMUFS_ENCRYPTED

#define FILE1 "file1.txt"

int main(int argc, char *argv[])
{
	//	Opening and mounting device.
	//	Creating file system, if does not exist.
	struct mount_t* mount1 = testcase_mount_device(TEST_DEVICE_NAME, TEST_DEVICE_SIZE, TEST_FS_NUMBER);
	if(!mount1)
		exit(1);

	mount_dump();
	fsdump(mount1);
	printf("-----------------------------------------------------------------\n\n");

	//	Opening FILE1 twice
	struct file_t *file_write1 = eopen(mount1, FILE1);
	struct file_t *file_write2 = eopen(mount1, FILE1);
	struct file_t *file_read = eopen(mount1, FILE1);

	//	Writing smalltext to FILE1
	testcase_write_to_file(file_write1, FILE1, smalltext);

	//	Writing largetext to FILE1
	testcase_write_to_file(file_write2, FILE1, largetext);

	fsdump(mount1);
	printf("-----------------------------------------------------------------\n");

	//	Reading largetext from FILE1
	testcase_read_from_file(file_read, FILE1, strlen(largetext), 1);

	//	Reading smalltext from FILE1
	testcase_read_from_file(file_read, FILE1, strlen(smalltext), 1);

	fsdump(mount1);
	printf("-----------------------------------------------------------------\n");
	printf("\n");

	//	Closing device
	closedevice(mount1);

	mount_dump();

	return 0;
}
