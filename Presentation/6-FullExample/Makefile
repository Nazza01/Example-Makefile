# Define the program executable
NAME = outputStrLen

# Can also use the following command:
# SRC := $(shell find . -name "*.c")
# 	This command does the following
# 		find in the directory '.' (current directory)
# 		the name matching "*.c" (any .c file in the current directory or nested directories)
# Define the sources list
SRC = ft_strlen.c main.c

# Objects can also be written like so:
# OBJ = $(patsubst %.c,%.o,$(SRC))

# Define the .o files using the wildcard definition % which acts like a wildcard
# So the line $(SRC:%.c=%.o) says
# For every source file apply the following
# 	create a new file based off of each .c file with the extension .o
OBJ = $(SRC:%.c=%.o)

# Define the flags to pass to the compiler
# 	-I . 		Include the current directory (headers are located here)
# 	-Wall		Enables all warnings (no extras) 
# 	-Wextra		Enables all extra warning flags
# 	-Werror		Turns all warnings into errors
# 	-std=c99	Set the standard of the compiler (c99 in our case)
CFLAGS += -I . -Wall -Wextra -Werror -std=c99

# Define the phony rule
.PHONY: all $(NAME) clean fclean re
# Supress the output of all the rules
# .SILENT:

# Default rule which calls name
# $(info ...) is a make utility that allows for output instead of echo
all: $(NAME)
	$(info	$(NAME) ready to run)

# NAME rule does the following automatically when a %.o and %.c rule arent defined
# $(CC) $(CFLAGS) -c -o $(OBJ) $(SRC)
# 	cc -I . -Wall -Wextra -Werror -std=c99 -c -o ft_strlen.o ft_strlen.c
# 	cc -I . -Wall -Wextra -Werror -std=c99 -c -o main.o main.c
# Breakdown:
# 	Compile using the default C compiler (cc default)
# 	Add CFLAGS to each step
# 	Define -c flag - compile the source file but not link (reserved for the final executable)
# 	Define -o flag - this says place the output of the compilation into the object file
# Final Linking Step:
# 	cc -I . -Wall -Wextra -Werror -std=c99 ft_strlen.o main.o -o outputStrLen
$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $(NAME)
	$(info	$(NAME) program made)

# Define the clean rule
clean:
	$(RM) $(OBJ)
	$(info	$(OBJ) files cleaned)

# Define the fclean rule, which runs clean first to remove all object files
fclean: clean
	$(RM) $(NAME)
	$(info	$(NAME) file cleaned)

# Define the re rule, which then calls fclean (fclean calls clean as well) then re-compile all sources and link to final executable
re: fclean all
	$(info	$(NAME) remade)

