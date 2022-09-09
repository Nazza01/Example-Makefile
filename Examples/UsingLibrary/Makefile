# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/10 17:59:25 by Nathanael         #+#    #+#              #
#    Updated: 2022/09/09 23:43:00 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

include conf/colors.mk
include conf/settings.mk
include conf/functs.mk

UNAME_S := $(shell uname -s)

################################################################################
#						Files/Folders & Libraries							   #
################################################################################

SRCS		=	$(shell find $(SRC_DIR) -name '*.$(SRC_EXT)')
OBJS		=	$(SRCS:$(SRC_DIR)/%.$(SRC_EXT)=$(BLD_DIR)/%.o)
DEPS		=	$(OBJS:.o=.d)

IMPORTED_INC=	$(INC_DIR)/imported

ifeq ($(UNAME_S),Linux)
FIND_SUBDIR	:=	$(shell find $(LIB_DIR) -mindepth 1 -maxdepth 1 -type d)
FIND_LIBS	:=	$(shell find $(LIB_DIR) -mindepth 1 -maxdepth 2 -name 'lib*.a' -type f)
LIB_INCS	:=	$(shell find $(LIB_DIR) -name '*.$(INC_EXT)')
endif
ifeq ($(UNAME_S),Darwin)
FIND_SUBDIR	:=	$(shell find $(LIB_DIR) -type d -depth 1)
FIND_LIBS	:=	$(shell find $(LIB_DIR) -type f -depth 2 -name 'lib*.a')
LIB_INCS	:=	$(shell find $(LIB_DIR) -name '*.$(INC_EXT)')
endif

LIBS_NAME	:=	$(basename $(notdir $(FIND_LIBS)))
LIBS_BASE	:=	$(subst lib,,$(LIBS_NAME))

LDFLAGS		=	$(addprefix -L, $(FIND_SUBDIR))
LLFLAGS		=	$(addprefix -l,$(LIBS_BASE))

CFLAGS		+=	-MMD -MP -I $(INC_DIR) -I $(IMPORTED_INC)
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

$(OBJS): $(BLD_DIR)/%.o : $(SRC_DIR)/%.$(SRC_EXT)
	$(MKDIR) $(@D)
	$(CC) $(CFLAGS) -c $< -o $@
	$(call prlink,$(COL_LINK_MESSAGE),$(LINK_MSG),$(COL_LINK_VAR1),$<,$(COL_LINK_VAR2),$@)

$(NAME): $(OBJS)
	$(MKDIR) $(BLD_DIR)
	$(CC) $(OBJS) $(LDFLAGS) $(LLFLAGS) -o $@
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
