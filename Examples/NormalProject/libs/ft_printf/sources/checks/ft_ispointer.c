/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_ispointer.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/12 13:59:07 by nervin            #+#    #+#             */
/*   Updated: 2022/08/09 16:18:38 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

/*
ft_ispointer
	Takes in the argcount to check the pointer and increment the counter.
	Pointers are represented by 0x then followed by any combination of numbers
		and lowercase letters: 0x124wb23d5
	Does similar work to ft_ishex but adds the current hex representation to 0
		to get a number less than 0. Otherwise adds the character starting from a
	Iterate through the number until the end and output the full string once done
	Free the string.
*/
void	ft_ispointer(t_print *argcount)
{
	unsigned long	num;
	int				len;
	char			*str;

	num = va_arg(argcount->args, unsigned long);
	len = 1;
	str = pf_numlen(num, &len);
	pt_putstr_fd("0x", 1);
	argcount->total += 2;
	len--;
	while (len >= 0)
	{
		if (num % 16 < 10)
			str[len] = '0' + (num % 16);
		else
			str[len] = 'a' + (num % 16) - 10;
		num = num / 16;
		len--;
		argcount->total++;
	}
	pt_putstr_fd(str, 1);
	free(str);
}
