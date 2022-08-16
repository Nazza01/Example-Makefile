/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isint.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/12 13:59:03 by nervin            #+#    #+#             */
/*   Updated: 2022/08/09 15:44:20 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

/*
ft_isint
	Handles the case when the the current character is an integer and outputs it
	to standard output. Increments the argument counter and free's the string as
	we're done with it.
*/
void	ft_isint(t_print *argcount)
{
	char	*str;

	str = pt_itoa(va_arg(argcount->args, int));
	pt_putstr_fd(str, 1);
	argcount->total += pt_strlen(str);
	free(str);
}
