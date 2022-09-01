/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isnull.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/04 17:02:36 by Nathanael         #+#    #+#             */
/*   Updated: 2022/08/09 12:13:12 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "personal.h"

/**
 * @brief Checks if data is null or not. 
 * @param data A value to check for NULL
 * @return EXIT_FAILURE if the data is NULL.
 * EXIT_SUCCESS if the data is not NULL. 
 * EXIT_ERROR if either of these conditions are not met.
**/
int	ft_isnull(void *data)
{
	if (data == NULL)
		return (EXIT_FAILURE);
	else if (data != NULL)
		return (EXIT_SUCCESS);
	else
		return (EXIT_ERROR);
}
