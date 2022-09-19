# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    functs.mk                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/13 11:57:44 by Nathanael         #+#    #+#              #
#    Updated: 2022/08/15 10:25:29 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Prints out like so
#	1			2			3			4
#	1stColor	message		2ndColor	message
# Example Output/Usage
# 
# 	READY test.out
 
define printout
printf "%s %18s $(COLOR_RESET)%s %8s$(COLOR_RESET)\n" $(1) ${2} $(3) $(4);
endef

# Prints out two variables, e.g
#	1			2			3			4			5			6
#	1stColor	message		2ndColor	message	to	3rdColor	message
# Example Output/Usage
# 
# 	[ LINKING ] sources/main.c to build/main.o
 
define prlink
printf "%s %18s $(COLOR_RESET)%s %8s$(COLOR_RESET) to %s%s$(COLOR_RESET)\n" $(1) $(2) $(3) $(4) $(5) $(6)
endef

