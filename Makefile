
all: lib

dynmem.o: dynmem.c
	gcc -g -O2 -fPIC -Wall -Werror -std=c99 -o dynmem.o -c dynmem.c

lib: dynmem.o
	gcc -shared -fPIC -Wl,-soname,libdynmem.so.1 -o libdynmem.so.0.1.0 dynmem.o -lc

install: lib
	cp libdynmem.so.0.1.0 /usr/local/lib/libdynmem.so.1
	ln -s /usr/local/lib/libdynmem.so.1 /usr/local/lib/libdynmem.so

clean:
	rm -f dynmem.o libdynmem.so.0.1.0
	
