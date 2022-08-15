# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/10 17:59:25 by Nathanael         #+#    #+#              #
#    Updated: 2022/08/15 22:34:18 by Nathanael        ###   ########.fr        #
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

IMPORTED_INC=	$(INC_DIR)/imported

FIND_SUBDIR	:=	$(shell find $(LIB_DIR) -type d -depth 1)
FIND_LIBS	:=	$(shell find $(LIB_DIR) -type f -depth 2 -name 'lib*.a')
LIB_INCS	:=	$(shell find $(LIB_DIR) -name '*.$(INC_EXT)')

LIBS_NAME	:=	$(basename $(notdir $(FIND_LIBS)))
LIBS_BASE	:=	$(subst lib,,$(LIBS_NAME))

LIBS_PREPEND:=	$(patsubst %, $(FIND_SUBDIR)/%.a, $(FIND_LIBS))

LDFLAGS		=	$(addprefix -L, $(FIND_SUBDIR))
LLFLAGS		=	$(addprefix -l,$(LIBS_BASE))

CXXFLAGS	+=	-MMD -MP
MAKEFLAGS	+=	--no-print-directory

PRINT_SRCS	=	$(subst $(SRC_DIR)/,,$(SRCS))
PRINT_OBJS	=	$(subst $(BLD_DIR)/,,$(OBJS))

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
.PHONY: all makelibs clean fclean re
.SILENT:

all: makelibs $(NAME)
	$(call printout,$(COL_FINAL_MESSAGE),$(RUN_MSG),$(COL_FINAL_VAR),$(NAME))

makelibs:
	$(MKDIR) $(IMPORTED_INC)
	$(CP) $(LIB_INCS) $(IMPORTED_INC)
	for dir in $(FIND_SUBDIR); do \
		$(MAKE) -C "$${dir}" all SILENT_SUBMAKE=$(SILENT_SUBMAKE); \
		printf "%s %18s $(COLOR_RESET)%s %8s$(COLOR_RESET)\n" $(COL_LIBS_MESSAGE) $(LIBS_MSG) $(COL_LIBS_VAR) $$dir; \
	done

$(NAME): $(OBJS)
	$(MKDIR) $(BLD_DIR)
	$(CXX) $(CXXFLAGS) $(OBJS) $(LDFLAGS) $(LLFLAGS) -o $@
	$(call printout,$(COL_BUILD_MESSAGE),$(BUILD_MSG),$(COL_BUILD_VAR),$@)

clean:
	$(RM) $(NAME)
	$(call printout,$(COL_CLEAN_MESSAGE),$(CLEAN_MSG),$(COL_CLEAN_VAR),$(NAME))

fclean:
	$(RM) $(BLD_DIR)
	$(RM) $(IMPORTED_INC)
	$(call printout,$(COL_CLEAN_MESSAGE),$(FCLEAN_MSG),$(COL_CLEAN_VAR),$(BLD_DIR))
	$(call printout,$(COL_CLEAN_MESSAGE),$(FCLEAN_MSG),$(COL_CLEAN_VAR),$(IMPORTED_INC))

re: all
	$(RM) $(NAME)
	$(RM) $(BLD_DIR)
	$(call printout,$(COL_CLEAN_MESSAGE),$(REMAKE_MSG),$(COL_CLEAN_VAR),$(NAME))
	$(call printout,$(COL_CLEAN_MESSAGE),$(REMAKE_MSG),$(COL_CLEAN_VAR),$(BLD_DIR))

-include $(DEPS)

$(BLD_DIR)/%.o : $(SRC_DIR)/%.$(SRC_EXT)
	$(MKDIR) $(@D)
	$(CXX) $(CXXFLAGS) $(INC_DIR:%=-I %) -MMD -MP -c $< -o $@
	$(call prlink,$(COL_LINK_MESSAGE),$(LINK_MSG),$(COL_LINK_VAR1),$(PRINT_SRCS),$(COL_LINK_VAR2),$(PRINT_OBJS))
