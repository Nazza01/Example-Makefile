# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/10 17:59:25 by Nathanael         #+#    #+#              #
#    Updated: 2022/09/09 23:48:29 by Nathanael        ###   ########.fr        #
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

CFLAGS		+=	-MMD -MP
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

$(OBJS): $(BLD_DIR)/%.o : $(SRC_DIR)/%.$(SRC_EXT)
	$(MKDIR) $(@D)
	$(CC) $(CFLAGS) $(INC_DIR:%=-I %) -c $< -o $@
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
	$(call printout,$(COL_CLEAN_MESSAGE),$(FCLEAN_MSG),$(COL_CLEAN_VAR),$(BLD_DIR))

cleanall: clean fclean

re: clean fclean all

-include $(DEPS)

memcheck: all
	leaks -atExit -- ./$(NAME) | grep -E '(leak)'

valgrind:
	$(call printout,$(COL_DOCKER_MESSAGE),$(DOCKER_MSG),$(COL_DOCKER_VAR),"Pulling docker container")
	docker run --name $(NAME) -dit livingsavage/42valgrind:v4
	$(call printout,$(COL_DOCKER_MESSAGE),$(DOCKER_MSG),$(COL_DOCKER_VAR),"Copying files to container")
	docker cp $(CON_DIR) $(NAME):/code/conf
	docker cp $(INC_DIR) $(NAME):/code/includes
	docker cp $(SRC_DIR) $(NAME):/code/sources
	docker cp Makefile $(NAME):/code/Makefile
	$(call printout,$(COL_DOCKER_MESSAGE),$(DOCKER_MSG),$(COL_DOCKER_VAR),"Executing make inside container")
	docker exec $(NAME) make
	$(call printout,$(COL_DOCKER_MESSAGE),$(DOCKER_MSG),$(COL_DOCKER_VAR),"Executing valgrind inside container")
	docker exec $(NAME) valgrind -- ./$(NAME)
	$(call printout,$(COL_DOCKER_MESSAGE),$(DOCKER_MSG),$(COL_DOCKER_VAR),"Stopping and removing container")
	docker stop $(NAME) || true && docker rm $(NAME) || true
