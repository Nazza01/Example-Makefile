/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putchar_fd.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/08 09:33:04 by nervin            #+#    #+#             */
/*   Updated: 2022/08/16 21:54:37 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

#include <unistd.h>

/*
NAME
	ft_putstr_fd - Write a character to a file.
PARAMETERS
	1.	The character to output
	2.	The file descriptor on which to write.
DESCRIPTION
	Outputs the character 'c' to the given file descriptor fd.
RETURN VALUES
	Does not return anything.
*/
void	ft_putchar_fd(char c, int fd)
{
	write(fd, &c, 1);
}
