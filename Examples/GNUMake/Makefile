# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/10 17:59:25 by Nathanael         #+#    #+#              #
#    Updated: 2022/08/25 16:08:10 by Nathanael        ###   ########.fr        #
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

STANDARD	=	c99
CXXFLAGS	=	-Wall -Wextra -Werror -std=$(STANDARD)

################################################################################
#						Files/Folders & Libraries							   #
################################################################################

SRCS		=	$(shell find $(SRC_DIR) -name '*.$(SRC_EXT)')
OBJS		=	$(SRCS:$(SRC_DIR)/%.$(SRC_EXT)=$(BLD_DIR)/%.o)

LDFLAGS		=
LLFLAGS		=

CXXFLAGS	+=	-MMD -MP
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

$(NAME): $(OBJS)
	$(MKDIR) $(BLD_DIR)
	$(CC) $(CXXFLAGS) $(OBJS) $(LDFLAGS) $(LLFLAGS) -o $@
	$(info $@ built successfully)

clean:
	$(RM) $(NAME)
	$(info $(NAME) cleaned successfully)

fclean:
	$(RM) $(BLD_DIR)
	$(info $(BLD_DIR) cleaned successfully)

re: clean fclean all

$(BLD_DIR)/%.o : $(SRC_DIR)/%.$(SRC_EXT)
	$(MKDIR) $(@D)
	$(CC) $(CXXFLAGS) $(INC_DIR:%=-I %) -c $< -o $@
	$(info $< linked to $@)