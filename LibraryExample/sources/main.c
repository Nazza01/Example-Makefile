/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/10 18:02:22 by Nathanael         #+#    #+#             */
/*   Updated: 2022/08/15 22:45:27 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

int	main(void)
{
	int		fd;
	char	*line;

	ft_putstr_fd("ft_putchar_fd\n", 1);
	ft_putchar_fd('a', 1);
	ft_putchar_fd('\n', 1);
	fd = open("Makefile", O_RDONLY);
	line = get_next_line(fd);
	ft_printf("First Line: %s\n", line);
	free(line);
	
	ft_printf("Hello from ft_printf\n");
	
	ft_printf("The absolute value of -100 is: %i\n", ft_abs(-100));
	return (0);
}
