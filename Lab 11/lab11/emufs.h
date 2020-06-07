#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/types.h>
#include <unistd.h>
#include <time.h>
#include <string.h>

#define BLOCKSIZE 512
#define MAX_BLOCKS 42 	// This is superblock(1) + metadata(1) + data(40)
#define MAX_FILE_SIZE 4 // In Blocks
#define MAX_FILES 10
#define MAX_MOUNT_POINTS 10

#define UNUSED 0
#define USED 1
#define MAGIC_NUMBER 6763

#define EMUFS_NON_ENCRYPTED 0
#define EMUFS_ENCRYPTED 1

/* ------------------- In-Disk objects ------------------- */
struct superblock_t
{
	int magic_number;
	char device_name[20];	    // name of the device
	int disk_size;		    // size of the device in blocks
	int fs_number;		    // File system number
				    // -1: No filesystem exists
				    //  0: emufs not-encrypted
				    //  1: emufs encrypted
				    // other: Unknown file system
	char bitmap[MAX_BLOCKS];    // Bitmap of blocks
				    // 0 = free block,  
				    // 1 = allocated, 
	                            // x = block not exist(block number is greater than disk_size) 
};

struct inode_t
{
	int status;		    // Status of inode. 	 
	  			    // 0 = Unused/Free. 
	      			    // 1 = Used
	char name[10];		    // name of the file
	int file_size;		    // size of the file in bytes
	int blocks[4];		    // array of allocated blocks
			            // blocks[i] = -1 : block is not allocated.
	                            // blocks[i] > 0   : block number
	time_t modtime;		    // last modified time
};

struct metadata_t
{	// Array of inodes.
	// Stored in metadata block
	struct inode_t inodes[MAX_FILES];		
};


/* ------------------- In-Memory objects ------------------- */
struct file_t
{
	int offset;		        // offset of the file
	int inode_number;	        // inode number of the file in the disk
	struct mount_t* mount_point;    // reference to mount point
};

struct mount_t
{
	int device_fd;		        // Device number / File descriptor of opened file
					//  <= 0: Unused mount point
					//   > 0: file descriptor of the file used to emulate
                                        //        the disk
	char device_name[20]; 	        // device name / emulated file name
	int fs_number;                  // File system number
};

/*-----------DEVICE------------*/
struct mount_t* opendevice(char *device_name, int size);
int readblock(int dev_fd, int block, char * buf);
int writeblock(int dev_fd, int block, char * buf);
int closedevice(struct mount_t *mount_point);
void mount_dump(void);

/*-----------FILE SYSTEM API------------*/
int create_file_system(struct mount_t *mount_point, int fs_number);
struct file_t* eopen(struct mount_t *mount_point, char * filename);
void eclose(struct file_t* file);
int eread(struct file_t* file, char* data, int size);
int ewrite(struct file_t* file, char* data, int size);
int eseek(struct file_t *, int );
void fsdump(struct mount_t *mount_point);

