/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   other_slen.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/19 14:21:25 by Nathanael         #+#    #+#             */
/*   Updated: 2022/08/20 19:35:02 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

int	other_slen(char *str)
{
	return (sizeof(str) - 3);
}