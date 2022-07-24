# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    CPPModules.mk                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/01 20:23:35 by Nathanael         #+#    #+#              #
#    Updated: 2022/07/24 11:14:59 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#							Edit this section								   #
NAME		=	ex00
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

#				Colours
CB_BLK		=	$(shell tput setab 0)
CB_RED		=	$(shell tput setab 1)
CB_GRN		=	$(shell tput setab 2)
CB_YEL		=	$(shell tput setab 3)
CB_BLU		=	$(shell tput setab 4)
CB_MAG		=	$(shell tput setab 5)
CB_CYN		=	$(shell tput setab 6)
CB_WHT		=	$(shell tput setab 7)

# 	Text Colour
CT_BLK		=	$(shell tput setaf 0)
CT_RED		=	$(shell tput setaf 1)
CT_GRN		=	$(shell tput setaf 2)
CT_YEL		=	$(shell tput setaf 3)
CT_BLU		=	$(shell tput setaf 4)
CT_MAG		=	$(shell tput setaf 5)
CT_CYN		=	$(shell tput setaf 6)
CT_WHT		=	$(shell tput setaf 7)

CAL_RST		=	$(shell tput sgr0)

C_CLN_MS	=	$(CB_WHT)$(CT_BLK)
C_CLN_VA	=	$(CT_YEL)
C_LNK_MS	=	$(CB_YEL)$(CT_BLK)
C_LNK_V1	=	$(CT_RED)
C_LNK_V2	=	$(CT_BLU)
C_FIN_MS	=	$(CB_GRN)$(CT_BLK)
C_FIN_VA	=	$(CT_MAG)

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
	@$(ECHO) "${C_FIN_MS}    Ready       ${CAL_RST}	${C_FIN_VA}$@${CAL_RST}"
	@$(MKDIR) $(BUILD_DIR)
	@$(COMPILER) $(OBJECTS) $(LDFLAGS) -o $@

# Removes files and folders listed in clean_list
c clean:
	@$(ECHO) "${C_CLN_MS}    Cleaning    ${CAL_RST}	${C_CLN_VA}$(CLEAN_LST)${CAL_RST}"
	@$(RM) $(CLEAN_LST)

# Removes files and folders listed in clean_list and clears the command window
cc:
	@clear
	@$(ECHO) "${C_CLN_MS}    Cleaning    ${CAL_RST}	${C_CLN_VA}$(CLEAN_LST)${CAL_RST}"
	@$(RM) $(CLEAN_LST)

# Cleans all files and remakes them
r re: c all

# Uses apple's leaks utility (/usr/bin/leaks) to check for leaks upon exit
m mem: all
	@leaks -atExit -- ./$(NAME) > leak_out.txt || true
	@grep -E '(Process) [0-9]{1,}: [0-9]{1,} (leak)' leak_out.txt
	@grep -E '(ROOT LEAK): <' leak_out.txt || true
	@rm leak_out.txt

# Uses docker to spin up a valgrind container and makes the files there
# @docker run --name $(VALGRND_NAME) -dit karek/valgrind:latest
v valgrind: all
	@$(ECHO) Opening docker 
	@$(ECHO) Cleaning any prior valgrind containers with the name $(VALGRND_NAME)
	@docker stop $(VALGRND_NAME) || true && docker rm $(VALGRND_NAME) || true
	@$(ECHO) Creating valgrind docker named: $(VALGRND_NAME)
	@docker run --name $(VALGRND_NAME) -dit test
	@$(ECHO) Using makefile to create $(NAME)
	@docker exec $(VALGRND_NAME) make
	@$(ECHO) Using valgrind to output results for $(NAME)
	@docker exec $(VALGRND_NAME) valgrind ./$(NAME) > val_out.txt
	@grep -E '(Process) [0-9]{1,}: [0-9]{1,} (leaks)' val_out.txt
	@grep -E '(ROOT LEAK): <' val_out.txt || true

# Include the dependancies into the compiler so all files can be built
-include $(DEPS)

# Builds the object files from the source directory using the header files and
# 	dependacies, ie: source/main.cpp is linked to object file build/main.o
# From that, the $(NAME) rule can determine all the function definitions inside
# 	each object file
$(BUILD_DIR)/%.o : $(SRC_DIR)/%.$(SOURCE_EXT)
	@$(ECHO) "${C_LNK_MS}    Linking     ${CAL_RST}	${C_LNK_V1}$< ${CAL_RST}${CT_WHT}to ${CAL_RST}${C_LNK_V2}$@ ${CAL_RST}"
	@$(MKDIR) $(@D)
	@$(COMPILER) $(CFLAGS) $(INCLUDES) -MMD -MP -c $< -o $@