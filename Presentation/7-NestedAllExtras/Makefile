NAME = outputStrLen

SRC_DIR = src
INC_DIR = inc
OBJ_DIR = obj

SRC = $(shell find $(SRC_DIR) -name '*.c')

# Can be written like 
# OBJ = $(patsubst %.c,%.o,$(SRC))
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

CFLAGS += -Wall -Wextra -Werror -std=c99 -I $(INC_DIR)

MKDIR = mkdir -p

.PHONY: all $(NAME) clean fclean re
.SILENT:

all: $(NAME)
	$(info	$(NAME) ready to run)

$(NAME): $(OBJ)
	$(MKDIR) $(OBJ_DIR)
	$(CC) $(CXXFLAGS) $(OBJ) $(LDFLAGS) $(LLFLAGS) -o $@
	$(info	$(NAME) program made)

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.c
	$(MKDIR) $(@D)
	$(CC) -I $(INC_DIR) $(CFLAGS) -c $< -o $@

clean:
	$(RM) -rf $(OBJ_DIR)
	$(info	$(OBJ_DIR) files cleaned)

fclean: clean
	$(RM) $(NAME)
	$(info	$(NAME) file cleaned)

re: fclean all
	$(info	$(NAME) remade)
