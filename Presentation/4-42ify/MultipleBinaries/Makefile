# This file links two executables: first second
NAME = first second

# As each executable needs individual sources we seperate them into differnt variables
SRC_F = first.c
SRC_S = second.c

OBJ_F = first.o
OBJ_S = second.o

# all calls name which then calls both linkFirst and link
all: linkFirst linkSecond

# Satisfies the $(NAME) requirement
$(NAME): linkFirst linkSecond

$(OBJ_F): $(SRC_F)
	$(CC) -c $(SRC_F) -o $(OBJ_F)

# This uses the sources to link the final executable
linkFirst: $(OBJ_F)
	$(CC) $(OBJ_F) -o first

$(OBJ_S): $(SRC_S)
	$(CC) -c $(SRC_S) -o $(OBJ_S)

linkSecond: $(OBJ_S)
	$(CC) $(OBJ_S) -o second

clean:
	$(RM) *.o

fclean: clean
	$(RM) $(NAME)

re: fclean all

