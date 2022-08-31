
# The executable name (./sayhello)
NAME = sayhello

# Flags that are passed to the compiler
# 	+= Adds to the existing flags
CFLAGS += -Wall -Wextra -Werror

# Define the rule all
# 	Compile the source file helloworld.c to the object file helloworld.o
# 	Link the helloworld.o file to the final executable name (sayhello)
# 	The special variable $< refers to the prerequisite rule like so:
# 	all: $(NAME)
#		echo "$<"
# 	Would output sayhello
all: $(NAME)
	@echo "Compiling $<"
	$(CC) $(CFLAGS) -c helloworld.c -o helloworld.o
	@echo "Linking $<"
	$(CC) $(CFLAGS) helloworld.o -o $<

# Define the clean rule
# $(RM) is a default variable containing rm -f
# 	Uses rm -f to remove all .o files
# 	Uses rm -f to remove the executable
clean:
	$(RM) *.o
	$(RM) $(NAME)
