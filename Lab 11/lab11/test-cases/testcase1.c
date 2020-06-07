#include "emufs.h"
#include "testcase-common.h"

#define TEST_DEVICE_NAME "testcase1.img"
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
	printf("-----------------------------------------------------------------\n\n");

	//	Opening two files, FILE1 and FILE2.
	struct file_t *f1 = eopen(mount1, FILE1);
	struct file_t *f2 = eopen(mount1, FILE2);

	//	Writing and reading smalltext to and from FILE1
	testcase_write_to_file(f1, FILE1, smalltext);
	testcase_change_offset(f1, FILE1, 0);
	testcase_read_from_file(f1, FILE1, strlen(smalltext), 1);

	//	Writing and reading largetext to and from FILE2
	testcase_write_to_file(f2, FILE2, largetext);
	testcase_change_offset(f2, FILE2, 0);
	testcase_read_from_file(f2, FILE2, strlen(largetext), 1);

	fsdump(mount1);
	printf("-----------------------------------------------------------------\n");

	//	Writing and reading veryLargetext to and from FILE1
	testcase_write_to_file(f1, FILE1, veryLargetext);
	testcase_change_offset(f1, FILE1, strlen(smalltext));
	testcase_read_from_file(f1, FILE1, strlen(veryLargetext), 1);

	fsdump(mount1);
	printf("-----------------------------------------------------------------\n\n");

	//	Closing device
	closedevice(mount1);

	mount_dump();

	return 0;
}
