/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlen.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/21 03:01:53 by Nathanael         #+#    #+#             */
/*   Updated: 2022/08/09 15:37:00 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "personal.h"

/*
NAME
	p_strlen
PARAMETERS
	str		The string of which to calculate the length of.
DESCRIPTION
	Iterates through while counting the string str until it its the null
	terminating character.
RETURN VALUES
	The length of the string str.
*/
size_t	p_strlen(const char *str)
{
	int	i;

	i = 0;
	while (str[i])
		i++;
	return (i);
}
