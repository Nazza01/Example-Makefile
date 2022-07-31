# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/01 20:23:35 by Nathanael         #+#    #+#              #
#    Updated: 2022/07/31 01:04:54 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################################################
#							Edit this section								   #
NAME		=	ex00
COMPILER	=	c++
SOURCE_EXT	=	cpp
COMP_STD	=	-std=c++98
COMP_FLAGS	=	-Wall -Wextra -Werror -g
# 																			   #
################################################################################


################################################################################
#								Progress Bar								   #
################################################################################
ifndef ECHO
T := $(shell $(MAKE) $(MAKECMDGOALS) --no-print-directory \
	-nrRf $(firstword $(MAKEFILE_LIST)) \
	ECHO="COUNTTHIS" | grep -c "COUNTTHIS")

N := x
C = $(words $N)$(eval N := x $N)
ECHO = echo "`expr " [\`expr $C '*' 100 / $T\`" : '.*\(....\)$$'`%]"
endif

################################################################################
#								Colours										   #
################################################################################
CB_BLK		=	$(shell tput setab 0)
CB_RED		=	$(shell tput setab 1)
CB_GRN		=	$(shell tput setab 2)
CB_YEL		=	$(shell tput setab 3)
CB_BLU		=	$(shell tput setab 4)
CB_MAG		=	$(shell tput setab 5)
CB_CYN		=	$(shell tput setab 6)
CB_WHT		=	$(shell tput setab 7)

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
C_BLD_MS	=	$(CB_BLU)$(CT_BLK)
C_BLD_VA	=	$(CT_MAG)
C_FIN_MS	=	$(CB_GRN)$(CT_BLK)
C_FIN_VA	=	$(CT_BLU)

################################################################################
#								Directories/Files							   #
################################################################################
SRC_DIR		=	./sources
HDR_DIR		=	./includes
BUILD_DIR	=	./build

SOURCES		=	$(shell find $(SRC_DIR) -name '*.$(SOURCE_EXT)')
OBJECTS		=	$(SOURCES:$(SRC_DIR)/%.$(SOURCE_EXT)=$(BUILD_DIR)/%.o)
DEPS		=	$(OBJECTS:.o=.d)

################################################################################
#								Flags/Utilities								   #
################################################################################
CFLAGS		+=	-$(COMP_STD) $(COMP_FLAGS)
LDFLAGS		+=	
INCLUDES	=	-I $(HDR_DIR)

CLEAN_LST	=	$(NAME)
FCLN_LST	=	$(BUILD_DIR)

RM			=	rm -rf
MKDIR		=	mkdir -p

################################################################################
#								Make Rules									   #
################################################################################
.DELETE_ON_ERROR:
.SILENT:

all: $(NAME)
	$(ECHO) "${C_FIN_MS}  Ready to Run  ${CAL_RST}	${C_FIN_VA}$(NAME)${CAL_RST}"

$(NAME): $(OBJECTS)
	$(ECHO) "${C_BLD_MS}    Building    ${CAL_RST}	${C_BLD_VA}$@${CAL_RST}"
	$(MKDIR) $(BUILD_DIR)
	$(COMPILER) $(OBJECTS) $(LDFLAGS) -o $@

c clean:
	$(ECHO) "${C_CLN_MS}    Cleaning    ${CAL_RST}	${C_CLN_VA}$(CLEAN_LST)${CAL_RST}"
	$(ECHO) "${C_CLN_MS}    Cleaning    ${CAL_RST}	${C_CLN_VA}$(FCLN_LST)${CAL_RST}"
	$(RM) $(CLEAN_LST) $(FCLN_LST)

cc:
	clear
	$(ECHO) "${C_CLN_MS} Screen Cleared ${CAL_RST}"
	$(MAKE) c

r: c all

m: all
	leaks -atExit -- ./$(NAME) > leak_out.txt || true
	grep -E '(Process) [0-9]{1,}: [0-9]{1,} (leak)' leak_out.txt
	grep -E '(ROOT LEAK): <' leak_out.txt || true
	rm leak_out.txt

-include $(DEPS)

$(BUILD_DIR)/%.o : $(SRC_DIR)/%.$(SOURCE_EXT)
	$(ECHO) "${C_LNK_MS}    Linking     ${CAL_RST}	${C_LNK_V1}$< ${CAL_RST}${CT_WHT}to ${CAL_RST}${C_LNK_V2}$@ ${CAL_RST}"
	$(MKDIR) $(@D)
	$(COMPILER) $(CFLAGS) $(INCLUDES) -MMD -MP -c $< -o $@
