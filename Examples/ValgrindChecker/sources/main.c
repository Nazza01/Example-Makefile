/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/10 18:02:22 by Nathanael         #+#    #+#             */
/*   Updated: 2022/08/16 22:49:55 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

int	main(void)
{
	char	*mem;

	mem = malloc(1);
	if (mem == NULL)
		return (1);
	// free(mem);		//				Uncomment to free memory
	return (0);
}
