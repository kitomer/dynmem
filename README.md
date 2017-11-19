# dynmem
Manage memory buffers while avoiding reallocation

## Introduction
This small function collection allows for the management of a dynamic array
of fixed sized byte sequence elements. It autoscales (reallocates) depending
on how it is accessed.

## Usage

	dynmem d;
	dynmem_init( &d, 1 );
	char str[ 256 ] = "abc";
	char * strp = 0;
	//int i = 0;

	//dynmem_resize( &d, 42 );
	dynmem_set( &d, 0, 3, (void *)str );
	dynmem_debug( &d );
	
	dynmem_get( &d, 0, 1, (void **)&strp );
	printf("[0] '%.1s'\n", strp);
	printf("[1,2] '%.2s'\n", strp+1);

## Dependencies
C standard library.

## Compilation

	$ gcc -c -Wall -Werror dynmem.c

  


