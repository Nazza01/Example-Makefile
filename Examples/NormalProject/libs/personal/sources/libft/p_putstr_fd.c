/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   p_putstr_fd.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/08 09:33:32 by nervin            #+#    #+#             */
/*   Updated: 2022/08/09 15:40:33 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "personal.h"

/*
NAME
	p_putstr_fd - Write a string to a file.
PARAMETERS
	1.	The string to output
	2.	The file descriptor on which to write.
DESCRIPTION
	Outputs the string 's' to the given file descriptor fd.
RETURN VALUES
	Does not return anything.
*/
void	p_putstr_fd(char *s, int fd)
{
	if (s)
		write(fd, s, p_strlen(s));
}
