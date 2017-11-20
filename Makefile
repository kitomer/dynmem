
all: dynmem.o lib

dynmem.o: dynmem.c
	gcc -g -O2 -fPIC -Wall -Werror -std=c99 -o dynmem.o -c dynmem.c

lib:
	gcc -shared -fPIC -Wl,-soname,libdynmem.so.1 -o libdynmem.so.0.1.0 dynmem.o -lc

clean:
	rm dynmem.o
	rm libdynmem.so.0.1.0
	
