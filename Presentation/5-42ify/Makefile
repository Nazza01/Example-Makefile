NAME = ftmake

SRC = testing.c
OBJ = testing.o

.PHONY: all clean fclean re
.SILENT:

all: $(NAME)
	echo "$(NAME) ready to be run"

$(NAME): $(OBJ)
	echo "Compiling $(SRC) to $(OBJ)"
	gcc -c $(SRC) -o $(OBJ)
	echo "Linking $(OBJ) to $(NAME)"
	gcc $(OBJ) -o $(NAME)

clean:
	$(RM) $(NAME)
	echo "Cleaned $(NAME)"

fclean:
	$(RM) $(OBJ)
	echo "Cleaned $(OBJ)"

re: fclean clean all

