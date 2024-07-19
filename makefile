#paths
BIN = ./bin
MODULES = ./src
INCLUDE = ./include

#flags
CC = gcc
CFLAGS = -g3 -Wall -I$(INCLUDE)

#Programs
PROG = jobCommander
PROG1 = jobExecutorServer
SRCS = jobCommander.c checkArguments.c queueList.c
SRCS1 = jobExecutorServer.c checkArguments.c queueList.c

all: $(BIN)/$(PROG) $(BIN)/$(PROG1)

#Compilation rules
$(BIN)/jobCommander.o: $(MODULES)/jobCommander.c $(INCLUDE)/checkArguments.h $(INCLUDE)/queueList.h
	$(CC) $(CFLAGS) -c $(MODULES)/jobCommander.c -o $(BIN)/jobCommander.o

$(BIN)/jobExecutorServer.o: $(MODULES)/jobExecutorServer.c $(INCLUDE)/checkArguments.h $(INCLUDE)/queueList.h 
	$(CC) $(CFLAGS) -c $(MODULES)/jobExecutorServer.c -o $(BIN)/jobExecutorServer.o

$(BIN)/checkArguments.o: $(MODULES)/checkArguments.c $(INCLUDE)/checkArguments.h
	$(CC) $(CFLAGS) -c $(MODULES)/checkArguments.c -o $(BIN)/checkArguments.o

$(BIN)/queueList.o: $(MODULES)/queueList.c $(INCLUDE)/queueList.h 
	$(CC) $(CFLAGS) -c $(MODULES)/queueList.c -o $(BIN)/queueList.o

#Linking rules
$(BIN)/$(PROG): $(BIN)/jobCommander.o $(BIN)/checkArguments.o $(BIN)/queueList.o 
	$(CC) $(BIN)/jobCommander.o $(BIN)/checkArguments.o $(BIN)/queueList.o  -o $(BIN)/$(PROG) $(CFLAGS) -lpthread

$(BIN)/$(PROG1): $(BIN)/jobExecutorServer.o $(BIN)/checkArguments.o $(BIN)/queueList.o 
	$(CC) $(BIN)/jobExecutorServer.o $(BIN)/checkArguments.o $(BIN)/queueList.o  -o $(BIN)/$(PROG1) $(CFLAGS) -lpthread

#Clean rule
clean:
	rm -rf $(BIN)/*.o $(BIN)/$(PROG) $(BIN)/$(PROG1)

