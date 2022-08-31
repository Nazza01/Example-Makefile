/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/09 15:20:07 by nervin            #+#    #+#             */
/*   Updated: 2022/08/09 15:35:03 by Nathanael        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"

/*
NAME
	gnl_getline
PARAMETERS
	fd		The file descriptor to read from
	buf		The memory to read from.
	backup	The previous line.
RETURN VALUES
	backup
EXTERNAL FUNCTIONS
	free, read, ft_strdup, ft_strjoin
DESCRIPTION
	Obtains the current line and reads it from the file descriptor using the
	passed through buffer and for an amount of size.
*/
char	*gnl_getline(int fd, char *buf, char *backup)
{
	int		read_line;
	char	*char_temp;

	read_line = 1;
	while (read_line != '\0')
	{
		read_line = read(fd, buf, BUFFER_SIZE);
		if (read_line == -1)
			return (0);
		else if (read_line == 0)
			break ;
		buf[read_line] = '\0';
		if (!backup)
			backup = gnl_strdup("");
		char_temp = backup;
		backup = gnl_strjoin(char_temp, buf);
		free(char_temp);
		char_temp = NULL;
		if (gnl_strchr (buf, '\n'))
			break ;
	}
	return (backup);
}

/*
NAME
	gnl_extract
PARAMETERS
	line	The line to be read
RETURN VALUES
	backup	The line that was previously read.
EXTERNAL FUNCTIONS
	ft_substr, ft_strlen
DESCRIPTION
	Extracts the line and returns the line that was previously before it
*/
char	*gnl_extract(char *line)
{
	size_t	count;
	char	*backup;

	count = 0;
	while (line[count] != '\n' && line[count] != '\0')
		count++;
	if (line[count] == '\0')
		return (0);
	backup = gnl_substr(line, count + 1, gnl_strlen(line) - count);
	if (*backup == '\0')
	{
		free(backup);
		backup = NULL;
	}
	line[count + 1] = '\0';
	return (backup);
}

/*
NAME
	get_next_line
PARAMETERS
	fd		file descriptor to use
RETURN VALUES
	line	Reads the whole line up until the /n character
	NULL	nothing else to read or an error occurred
EXTERNAL FUNCTIONS
	free, malloc
DESCRIPTION
	A function that returns the line read from a file descriptor (stdin or file)
*/
char	*get_next_line(int fd)
{
	char		*line;
	char		*buf;
	static char	*backup;

	if (fd < 0 || BUFFER_SIZE <= 0)
		return (0);
	buf = malloc(sizeof(char) * (BUFFER_SIZE + 1));
	if (!buf)
		return (0);
	line = gnl_getline(fd, buf, backup);
	free(buf);
	if (!line)
		return (NULL);
	backup = gnl_extract(line);
	return (line);
}
