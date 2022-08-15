/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isunsigned.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/12 13:59:12 by nervin            #+#    #+#             */
/*   Updated: 2022/08/09 16:20:23 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

/*
NAME
	ft_strlen
PARAMETERS
	str		The string of which to calculate the length of.
DESCRIPTION
	Iterates through while counting the string str until it its the null
	terminating character.
RETURN VALUES
	The length of the string str.
*/
size_t	pf_strlen(const char *str)
{
	int	i;

	i = 0;
	while (str[i])
		i++;
	return (i);
}

/*
ft_nlen
	Get length of the number by dividing by 10 when we encounter the next digit
*/
static int	ft_nlen(unsigned int num)
{
	int	len;

	len = 1;
	while (num > 9)
	{
		num = num / 10;
		len++;
	}
	return (len);
}

/*
itoa
	Because libft's pt_itoa uses it's own ft_strlen, we need to make our own (above)
	Otherwise the implementation is the same.
*/
static char	*itoa(unsigned int num)
{
	int		len;
	char	*str;

	len = ft_nlen(num);
	str = malloc(sizeof(char) * len + 1);
	str[len] = '\0';
	if (str == NULL)
		return (NULL);
	while (len > 0)
	{
		--len;
		str[len] = num % 10 + '0';
		num /= 10;
	}
	return (str);
}

/*
ft_isunsigned
	Takes in argcount and uses itoa (above implementation) and outputs the string
	to standard output. Increments the argcount total by the length of the string
	Frees the string.
*/
void	ft_isunsigned(t_print *argcount)
{
	char			*str;
	unsigned int	res;

	res = va_arg(argcount->args, unsigned int);
	str = itoa(res);
	pt_putstr_fd(str, 1);
	argcount->total += pf_strlen(str);
	free(str);
}
