NAME = outputStrLen

SRC_DIR = sources
INC_DIR = includes
OBJ_DIR = objects

# SRC = $(shell find $(SRC_DIR) -name '*.c')
SRC = $(SRC_DIR)/func/ft_strlen.c $(SRC_DIR)/main.c

# Can be written like 
# OBJ = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC))
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

CFLAGS += -Wall -Wextra -Werror -std=c99 -I $(INC_DIR)

MKDIR = mkdir -p
RMDIR = rmdir

.PHONY: all clean fclean re
.SILENT:

all: $(NAME)
	$(info	$(NAME) ready to run)

$(NAME): $(OBJ)
	$(MKDIR) $(OBJ_DIR)
	$(CC) $(CFLAGS) $(OBJ) $(LDFLAGS) $(LLFLAGS) -o $@
	$(info	$(NAME) linked to $(OBJ))

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.c
	$(MKDIR) $(@D)
	$(CC) $(CFLAGS) -c $< -o $@
	$(info	Compiling $< to $@)

clean:
	$(RM) -r $(OBJ_DIR)
	$(info	$(OBJ_DIR) directory cleaned)

fclean: clean

re: clean all
	$(info	$(NAME) remade)
