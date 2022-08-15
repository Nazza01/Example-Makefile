/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_free.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/15 16:48:10 by Nathanael         #+#    #+#             */
/*   Updated: 2022/08/09 12:13:07 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "personal.h"

/**
 * @brief Takes in an argument to be freed and frees each element while setting
 * it to null
 * @param arg The argument to be freed
 * @return no return value
**/
void	ft_free_arg(char **arg)
{
	if (*arg)
		free(*arg);
	*arg = NULL;
}

/**
 * @brief Takes in a character array and frees each element
 * @param arr The character array to be freed
**/
void	ft_free_arr(char **arr)
{
	int	index;

	index = 0;
	while (arr[index])
	{
		free(arr[index]);
		index++;
	}
	free(arr);
}

/**
 * @brief Frees up to size elements of the given character array 
 * @return The free'd character array
*/
char	**ft_free_n(char **arr, int size)
{
	int	index;

	index = 0;
	while (index < size)
	{
		free(arr[index]);
		index++;
	}
	free(arr);
	return (NULL);
}
