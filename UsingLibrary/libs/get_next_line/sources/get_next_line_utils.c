/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line_utils.c                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/09 15:20:04 by nervin            #+#    #+#             */
/*   Updated: 2022/08/09 15:34:29 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"

/*
NAME
	gnl_strlen
PARAMETERS
	str		The string of which to calculate the length of.
DESCRIPTION
	Iterates through while counting the string str until it its the null
	terminating character.
RETURN VALUES
	The length of the string str.
*/
size_t	gnl_strlen(const char *str)
{
	int	i;

	i = 0;
	while (str[i])
		i++;
	return (i);
}

/*
NAME
	gnl_substr - Creates a substring, assigns it using malloc and returns it.
PARAMETERS
	s		The string of which to create the substring.
	start	The start index of the substring in the string 's'.
	len		The maximum length of the substring.
DESCRIPTION
	Allocates (with malloc(3)) and returns a substring from the string 's'.
	The substring begins at index 'start' and is of maximum size 'len'.
RETURN VALUES
	The substring. NULL if the allocation fails.
*/
char	*gnl_substr(char const *s, unsigned int start, size_t len)
{
	size_t	i;
	size_t	j;
	char	*substr;

	substr = malloc(sizeof(*s) * (len + 1));
	if (substr == 0)
		return (NULL);
	i = 0;
	j = 0;
	while (s[i])
	{
		if (i >= start && j < len)
		{
			substr[j] = s[i];
			j++;
		}
		i++;
	}
	substr[j] = 0;
	return (substr);
}

/*
NAME
	gnl_strchr
PARAMETERS
	s	Word to search for the character in.
	i	Character to find.
RETURN VALUES
	Returns a pointer to the first occurence of the character.
EXTERNAL FUNCTIONS.
	None.
DESCRIPTION
	Locates the character i in the string s.
*/
char	*gnl_strchr(const char *s, int i)
{
	while (*s != '\0')
	{
		if (*s == i)
			return ((char *)s);
		s++;
	}
	if (*s == '\0' && i == '\0')
		return ((char *)s);
	return (NULL);
}

/* 
NAME
	gnl_strdup
PARAMETERS
	s	String to duplicate
RETURN VALUES
	str	The string that contains a duplicate copy of the string s
EXTERNAL FUNCTIONS
	malloc, ft_strlen
DESCRIPTION
	Takes in a string, assigns the appropriate amount of memory for the copy and
	returns the null terminated copy of that string now duplicated.
 */
char	*gnl_strdup(const char *s)
{
	int		i;
	int		j;
	char	*str;

	i = 0;
	j = gnl_strlen(s);
	str = malloc(sizeof(*str) * (j + 1));
	while (i < j)
	{
		str[i] = s[i];
		i++;
	}
	str[i] = '\0';
	return (str);
}

/*
NAME
	gnl_strjoin - Joins two strings together.
PARAMETERS
	s1	The prefix string
	s2	The suffix string
DESCRIPTION
	Allocates (with malloc(3)) and returns a new string, which is the result of
	the concatenation of 's1' and 's2'.
RETURN VALUES
	The new string. NULL if the allocation fails.
*/
char	*gnl_strjoin(char const *s1, char const *s2)
{
	int		i;
	int		j;
	char	*str;

	i = 0;
	j = 0;
	str = malloc(sizeof(char) * (gnl_strlen(s1) + gnl_strlen(s2) + 1));
	if (str == NULL)
		return (NULL);
	while (s1[i] != '\0')
	{
		str[i] = s1[i];
		i++;
	}
	while (s2[j] != '\0')
	{
		str[i + j] = s2[j];
		j++;
	}
	str[i + j] = '\0';
	return (str);
}
