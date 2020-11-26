default: libmemory.so random

libmemory.so: memory.c mem.s
	gcc -Werror -shared -O3 -fPIC -o libmemory.so mem.s memory.c -lpthread
	gcc -O3 -L`pwd` -Wl,-rpath=`pwd` -o random RandomGraph.c -lmemory


run:
	/usr/bin/time -v ./random

clean:
	rm libmemory.so random

