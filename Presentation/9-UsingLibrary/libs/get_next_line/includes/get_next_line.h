/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.h                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/09 11:26:34 by Nathanael         #+#    #+#             */
/*   Updated: 2022/08/09 15:33:34 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef GET_NEXT_LINE_H
# define GET_NEXT_LINE_H

# ifndef BUFFER_SIZE
#  define BUFFER_SIZE 255
# endif

# include <unistd.h>
# include <stdlib.h>

char		*gnl_substr(char const *s, unsigned int start, size_t len);
size_t		gnl_strlen(const char *str);
char		*gnl_strchr(const char *s, int i);
char		*gnl_strdup(const char *s);
char		*gnl_strjoin(char const *s1, char const *s2);
char		*gnl_getline(int fd, char *buffer, char *back);
char		*gnl_extract(char *line);
char		*get_next_line(int fd);

#endif