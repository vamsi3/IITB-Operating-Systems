#include "emufs.h"

/**************************** File system helper functions ****************************/

//	Function to encrypt a block of data 
int encrypt(char* input, char* encrypted)
{
	for(int i=0; i<BLOCKSIZE; i++)
	{
		encrypted[i] = ~input[i];
	}
}

//	Function to decrypt a block of data 
int decrypt(char* input, char* decrypted)
{
	for(int i=0; i<BLOCKSIZE; i++)
	{
		decrypted[i] = ~input[i];
	}
}

//	The following helper functions are used to read and write 
//	superblock and metadata block. 
//	Change the function definitions with required arguments
struct superblock_t* readSuperblock()
{
	/*
		* Read 0th block from the device into a blocksize buffer
		* Create superblock_t variable and fill it using reader buffer
		* Return the superblock_t variable
	*/
}

int writeSuperblock()
{
	/*
		* Read the 0th block from device into a buffer
		* Write the superblock into the buffer
		* Write back the buffer into block 0
	*/
}

struct metadata_t* readMetadata()
{
	// Same as readSuperBlock(), but it is stored on block 1
	// Need to decrypt if emufs-encrypted is used  
}

int writeMetadata()
{
	// Same as writeSuperblock(), but it is stored on block 1
	// Need to decrypt/encrypt if emufs-encrypted is used  
}

/**************************** File system API ****************************/

int create_file_system(struct mount_t *mount_point, int fs_number)
{
	/*
	   	* Read the superblock.
	    * Set file system number on superblock
		* Clear the bitmaps.  values on the bitmap will be either '0', or '1', or'x'. 
		* Create metadata block in disk
		* Write superblock and metadata block back to disk.

		* Return value: -1,		error
						 1, 	success
	*/

	return 1;
}


struct file_t* eopen(struct mount_t* mount_point, char* filename)
{
	/* 
		* If file exist, get the inode number. inode number is the index of inode in the metadata.
		* If file does not exist, 
			* find free inode.
			* allocate the free inode as USED
			* if free id not found, print the error and return -1
		* Create the file hander (struct file_t)
		* Initialize offset in the file hander
		* Return file handler.

		* Return NULL on error.
	*/

	return NULL;
}

int ewrite(struct file_t* file, char* data, int size)
{
	// You do not need to implement partial writes in case file exceeds 4 blocks
	// or no free block is available in the disk. 

	// Return value: 	-1,  error
	//					Number of bytes written

	return 1;
}

int eread(struct file_t* file, char* data, int size)
{
	// NO partial READS.

	// Return value: 	-1,  error
	//					Number of bytes read

	return 1;
}

void eclose(struct file_t* file)
{
	// free the memory allocated for the file handler 'file'
}

int eseek(struct file_t *file, int offset)
{
	// Change the offset in file hanlder 'file'

	return 1;
}

void fsdump(struct mount_t* mount_point)
{

	// printf("\n[%s] fsdump \n", mount_point->device_name);
	// printf("%-10s %6s \t[%s] \t%s\n", "  NAME", "SIZE", "BLOCKS", "LAST MODIFIED");
	
	// printf("%-10s %6d \t[%d %d %d %d] \t%s", 
	// 	file anme, 
	// 	file size,
	// 	first block,
	// 	second block,
	// 	third block,
	// 	fourth block,
	// 	asctime(localtime(&(inode->modtime))));

}
