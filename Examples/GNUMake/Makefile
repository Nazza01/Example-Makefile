# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/10 17:59:25 by Nathanael         #+#    #+#              #
#    Updated: 2022/09/09 23:44:51 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################################################
#									Variables								   #
################################################################################

NAME		=	gnuMake

SRC_EXT		=	c
INC_EXT		=	h

SRC_DIR		=	src
INC_DIR		=	inc
BLD_DIR		=	build

CC			=	gcc
CSTD		=	c99
CFLAGS		=	-Wall -Wextra -Werror -std=$(CSTD)

################################################################################
#						Files/Folders & Libraries							   #
################################################################################

SRCS		=	$(shell find $(SRC_DIR) -name '*.$(SRC_EXT)')
OBJS		=	$(SRCS:$(SRC_DIR)/%.$(SRC_EXT)=$(BLD_DIR)/%.o)

CFLAGS		+=	-MMD -MP
MAKEFLAGS	+=	--no-print-directory

################################################################################
#								Utilities									   #
################################################################################

MAKE		=	make
RM			=	rm -rf
MKDIR		=	mkdir -p
CP			=	cp

################################################################################
#								Make Rules									   #
################################################################################
.PHONY: all clean fclean re
.SILENT:

all: $(NAME)

$(BLD_DIR)/%.o : $(SRC_DIR)/%.$(SRC_EXT)
	$(MKDIR) $(@D)
	$(CC) $(CFLAGS) $(INC_DIR:%=-I %) -c $< -o $@
	$(info $< linked to $@)

$(NAME): $(OBJS)
	$(MKDIR) $(BLD_DIR)
	$(CC) $(OBJS) $(LDFLAGS) $(LLFLAGS) -o $@
	$(info $@ built successfully)

clean:
	$(RM) $(NAME)
	$(info $(NAME) cleaned successfully)

fclean:
	$(RM) $(BLD_DIR)
	$(info $(BLD_DIR) cleaned successfully)

re: clean fclean all