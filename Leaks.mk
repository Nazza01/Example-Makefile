# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/01 20:23:35 by Nathanael         #+#    #+#              #
#    Updated: 2022/07/10 16:22:02 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#							Edit this section								   #
NAME		=	SetFire
COMPILER	=	c++
SOURCE_EXT	=	cpp
COMP_STD	=	-std=c++98
COMP_FLAGS	=	-Wall -Wextra -Werror -g
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

CFLAGS		+=	-$(COMP_STD) $(COMP_FLAGS)
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

# Removes files and folders listed in clean_list
c clean:
	@$(ECHO) Cleaning: $(CLEAN_LST)
	@$(RM) $(CLEAN_LST)

# Removes files and folders listed in clean_list and clears the command window
cc:
	@clear
	@$(ECHO) Cleaning: $(CLEAN_LST)
	@$(RM) $(CLEAN_LST)

# Cleans all files and remakes them
r re: c all

# Uses apple's leaks utility (/usr/bin) to check for leaks upon exit
m mem: all
	@leaks --atExit -- ./$(NAME) > leak_out.txt || true
	@grep -E '(Process) [0-9]{1,}: [0-9]{1,} (leaks)' leak_out.txt
	@grep -E '(ROOT LEAK): <' leak_out.txt || true
	@rm leak_out.txt

# Include the dependancies into the compiler so all files can be built
-include $(DEPS)

# Builds the object files from the source directory using the header files and
# 	dependacies, ie: source/main.cpp is linked to object file build/main.o
# From that, the $(NAME) rule can determine all the function definitions inside
# 	each object file
$(BUILD_DIR)/%.o : $(SRC_DIR)/%.$(SOURCE_EXT)
	@$(ECHO) Link $< to $@
	@$(MKDIR) $(@D)
	@$(COMPILER) $(CFLAGS) $(INCLUDES) -MP -MMD -c $< -o $@
