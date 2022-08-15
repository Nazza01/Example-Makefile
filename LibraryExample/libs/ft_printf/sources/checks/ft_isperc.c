/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isperc.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/12 13:59:05 by nervin            #+#    #+#             */
/*   Updated: 2022/08/09 16:14:00 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

/*
ft_isperc
	Outputs a percent symbol to the standard output
	Increments the argument counter
*/
void	ft_isperc(t_print *argcount)
{
	pt_putchar_fd('%', 1);
	argcount->total++;
}
