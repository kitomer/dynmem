
CCOPTS = -std=c99 -Wall -Werror -Wno-unused-function -Wno-unused-variable -Wno-unused-but-set-variable -O2 -g

all: lib

dynmem.o: dynmem.c
	gcc $(CCOPTS) -fPIC -o dynmem.o -c dynmem.c

lib: dynmem.o
	gcc -shared -fPIC -Wl,-soname,libdynmem.so.1 -o libdynmem.so.0.1.0 dynmem.o -lc

install: lib
	cp libdynmem.so.0.1.0 /usr/local/lib/libdynmem.so.1
	ln -s /usr/local/lib/libdynmem.so.1 /usr/local/lib/libdynmem.so

clean:
	rm -f dynmem.o libdynmem.so.0.1.0 test
	
test: test.c
	gcc $(CCOPTS) -L. -ldynmem test.c -o test
