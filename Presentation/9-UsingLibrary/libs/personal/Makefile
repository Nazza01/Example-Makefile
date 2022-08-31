# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/01 20:23:35 by Nathanael         #+#    #+#              #
#    Updated: 2022/08/15 22:38:23 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################################################
#							Edit this section								   #
NAME		=	libper.a
COMPILER	=	gcc
SOURCE_EXT	=	c
COMP_STD	=	-std=c99
COMP_FLAGS	=	-Wall -Wextra -Werror
# 																			   #
################################################################################

################################################################################
#								Directories/Files							   #
################################################################################
SRC_DIR		=	./sources
HDR_DIR		=	./includes
BUILD_DIR	=	./build

SOURCES		=	$(shell find $(SRC_DIR) -name '*.$(SOURCE_EXT)')
OBJECTS		=	$(SOURCES:$(SRC_DIR)/%.$(SOURCE_EXT)=$(BUILD_DIR)/%.o)
DEPS		=	$(OBJECTS:.o=.d)

LOG			=	$(shell find . -name '*.log')
################################################################################
#								Flags/Utilities								   #
################################################################################
CFLAGS		+=	$(COMP_STD) $(COMP_FLAGS)
LDFLAGS		+=	
INCLUDES	=	-I $(HDR_DIR)

CLEAN_LST	=	$(NAME) $(LOG)
FCLN_LST	=	$(BUILD_DIR) $(LOG)

RM			=	rm -rf
MKDIR		=	mkdir -p
AR			=	ar -rcs
RANLIB		=	ranlib

BUILD_RULE	:=	$(AR)
CLEAN_RULE	:=	$(RM)
LINK_RULE	:=	$(COMPILER) $(CFLAGS) $(INCLUDES) -c -o
################################################################################
#								Make Rules									   #
################################################################################
.DELETE_ON_ERROR:
.SILENT:

ifeq ($(SILENT_SUBMAKE),0)
all: printout $(NAME)
endif

all: $(NAME)

printout:
	$(info	$(NAME) successfully created)

$(NAME): $(OBJECTS)
	$(MKDIR) $(BUILD_DIR)
	$(BUILD_RULE) $@ $^
	$(RANLIB) $(NAME)

c clean:
	$(CLEAN_RULE) $(CLEAN_LST) $(FCLN_LST)

cc:
	clear
	$(MAKE) c

r: c all

-include $(DEPS)

$(BUILD_DIR)/%.o : $(SRC_DIR)/%.$(SOURCE_EXT)
	$(MKDIR) $(@D)
	$(LINK_RULE) $@ $<