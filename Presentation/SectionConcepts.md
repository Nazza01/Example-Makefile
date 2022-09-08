
# Concept Breakdown

3-MakeRules
-----------------------
- What is a rule
- How to write a rule
- Why the default rule is the first one that runs

4-Basics
-----------------------
- Basic compilation and example with a hello world example
- Cleaning

5-Variables
-----------------------
- Using variables for subsitution in rules
- Setting up NAME rule

6-CompLink
-----------------------
- Difference between compilation and linking and pre-requisite rule calling

10-42ify
-----------------------

### 1-simple
-----------------------
- Definition of all 42 make rules (all $(NAME) clean fclean re)
- Listing sources explicity

### 2-Relinking
-----------------------
#### 2-Relinking-HowToDo
- Shows an example of how relinkng wont happen with proper setup of all rules

#### 2-Relinking-Whatnottodo
-----------------------
- Makefile
	- Shows an example from online that links every time make is run, which is known as re-linking
- Fixed.mk
	- Shows a fixed example of the Makefile with proper rules/definitions.

### 3-MultipleBinaries
-----------------------
- Shows how to have two executables without having rules setup
- Shows implicit rules (automatic built in rules for make to compile .c to .o)

### 4-NonSystemLib
-----------------------
- Shows how to use a included library in the linking stage

13-Bonus
-----------------------
- Covers how to setup a bonus rule in your makefile
- Linking a library using ar -rcs as well as ranlib to index the library

14-Bonus
-----------------------
- Covers how to setup a bonus rule in your makefile
- Linking a library using ar -rcs as well as ranlib to index the library


========================================


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