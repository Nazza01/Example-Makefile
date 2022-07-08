# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/01 20:23:35 by Nathanael         #+#    #+#              #
#    Updated: 2022/07/08 15:02:53 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#							Edit this section								   #
PROGRAM		:=	AniMorph
COMPILER	?=	c++
SOURCE_EXT	=	cpp
COMP_STD	=	-std=c++98
COMP_FLAGS	=	-g
VALGRND_NAME=	vlgdex01
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
DEPS_DIR	=	./deps

SOURCES		=	$(shell find $(SRC_DIR) -name '*.$(SOURCE_EXT)')
OBJECTS		=	$(SOURCES:$(SRC_DIR)/%.$(SOURCE_EXT)=$(BUILD_DIR)/%.o)
DEPS		=	$(OBJECTS:.o=.d)

CFLAGS		+=	$(COMP_STD) $(COMP_FLAGS)
LDFLAGS		+=	

RM			=	rm -rf
MKDIR		=	mkdir -p

CLEAN_LST	=	$(PROGRAM) $(BUILD_DIR)

INCLUDES	=	-I $(HDR_DIR)

# 				Start of Rules

.DELETE_ON_ERROR: all c clean cc val valgrind a attach vc valcl valclean
.PHONY: all c clean

# Default make command when [make] is run without any rule
all: $(PROGRAM)

# Creates the program based on the objects given
$(PROGRAM): $(OBJECTS)
	@$(ECHO) $@ ready to be run
	@$(MKDIR) $(BUILD_DIR) 
	@$(COMPILER) $(OBJECTS) $(LDFLAGS) -o $@

# Cleans the files listed in clean list
c clean:
	@clear
	@$(ECHO) Cleaning: $(CLEAN_LST)
	@$(RM) $(CLEAN_LST)

# Cleans the files listed and cleans any lingering valgrind docker containers
cc:
	@clear
	@$(ECHO) Cleaning: $(CLEAN_LST)
	@$(RM) $(CLEAN_LST)
	@$(ECHO) Cleaning any prior valgrind containers with the name $(VALGRND_NAME)
	@docker stop $(VALGRND_NAME) || true && docker rm $(VALGRND_NAME) || true
	
# Uses docker to make the desired named container
# 	Stops any previous containers if they exist, removing any traces of them
# 	Intialises the docker run command using the valgrind container
# 	Copies any files located from sources dir defined at the top of this file
# 	Copies any files located from headers dir defined at the top of this file
# 	Copies this Makefile into the valgrind container 
val valgrind:
	@$(ECHO) Cleaning any prior valgrind containers with the name $(VALGRND_NAME)
	@docker stop $(VALGRND_NAME) || true && docker rm $(VALGRND_NAME) || true
	@$(ECHO) Creating valgrind docker named: $(VALGRND_NAME)
	@docker run --name $(VALGRND_NAME) -dit karek/valgrind:latest
	@$(ECHO) Copying $(HDR_DIR) $(SRC_DIR) to $(VALGRND_NAME)
	@docker cp $(SRC_DIR) $(VALGRND_NAME):/valgrind/sources
	@docker cp $(HDR_DIR) $(VALGRND_NAME):/valgrind/headers
	@docker cp Makefile $(VALGRND_NAME):/valgrind/Makefile

# Attaches to the docker instance according to the set name
a attach:
	@$(ECHO) Attaching to valgrind container
	@docker attach $(VALGRND_NAME)

# Stops and Removes any currently running instances of the valgrind docker container
vc valcl valclean:
	@$(ECHO) Cleaning any prior valgrind containers with the name $(VALGRND_NAME)
	@docker stop $(VALGRND_NAME) || true && docker rm $(VALGRND_NAME) || true

# 				Include any dependancies if needed
-include $(DEPS)

# 				Link each source file into the relevant file
$(BUILD_DIR)/%.o : $(SRC_DIR)/%.$(SOURCE_EXT)
	@$(ECHO) Link $< to $@
	@$(MKDIR) $(@D)
	@$(COMPILER) $(CFLAGS) $(INCLUDES) -MP -MMD -c $< -o $@
