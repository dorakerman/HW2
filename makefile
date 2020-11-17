# These are variables. We usually define CC, CCLINK, CFLAGS, and OBJS
CC=gcc
CCLINK=$(CC) # Read variable CC using $(CC)
CFLAGS=-g -Wall -std=c99
OBJS=file0.o file1.o file2.o file3.o file4.o main.o
EXEC=prog.exe
RM=rm -rf *.o *.exe

#First rule that will compile all - default when running the file.
all: $(OBJS)
	$(CCLINK) $(OBJS) -o $(EXEC)

#Now we take care of the o files 1 by 1
file0.o: file0.c file0.h file2.h file4.h
	$(CC) $(CFLAGS) -c file0.c

file1.o: file1.c file1.h file2.h file3.h
	$(CC) $(CFLAGS) -c file1.c

file2.o: file2.c file2.h file0.h file1.h file4.h
	$(CC) $(CFLAGS) -c file2.c

file3.o: file3.c file3.h file2.h file4.h
	$(CC) $(CFLAGS) -c file3.c

file4.o: file4.c file4.h file0.h file1.h file2.h file3.h
	$(CC) $(CFLAGS) -c file4.c

main.o: main.c file0.h file1.h file2.h file3.h file4.o
	$(CC) $(CFLAGS) -c main.c

#Clean operation to delete all automatic generated files.
clean:
	$(RM)