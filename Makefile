CC := g++
exe := main
obj := main.o statistic.o evaluate.o utility.o
CFLAGS := -std=c++17 -O2 -Wall -Wextra -fsanitize=undefined -fsanitize=address
LINK := -lm -ldl -lreadline -lpthread
LIB := lib/libabc.a
#INCLUDES :=

all:$(obj) $(LIB)
	$(CC) $(CFLAGS) -o $(exe) $(obj) $(LIB) $(LINK)
%.o:%.cpp
	$(CC) $(CFLAGS) -c $^ -o $@
lib/libabc.a:
	cd lib/abc/ && make -j 20 libabc.a
	mv lib/abc/libabc.a lib/
clean:remove
	rm -rf $(obj) $(exe)

remove:
	rm -f nCir* output-*
