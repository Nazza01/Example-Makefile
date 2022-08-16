/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_ishex.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/12 13:58:58 by nervin            #+#    #+#             */
/*   Updated: 2022/08/09 16:18:38 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

/*
ft_ishex
	Takes in the argcount struct and the character c
	Handles the unsigned integer representation using Ascii Hex (16)
	Appends 0 until the next decimal and represents it using uppercase or 
	lowercase Hex.
*/
void	ft_ishex(t_print *argcount, char c)
{
	unsigned int	num;
	int				len;
	char			*str;

	num = va_arg(argcount->args, unsigned int);
	len = 1;
	str = pf_numlen(num, &len);
	len--;
	while (len >= 0)
	{
		if (num % 16 < 10)
			str[len] = '0' + (num % 16);
		else if (c == 'x')
			str[len] = 'a' - 10 + (num % 16);
		else if (c == 'X')
			str[len] = 'A' - 10 + (num % 16);
		num = num / 16;
		len--;
		argcount->total++;
	}
	pt_putstr_fd(str, 1);
	free(str);
}
