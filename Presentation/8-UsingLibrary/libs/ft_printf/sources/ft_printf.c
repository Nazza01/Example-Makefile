/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/10/23 11:44:56 by nervin            #+#    #+#             */
/*   Updated: 2022/08/09 16:14:00 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

/*
ft_init
	Assigns enough memory for the amount of arguments that are being passed
	through and if memory can not be assigned returns null. Sets the initial
	count to 0 and returns argcount for use in ft_printf.
*/
static t_print	*ft_init(void)
{
	t_print	*argcount;

	argcount = malloc(sizeof(t_print));
	if (argcount == NULL)
		return (NULL);
	argcount->total = 0;
	return (argcount);
}

/*
ft_printf
	Uses various functions to actually output and check each flag according to
	printf, increments the total argument counter and returns the integer amount
	of the characters.
*/
int	ft_printf(const char *format, ...)
{
	t_print		*argcount;
	int			result;
	int			i;

	i = 0;
	result = 0;
	argcount = ft_init();
	va_start(argcount->args, format);
	while (format[i] != '\0')
	{
		if (format[i] == '%')
			ft_check(format[++i], argcount);
		else
		{
			pt_putchar_fd(format[i], 1);
			argcount->total++;
		}
		i++;
	}
	result = argcount->total;
	va_end(argcount->args);
	free(argcount);
	return (result);
}
