/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/09 11:33:01 by Nathanael         #+#    #+#             */
/*   Updated: 2022/08/09 16:18:38 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include <unistd.h>
# include <stdarg.h>
# include <stdlib.h>

/****************************************/
/*				LIBFT					*/
/****************************************/

int		pt_abs(int tofind);
char	*pt_itoa(int n);
char	*pf_numlen(unsigned long num, int *len);
void	pt_putchar_fd(char c, int fd);
void	pt_putstr_fd(char *s, int fd);
size_t	pt_strlen(const char *str);

/****************************************/
/*				FT_PRINTF				*/
/****************************************/

typedef struct s_printf
{
	va_list	args;
	int		total;
}	t_print;

void	ft_check(const char c, t_print *argcount);
void	ft_ischaracter(t_print *argcount);
void	ft_ishex(t_print *argcount, char c);
void	ft_isint(t_print *argcount);
void	ft_isperc(t_print *argcount);
void	ft_ispointer(t_print *argcount);
void	ft_isstring(t_print *argcount);
void	ft_isunsigned(t_print *argcount);

int		ft_printf(const char *formatting, ...);

#endif