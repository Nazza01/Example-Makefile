# Define the name of the program
NAME = ftmake

# Listing the source file and the object file
SRC = testing.c
OBJ = testing.o

# Define a phony list
.PHONY: all clean fclean re
# Silence all output (saves us from writing @ everywhere)
.SILENT:

# Define the all rule which runs $(NAME) first
# 	Output "ftmake ready to be run"
all: $(NAME)
	echo "$(NAME) ready to be run"

# Define the rule $(NAME) which uses $(OBJ) - object files
# 	Output "Compiling testing.c to testing.o"
# 	Compile each source file to the object file
# 	Output "Linking testing.o to ftmake"
# 	Link each object file to the final executable
$(NAME): $(OBJ)
	echo "Compiling $(SRC) to $(OBJ)"
	gcc -c $(SRC) -o $(OBJ)
	echo "Linking $(OBJ) to $(NAME)"
	gcc $(OBJ) -o $(NAME)

# Define the clean rule
# 	Remove final executable using system defined RM = rm -f
# 	Output "Cleaned ftmake"
clean:
	$(RM) $(NAME)
	echo "Cleaned $(NAME)"

# Define the fclean rule
# 	Remove the object files using system define RM = rm -f
# 	Output "Cleaned testing.o"
fclean:
	$(RM) $(OBJ)
	echo "Cleaned $(OBJ)"

# Define the re rule
#	This rule runs three rules in sequential order: fclean clean all
# 	fclean	- "Cleaned testing.o"
# 	clean	- "Cleaned ftmake'
# 	all		- "Compiling testing.c to testing.o"
#			- "Linking testing.o to ftmake"
# 			- "ftmake ready to be run"
re: fclean clean all

