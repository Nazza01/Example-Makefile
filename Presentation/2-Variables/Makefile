NAME = sayhello
CFLAGS += -Wall -Wextra -Werror

all:
	@echo "Compiling $(NAME)"
	$(CC) $(CFLAGS) -c helloworld.c -o helloworld.o
	@echo "Linking $(NAME)"
	$(CC) $(CFLAGS) helloworld.o -o $(NAME)

clean:
	$(RM) *.o
	$(RM) $(NAME)
