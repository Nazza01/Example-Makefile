/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/10 18:02:22 by Nathanael         #+#    #+#             */
/*   Updated: 2022/08/24 11:33:57 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

static void	usegnl(void)
{
	int		filedes;
	char	*getline;
	int		index;

	index = 0;
	filedes = open("testfile.txt", O_RDONLY);
	if (filedes < 0)
		return ;
	getline = get_next_line(filedes);

	ft_printf("\n");
	ft_printf("======\t\tStart Of File\t\t======\n");
	ft_printf("\n");

	while (ft_strcmp(getline, "(null)") != 0)
	{
		index++;
		ft_printf("%i\t%s", index, getline);
		getline = get_next_line(filedes);
	}
	ft_printf("\n");
	ft_printf("======\t\tEnd Of File\t\t======\n");
	ft_printf("\n");
	free(getline);
	close(filedes);
}

static void	uselibft(void)
{
	ft_putstr_fd("\n", 1);
	ft_putstr_fd("Testing libft\n", 1);
	ft_putstr_fd("\n", 1);
	ft_putstr_fd("ft_putchar_fd: ", 1);
	ft_putchar_fd('a', 1);
	ft_putchar_fd('\n', 1);
}

static void	useprintf(void)
{
	void	*ptr;
	char	*str;

	ft_putstr_fd("\n", 1);
	ft_putstr_fd("Testing printf\n", 1);
	ft_putstr_fd("\n", 1);
	str = "Hello";
	ptr = &str;
	ft_printf("%c\n", 'a');
	ft_printf("%s\n", "Hello");
	ft_printf("%p\n", ptr);
	ft_printf("%i\n", 12);
	ft_printf("%d\n", 12.00);
	ft_printf("%u\n", 24);
	ft_printf("%x\n", 0xB);
	ft_printf("%X\n", "\u00A1");
	ft_printf("%%\n");
	ft_printf("\0\n");
}

int	main(void)
{
	usegnl();
	uselibft();
	useprintf();
	return (0);
}
