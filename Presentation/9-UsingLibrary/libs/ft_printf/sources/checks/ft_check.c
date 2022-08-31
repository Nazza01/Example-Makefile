/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_check.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/11 14:44:06 by nervin            #+#    #+#             */
/*   Updated: 2022/08/09 11:35:31 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

/*
ft_check
	Checks the character c and passes it to the relevant function
	If the character is the null terminating character write it the standard output
|-----------------------|-------------------|
|	Conversion			|	Function		|
|-----------------------|-------------------|
|	c (character)		|	ft_ischaracter	|
|	s (string)			|	ft_isstring		|
|	p (pointer)			|	ft_ispointer	|
|	i (integer base 10)	|	ft_isint		|
|	d (decimal base 10)	|	ft_isint		|
|	u (unsigned int)	|	ft_isunsigned	|
|	x (hex base16 lower)|	ft_ishex		|
|	X (hex base16 upper)|	ft_ishex		|
|	% (percent sign)	|	ft_isperc		|
|-----------------------|-------------------|
*/
void	ft_check(const char c, t_print *argcount)
{
	if (c == 'c')
		ft_ischaracter(argcount);
	else if (c == 's')
		ft_isstring(argcount);
	else if (c == 'p')
		ft_ispointer(argcount);
	else if (c == 'i' || c == 'd')
		ft_isint(argcount);
	else if (c == 'u')
		ft_isunsigned(argcount);
	else if (c == 'x' || c == 'X')
		ft_ishex(argcount, c);
	else if (c == '%')
		ft_isperc(argcount);
	else if (c == '\0')
	{
		write(1, &c, 1);
		argcount->total++;
	}
}
