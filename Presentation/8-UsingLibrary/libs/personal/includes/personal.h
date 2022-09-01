/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   personal.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/09 11:49:26 by Nathanael         #+#    #+#             */
/*   Updated: 2022/08/09 15:37:42 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PERSONAL_H
# define PERSONAL_H

# define EXIT_SUCCESS 0
# define EXIT_FAILURE 1
# define EXIT_ERROR -1

# include <stddef.h>
# include <stdlib.h>
# include <unistd.h>

/****************************************/
/*		LIBFT - Included Functions		*/
/****************************************/

void	p_putchar_fd(char c, int fd);
void	p_putstr_fd(char *s, int fd);
size_t	p_strlen(const char *str);

void	ft_error(char *message, int F_TYPE);
void	ft_free_arg(char **arg);
int		ft_isnull(void *data);
int		ft_get_neg_len(int number);
int		ft_get_pos_len(int number);
int		ft_strcmp(char *first_str, char *second_str);
int		ft_strncmp_end(const char *s1, const char *s2, size_t n);

#endif
