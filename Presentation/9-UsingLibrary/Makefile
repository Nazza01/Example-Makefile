# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/10 17:59:25 by Nathanael         #+#    #+#              #
#    Updated: 2022/08/31 14:51:53 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME 				=	testingLibrary

SRC_EXT				=	c
INC_EXT				=	h

SRC_DIR				=	sources
INC_DIR				=	includes
BLD_DIR				=	objects
LIB_DIR				=	libs

CC					=	gcc
CFLAGS				=	-Wall -Wextra -Werror -std=c99

UNAME_S := $(shell uname -s)

SRCS		=	$(shell find $(SRC_DIR) -name '*.$(SRC_EXT)')
OBJS		=	$(SRCS:$(SRC_DIR)/%.$(SRC_EXT)=$(BLD_DIR)/%.o)
DEPS		=	$(OBJS:.o=.d)

IMPORTED_INC=	$(INC_DIR)/imported

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

LIBS_NAME	:=	$(basename $(notdir $(FIND_LIBS)))
LIBS_BASE	:=	$(subst lib,,$(LIBS_NAME))

LDFLAGS		=	$(addprefix -L, $(FIND_SUBDIR))
LLFLAGS		=	$(addprefix -l,$(LIBS_BASE))

CFLAGS	+=	-MMD -MP
MAKEFLAGS	+=	--no-print-directory


MAKE		=	make
RM			=	rm -rf
MKDIR		=	mkdir -p
CP			=	cp

.PHONY: all makelibs clean fclean re
.SILENT:

all: makelibs $(NAME)
	$(info Program $(NAME) ready to run)

makelibs:
	$(MKDIR) $(IMPORTED_INC)
	$(CP) $(LIB_INCS) $(IMPORTED_INC)
	for dir in $(FIND_SUBDIR); do \
		$(MAKE) -C "$${dir}" all; \
		printf "$${dir} made\n"; \
	done

$(NAME): $(OBJS)
	$(MKDIR) $(BLD_DIR)
	$(CC) $(CFLAGS) $(OBJS) $(LDFLAGS) $(LLFLAGS) -o $@
	$(info $@ built)

clean:
	$(RM) $(NAME)
	$(info $(NAME) cleaned)

fclean:
	$(RM) $(BLD_DIR)
	$(RM) $(IMPORTED_INC)
	$(info $(BLD_DIR) $(IMPORTED_INC) cleaned)

re: all
	$(RM) $(NAME)
	$(RM) $(BLD_DIR)
	$(info $(NAME) $(BLD_DIR) cleaned)

-include $(DEPS)

$(BLD_DIR)/%.o : $(SRC_DIR)/%.$(SRC_EXT)
	$(MKDIR) $(@D)
	$(CC) $(CFLAGS) $(INC_DIR:%=-I %) -MMD -MP -c $< -o $@
	$(info Source $@ compiled to $<)
