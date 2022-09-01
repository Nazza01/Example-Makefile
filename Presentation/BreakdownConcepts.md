
# Concept Breakdown

1-MakeRules
-----------------------
- What is a rule
- How to write a rule
- Why the default rule is the first one that runs

2-Variables
-----------------------
- Using variables for subsitution in rules
- Special variables reserved for make $<

3-Basics
-----------------------
- Basic compilation and example with a hello world example
- Cleaning

4-42ify
-----------------------
- Defining rules for all $(NAME) clean fclean re
- Listing sources for use throughout the program

5-FullExample
-----------------------
- Using previous example to showcase using a header file with the project
- Fully commented each line and rule so its easier to follow along
- Showcases multiple .c files

6-Organised
-----------------------
- Showcases info which is useful if printf or echo is not implemented on the os
- Can follow a directory structure so sources are in seperate dirs and so are headers as well as objects 

7-NestedAllExtras
-----------------------
- Combines all aspects of the above examples to organise all your files into different subdirectories, you can now use subdirs inside a sources directory

8-UsingLibrary
-----------------------
- Combines all aspects above
- Allows for auto detection of libraries within the librarys directory (uses libft, get_next_line, ft_printf and personal)
- Also includes os detection, importing .h files, recusive make, basename, subst, bash inside rule 