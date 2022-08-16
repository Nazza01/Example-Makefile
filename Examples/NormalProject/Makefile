# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/10 17:59:25 by Nathanael         #+#    #+#              #
#    Updated: 2022/08/16 22:04:40 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

include conf/colors.mk
include conf/settings.mk
include conf/functs.mk

################################################################################
#						Files/Folders & Libraries							   #
################################################################################

SRCS		=	$(shell find $(SRC_DIR) -name '*.$(SRC_EXT)')
OBJS		=	$(SRCS:$(SRC_DIR)/%.$(SRC_EXT)=$(BLD_DIR)/%.o)
DEPS		=	$(OBJS:.o=.d)

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

all: $(NAME)
	$(call printout,$(COL_FINAL_MESSAGE),$(RUN_MSG),$(COL_FINAL_VAR),$(NAME))

$(NAME): $(OBJS)
	$(MKDIR) $(BLD_DIR)
	$(CXX) $(CXXFLAGS) $(OBJS) $(LDFLAGS) $(LLFLAGS) -o $@
	$(call printout,$(COL_BUILD_MESSAGE),$(BUILD_MSG),$(COL_BUILD_VAR),$@)

clean:
	$(RM) $(NAME)
	$(call printout,$(COL_CLEAN_MESSAGE),$(CLEAN_MSG),$(COL_CLEAN_VAR),$(NAME))

fclean:
	$(RM) $(BLD_DIR)
	$(call printout,$(COL_CLEAN_MESSAGE),$(FCLEAN_MSG),$(COL_CLEAN_VAR),$(BLD_DIR))

re: clean fclean all

-include $(DEPS)

$(BLD_DIR)/%.o : $(SRC_DIR)/%.$(SRC_EXT)
	$(MKDIR) $(@D)
	$(CXX) $(CXXFLAGS) $(INC_DIR:%=-I %) -c $< -o $@
	$(call prlink,$(COL_LINK_MESSAGE),$(LINK_MSG),$(COL_LINK_VAR1),$<,$(COL_LINK_VAR2),$@)
