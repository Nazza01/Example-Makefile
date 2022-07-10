# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Valgrind.mk                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/01 20:23:35 by Nathanael         #+#    #+#              #
#    Updated: 2022/07/10 16:18:42 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#							Edit this section								   #
NAME		=	SetFire
COMPILER	=	c++
SOURCE_EXT	=	cpp
COMP_STD	=	-std=c++98
COMP_FLAGS	=	$(COMP_WALL) -g
VALGRND_NAME=	v_ex01
# 																			   #
# **************************************************************************** #

#				Progress Bar
ifndef ECHO
T := $(shell $(MAKE) $(MAKECMDGOALS) --no-print-directory \
	-nrRf $(firstword $(MAKEFILE_LIST)) \
	ECHO="COUNTTHIS" | grep -c "COUNTTHIS")

N := x
C = $(words $N)$(eval N := x $N)
ECHO = echo "`expr " [\`expr $C '*' 100 / $T\`" : '.*\(....\)$$'`%]"
endif

#				Directories, Files, Flags and Utilities
SRC_DIR		=	./sources
HDR_DIR		=	./headers
BUILD_DIR	=	./build

SOURCES		=	$(shell find $(SRC_DIR) -name '*.$(SOURCE_EXT)')
OBJECTS		=	$(SOURCES:$(SRC_DIR)/%.$(SOURCE_EXT)=$(BUILD_DIR)/%.o)
DEPS		=	$(OBJECTS:.o=.d)

CFLAGS		+=	$(COMP_STD) $(COMP_FLAGS)
LDFLAGS		+=	
INCLUDES	=	-I $(HDR_DIR)

CLEAN_LST	=	$(NAME) $(BUILD_DIR)

RM			=	rm -rf
MKDIR		=	mkdir -p

# 				 Start Rules

# Default rule to make the program
all: $(NAME)

# Makes the build directory, links the object files to the program
$(NAME): $(OBJECTS)
	@$(ECHO) $@ ready to be run
	@$(MKDIR) $(BUILD_DIR)
	@$(COMPILER) $(OBJECTS) $(LDFLAGS) -o $@

# Uses docker to spin up a valgrind container and makes the files there
v valgrind: all
	@$(ECHO) Cleaning any prior valgrind containers with the name $(VALGRND_NAME)
	@docker stop $(VALGRND_NAME) || true && docker rm $(VALGRND_NAME) || true
	@$(ECHO) Creating valgrind docker named: $(VALGRND_NAME)
	@docker run --name $(VALGRND_NAME) -dit karek/valgrind:latest
	@$(ECHO) Copying $(HDR_DIR) $(SRC_DIR) to $(VALGRND_NAME)
	@docker cp $(SRC_DIR) $(VALGRND_NAME):/valgrind/sources
	@docker cp $(HDR_DIR) $(VALGRND_NAME):/valgrind/headers
	@docker cp Makefile $(VALGRND_NAME):/valgrind/Makefile
	@$(ECHO) Using makefile to create $(NAME)
	@docker exec $(VALGRND_NAME) make
	@$(ECHO) Using valgrind to output results for $(NAME)
	@docker exec $(VALGRND_NAME) valgrind ./$(NAME)

# Include the dependancies into the compiler so all files can be built
-include $(DEPS)

# Builds the object files from the source directory using the header files and
# 	dependacies, ie: source/main.cpp is linked to object file build/main.o
# From that, the $(NAME) rule can determine all the function definitions inside
# 	each object file
$(BUILD_DIR)/%.o : $(SRC_DIR)/%.$(SOURCE_EXT)
	$(ECHO) Link $< to $@
	$(MKDIR) $(@D)
	$(COMPILER) $(CFLAGS) $(INCLUDES) -MP -MMD -c $< -o $@
