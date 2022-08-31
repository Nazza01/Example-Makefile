1-Makerules
	- What is a rule
	- How to write a rule
	- Why the default rule is the first one that runs

2-Variables
	- Using variables for subsitution in rules
	- Special variables reserved for make $<

3-Naming
	- Rule heirachy (prerequisites) and how they run the way they do
	- recursive make ($(MAKE) -C lib/libft)
	- using -f for different filenames --file name

4-Basics
	- Basic compilation and example with a hello world example
	- Cleaning

5-42ify
	- Defining rules for all $(NAME) clean fclean re
	- Listing sources for use throughout the program

6-FullExample
	- Using previous example to showcase using a header file with the project
	- Fully commented each line and rule so its easier to follow along
	- Showcases multiple .c files

7-Organised
	- Showcases info which is useful if printf or echo is not implemented on the os
	- Can follow a directory structure so sources are in seperate dirs and so are headers as well as objects 

8-NestedAllExtras
	- Combines all aspects of the above examples to organise all your files into different subdirectories, you can now use subdirs inside sources/

9-UsingLibrary
	- Combines all aspects above
	- Allows for auto detection of libraries within the librarys directory (uses libft, get_next_line, ft_printf and personal)
	- Also includes os detection, importing .h files, recusive make, basename, subst, bash inside rule 