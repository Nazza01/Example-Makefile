NAME = outputStrLen

SRC = ft_strlen.c main.c

# Can be written like 
# OBJ = $(patsubst %.c,%.o,$(SRC))
OBJ = $(SRC:%.c=%.o)

CFLAGS += -Wall -Wextra -Werror -std=c99

.PHONY: all $(NAME) clean fclean re
.SILENT:

all: $(NAME)
	$(info	$(NAME) ready to run)

$(NAME):
	$(CC) $(CFLAGS) $(SRC) -o $(NAME)
	$(info	$(NAME) program made)

clean:
	$(RM) $(OBJ)
	$(info	$(OBJ) files cleaned)

fclean: clean
	$(RM) $(NAME)
	$(info	$(NAME) file cleaned)

re: fclean all
	$(info	$(NAME) remade)

