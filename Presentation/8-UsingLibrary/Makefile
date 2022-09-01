# Define project name, extensions, directories and compiler type
NAME 				=	testingLibrary

SRC_EXT				=	c
INC_EXT				=	h

SRC_DIR				=	sources
INC_DIR				=	includes
BLD_DIR				=	objects
LIB_DIR				=	libs

CC					=	gcc
CFLAGS				=	-Wall -Wextra -Werror -std=c99 -I $(INC_DIR)

# Detects the OS for Windows Subsystem for Linux, macOS/OS X
UNAME_S := $(shell uname -s)

# Find sources, objects and dependancies
SRCS		=	$(shell find $(SRC_DIR) -name '*.$(SRC_EXT)')
OBJS		=	$(SRCS:$(SRC_DIR)/%.$(SRC_EXT)=$(BLD_DIR)/%.o)

# Directory to place library headers
IMPORTED_INC=	$(INC_DIR)/imported

# Detect and use a different find command based on OS
ifeq ($(UNAME_S),Linux)
FIND_SUBDIR	:=	$(shell find $(LIB_DIR) -mindepth 1 -maxdepth 1 -type d)
FIND_LIBS	:=	$(shell find $(LIB_DIR) -mindepth 1 -maxdepth 2 -name 'lib*.a' -type f)
LIB_INCS	:=	$(shell find $(LIB_DIR) -name '*.$(INC_EXT)')
endif
ifeq ($(UNAME_S),Darwin)
FIND_SUBDIR	:=	$(shell find $(LIB_DIR) -type d -depth 1)
FIND_LIBS	:=	$(shell find $(LIB_DIR) -type f -depth 2 -name 'lib*.a')
LIB_INCS	:=	$(shell find $(LIB_DIR) -name '*.$(INC_EXT)')
endif

# Detects the base library name: libabc.a becomes abc (used for LLFLAGS)
LIBS_NAME	:=	$(basename $(notdir $(FIND_LIBS)))
LIBS_BASE	:=	$(subst lib,,$(LIBS_NAME))

# Detect and convert the following for use in linking step 
# -L libs/dir	Look for the folder inside of the library - libs/dir
# -l abc		Look for the library called abc inside the above library NOTE this must be without lib*.a
# -L libs/libft -l ft
LDFLAGS		=	$(addprefix -L, $(FIND_SUBDIR))
LLFLAGS		=	$(addprefix -l,$(LIBS_BASE))

# Utilities to use further on
MKDIR		=	mkdir -p
CP			=	cp

# Define .PHONY and .SILENT
.PHONY: all makelibs clean fclean re
.SILENT:

# Define the default rule which calls makelibs then $(NAME)
all: makelibs $(NAME)
	$(info Program $(NAME) ready to run)

# Define the rule to make the libraries as they are needed by the program
# 	Make the imported directory inside $(INC_DIR)
# 	Copy over any found .h files from the libraries
# 	Use $(MAKE) in each library as we need the lib*.a files
# 	Print out when we've made each library
makelibs:
	$(MKDIR) $(IMPORTED_INC)
	$(CP) $(LIB_INCS) $(IMPORTED_INC)
	for dir in $(FIND_SUBDIR); do \
		$(MAKE) -C "$${dir}" all; \
		printf "$${dir} made\n"; \
	done

# Define the compilation step for each source
$(OBJS): $(BLD_DIR)/%.o : $(SRC_DIR)/%.$(SRC_EXT)
	$(MKDIR) $(@D)
	$(CC) $(CFLAGS) -c $< -o $@
	$(info Source $@ compiled to $<)

# Define the NAME rule which prerequistes are objs
$(NAME): $(OBJS)
	$(MKDIR) $(BLD_DIR)
	$(CC) $(CFLAGS) $(OBJS) $(LDFLAGS) $(LLFLAGS) -o $@
	$(info $@ built)

# Define the clean rule
clean:
	$(RM) $(NAME)
	$(info $(NAME) cleaned)

# Define the fclean rule
fclean:
	$(RM) -r $(BLD_DIR)
	$(RM) -r $(IMPORTED_INC)
	$(info $(BLD_DIR) $(IMPORTED_INC) cleaned)

# Define the re rule
re: fclean clean all

