# dynmem

[![Build Status](https://travis-ci.org/kitomer/dynmem.svg)](https://travis-ci.org/kitomer/dynmem)
[![Inline docs](http://inch-ci.org/github/kitomer/dynmem.svg?branch=master)](http://inch-ci.org/github/kitomer/dynmem)
[![HitCount](http://hits.dwyl.io/kitomer/dynmem.svg)](http://hits.dwyl.io/kitomer/dynmem)

This small function collection allows for the management of a dynamic array
of fixed sized byte sequence elements. It autoscales (reallocates) depending
on how it is accessed.

## Features

- manage dynamic arrays with fixed sized elements
- no need for calling malloc/realloc/... since dynmem does it for you
- scales the actually needed memory automatically up and down as needed/written:
  - scales up in increments of power of 2
  - scales down to the some sensible value that will probably not bee exceeded in the near future (based on previous accesses which are recorded internally)

## Getting Started

```c
dynmem d;
dynmem_init( &d, 1 );
char str[ 256 ] = "abc";
char * strp = 0;

dynmem_set( &d, 0, 3, (void *)str );
dynmem_debug( &d );

dynmem_get( &d, 0, 1, (void **)&strp );
printf("[0] '%.1s'\n", strp);
printf("[1,2] '%.2s'\n", strp+1);
```

The basic concept behind dynmem is that it contains as many elements (fixed sized, size given via `dynmem_init()`) as have been set (usually using `dynmem_set()` or `dynmem_push()`). The memory allocated internally is automatically scaled up and down. There are functions for setting and getting one or more elements as well as managing the number of contained elements as well as the internal reserved memory - see [dynmem.h](dynmem.h) for details on all functions.

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
* [tmplvar](https://www.github.com/kitomer/tmplvar) - C template library/implementation
* [bsbs](https://www.github.com/kitomer/bsbs) - C byte buffer library/implementation
* [elmdb](https://www.github.com/kitomer/elmdb) - extended LMDB C library/implementation
* [dbl](https://www.github.com/kitomer/dbl) - C library/implementation for managing inverted indices based on LMDB/elmdb

## Built With

* [gcc](https://gcc.gnu.org/) - The compiler used
* [glibc](https://www.gnu.org/s/libc/) - The C standard library used

## Contributing

[![Contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/kitomer/dynmem/issues)

A dedicated contributing document is coming soon.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, 
see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Tom Kirchner** - *Initial work and maintainer* - [kitomer](https://github.com/kitomer)

See also the list of [contributors](https://github.com/kitomer/dynmem/contributors)
who participated in this project.

## License

This project is licensed under the GNU General Public License (version 3 or later) -
see the [LICENSE](LICENSE) file for details

## Acknowledgments

Coming soon.
