# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/01 20:23:35 by Nathanael         #+#    #+#              #
#    Updated: 2022/09/17 21:30:17 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libper.a
CC			=	gcc
CFLAGS		=	-Wall -Wextra -Werror -std=c99

################################################################################
#								Directories/Files							   #
################################################################################
SRCDIR		=	sources
INCDIR		=	includes
BLDDIR		=	build

SRCS		=	$(shell find $(SRCDIR) -name '*.c')
OBJS		=	$(SRCS:$(SRCDIR)/%.c=$(BLDDIR)/%.o)
DEPS		=	$(OBJS:.o=.d)

################################################################################
#								Utilities									   #
################################################################################
CFLAGS		+=	-MMD -MP -I $(INCDIR)
LDFLAGS		=	
LLFLAGS		=

AR			+=	-rcs
RM			+=	-r
RANLIB		=	ranlib
MKDIR		=	mkdir -p
################################################################################
#								Make Rules									   #
################################################################################
.DELETE_ON_ERROR:

ifeq ($(SILENT_SUBMAKE),1)
.SILENT:
endif

all: $(NAME)

$(NAME): $(OBJS)
	$(MKDIR) $(BLDDIR)
	$(AR) $@ $^
	$(RANLIB) $@

clean:
	$(RM) $(NAME) $(OBJS)

re: clean all

-include $(DEPS)

$(OBJS): $(BLDDIR)/%.o : $(SRCDIR)/%.c
	$(MKDIR) $(@D)
	$(CC) $(CFLAGS) -c $< -o $@
