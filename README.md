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
    
    //dynmem_resize( &d, 42 );
    dynmem_set( &d, 0, 3, (void *)str );
    dynmem_debug( &d );
	
    dynmem_get( &d, 0, 1, (void **)&strp );
    printf("[0] '%.1s'\n", strp);
    printf("[1,2] '%.2s'\n", strp+1);

## Dependencies
C standard library.

## Integration

### Method A: Use the source files directly in your project
Just copy the c source and header to your project tree and integrate in your build process.
The Makefile contains an example compile command.

### Method B: Compile as a shared library and link to your project
You can use the Makefile to compile it into a shared library using gcc:

    $ make lib

To install it globally to /usr/local/lib use this Makefile target (as root):

    $ make install

The resulting file (ends with .so.VERSION e.g. .so.0.1.0) is the shared library and
can be linked to your C project, for example using gcc:

    $ gcc -o myproject -ldynmem myproject.c 

In order for the library to be found when executing programs that link to it, you can
add the following lines to the end  of your /etc/bashrc file (if not already present):

    export PATH=$PATH:/usr/local/lib
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib


  


