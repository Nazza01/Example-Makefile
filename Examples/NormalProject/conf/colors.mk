# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    colors.mk                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/10 21:59:41 by Nathanael         #+#    #+#              #
#    Updated: 2022/08/14 19:16:15 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BACK_BLACK	=	$(shell tput setab 0)
BACK_RED	=	$(shell tput setab 1)
BACK_GREEN	=	$(shell tput setab 2)
BACK_YELLOW	=	$(shell tput setab 3)
BACK_BLUE	=	$(shell tput setab 4)
BACK_MAGENTA=	$(shell tput setab 5)
BACK_CYAN	=	$(shell tput setab 6)
BACK_WHITE	=	$(shell tput setab 7)

TEXT_BLACK	=	$(shell tput setaf 0)
TEXT_RED	=	$(shell tput setaf 1)
TEXT_GREEN	=	$(shell tput setaf 2)
TEXT_YELLOW	=	$(shell tput setaf 3)
TEXT_BLUE	=	$(shell tput setaf 4)
TEXT_MAGENTA=	$(shell tput setaf 5)
TEXT_CYAN	=	$(shell tput setaf 6)
TEXT_WHITE	=	$(shell tput setaf 7)

TEXT_BOLD	=	$(shell tput bold)
COLOR_RESET	=	$(shell tput sgr0)
