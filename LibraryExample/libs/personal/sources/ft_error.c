/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_error.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/27 14:01:38 by Nathanael         #+#    #+#             */
/*   Updated: 2022/08/09 15:40:27 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "personal.h"

/*
Prints an error using ft_printf then uses exit to return/exit the program
Message format: <message>\n
*/
void	ft_error(char *message, int F_TYPE)
{
	p_putstr_fd(message, 1);
	p_putstr_fd("\n", 1);
	exit (F_TYPE);
}
