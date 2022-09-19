# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    settings.mk                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/10 16:57:59 by Nathanael         #+#    #+#              #
#    Updated: 2022/09/17 21:32:23 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

-include colors.mk

NAME 				=	testingLibrary

SILENT_SUBMAKE		=	0	# Set to 0 to output the progress of each subdirectory when making libraries
SRC_EXT				=	c
INC_EXT				=	h

SRC_DIR				=	sources
INC_DIR				=	includes
BLD_DIR				=	build
LIB_DIR				=	libs

CC					=	gcc
CSTD				=	c99
CFLAGS				=	-Wall -Wextra -Werror -std=$(CSTD)

RUN_MSG				=	"READY"
BUILD_MSG			=	"BUILDING"
CLEAN_MSG			=	"CLEANING"
FCLEAN_MSG			=	"FILE CLEANING"
LINK_MSG			=	"LINKING"
REMAKE_MSG			=	"REMAKING"
LIBS_MSG			=	"LIBRARY BUILT"

COL_CLEAN_MESSAGE	=	$(BACK_WHITE)$(TEXT_BLACK)
COL_CLEAN_VAR		=	$(TEXT_YELLOW)
COL_LINK_MESSAGE	=	$(BACK_YELLOW)$(TEXT_BLACK)
COL_LINK_VAR1		=	$(TEXT_RED)
COL_LINK_VAR2		=	$(TEXT_CYAN)
COL_BUILD_MESSAGE	=	$(BACK_BLUE)$(TEXT_WHITE)
COL_BUILD_VAR		=	$(TEXT_MAGENTA)
COL_FINAL_MESSAGE	=	$(BACK_GREEN)$(TEXT_BLACK)
COL_FINAL_VAR		=	$(TEXT_GREEN)
COL_LIBS_MESSAGE	=	$(BACK_MAGENTA)
COL_LIBS_VAR		=	$(TEXT_YELLOW)
