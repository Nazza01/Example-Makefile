/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_ischaracter.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/12 13:58:56 by nervin            #+#    #+#             */
/*   Updated: 2022/08/09 16:14:00 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

/*
ft_ischaracter
	Outputs the current character on standard output and increments the counter
*/
void	ft_ischaracter(t_print *argcount)
{
	pt_putchar_fd(va_arg(argcount->args, int), 1);
	argcount->total++;
}
