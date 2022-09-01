# Define the name of the executable
NAME = outputStrLen

# List directory structure
SRC_DIR = sources
HDR_DIR = headers
OBJ_DIR = objects


# List the sources
FILES :=	ft_strlen \
			main

# ft_strlen becomes sources/ft_strlen
FILES_APPEND := $(addprefix $(SRC_DIR)/,$(FILES))

# sources/ft_strlen becomes sources/ft_strlen.c
SRC := $(addsuffix .c,$(FILES_APPEND))

# Uses current shell to find the sources in the given directory (overrides source prepend and .c additions above)
# SRC := $(shell find $(SRC_DIR) -name "*.c")

# Define a new list of object files from the source files
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# Define all the flags to be used with each compile and link step
CFLAGS += -Wall -Wextra -Werror -std=c99 -I $(HDR_DIR)

# Define each external utility that we will use
MKDIR = mkdir -p
RMDIR = rmdir

# Define the phony rule
.PHONY: all clean fclean re
.SILENT:

# Default rule step calls name
all: $(NAME)
	$(info $(NAME) ready to run)

# Define a pattern for each object file to create from each source file
# We use mkdir to create each subdirectory for each object file corresponding to the source file
# @D is a special type of syntax which refers to the directory part of a target (sources/funct for a file in sources/funct/ft_strlen.c)
# 	e.g A source file: sources/func/ft_strlen.c the rule would be
# 	objects/funct/ft_strlen.o : sources/funct/ft_strlen
$(OBJ): $(OBJ_DIR)/%.o : $(SRC_DIR)/%.c
	$(MKDIR) $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@
	$(info $< compiled to $@)

# Define the rule for the program which looks at the objects first
#	link each object file to the final exectutable
$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $@
	$(info $(OBJ) linked to $@)

# Define the clean rule
clean:
	$(RM) -r $(OBJ_DIR)
	$(info Cleaned $(OBJ_DIR))

# Define the fclean rule
fclean: clean
	$(RM) $(NAME)
	$(info Cleaned $(NAME))

# Define the re rule
re: fclean all
