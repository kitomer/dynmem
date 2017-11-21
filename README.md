# dynmem

[![Build Status](https://travis-ci.org/kitomer/dynmem.svg)](https://travis-ci.org/kitomer/dynmem)

This small function collection allows for the management of a dynamic array
of fixed sized byte sequence elements. It autoscales (reallocates) depending
on how it is accessed.

## Features

- manage unlimited dynamic memory buffers with fixed-sized elements (byte sequences)
- no need for calling malloc/realloc/... since dynmem does it for you
- dynmem scales the actual needed memory up as needed (in increments of power of 2)
- dynmem records what range of buffer elements is accessed and when a buffer is reset, the memory is scaled down to a sensible value in order to avoid future reallocations

## Getting Started

This short code snippet demostrates what can be done using dynmem:

```c
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
```

### Dependencies / Prerequisites

None besides a standard C library.

### Installing / Deployment / Integration

#### Method A: Use the source files directly in your project

Just copy the c source and header to your project tree and integrate in your build process.
The Makefile contains an example compile command.

#### Method B: Compile as a shared library and link to your project

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

## Used by

* [ull](https://www.github.com/kitomer/ull) - C unrolled linked list library/implementation
* [tmpl](https://www.github.com/kitomer/tmpl) - C template library/implementation
* [bsbs](https://www.github.com/kitomer/bsbs) - C byte buffer library/implementation
* [elmdb](https://www.github.com/kitomer/elmdb) - extended LMDB C library/implementation
* [dbl](https://www.github.com/kitomer/dbl) - C library/implementation for managing inverted indices based on LMDB/elmdb

## Built With

* [gcc](https://gcc.gnu.org/) - The compiler used
* [glibc](https://www.gnu.org/s/libc/) - The C standard library used

## Contributing

Coming soon.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, 
see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Tom Kirchner** - *Initial work and maintainer* - [kitomer](https://github.com/kitomer)

See also the list of [contributors](https://github.com/kitomer/dynmem/contributors)
who participated in this project.

## License

This project is licensed under the GNU General Public License (version 3 or later) -
see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

Coming soon.
