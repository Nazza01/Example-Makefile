/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_pos_len.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/03 22:06:42 by Nathanael         #+#    #+#             */
/*   Updated: 2022/08/09 12:13:19 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "personal.h"

/*
Calculates the length of a positive number and returns the total length.
*/
int	ft_get_pos_len(int number)
{
	int	length;

	length = 1;
	while (number > 9)
	{
		length++;
		number /= 10;
	}
	return (length);
}