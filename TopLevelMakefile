# README
#	This makefile can be used in a Piscine style project (CPPModules, CPiscine etc)
# 	It will find all directories that you specify below
# 	
#	The below will find all directories starting with ex
#	TOFIND = ex
# 	Will find all folders starting with ex e.g: ex01, ex02, ex03
# 	
# 	As long as the corresponding folders have makefiles inside with the 
# 	following rules (clean all) then the program will work. It is fully
#	customizable
TOFIND = ex

FINDALL_DIR	=	$(shell find . -name "${TOFIND}**" -type d -print | sort -h)

# Silences all output when rules are run
.SILENT:

# 			RULES
# Default rule cleans then makes all directories
all: ca ma

# Cleans all the exercises directories using their makefiles
c ca:
	for dir in $(FINDALL_DIR); do \
		$(MAKE) -C "$${dir}" clean; \
	done

# Makes all directories in the current folder structure
ma:
	for dir in $(FINDALL_DIR); do \
		$(MAKE) -C "$${dir}" all; \
	done

# Runs all the programs contained (needs to be appended with .out e.g. $(NAME).out)
ra: ma
	for dir in $(FINDALL_DIR); do \
		printf "\n"; \
		printf "\n"; \
		printf "################################################################################\n"; \
		printf "#                       RUNNING PROGRAM IN DIR	: $$dir                       #\n"; \
		printf "################################################################################\n"; \
		printf "\n"; \
		./$$dir/*.out; \
	done

# Makes all of the docker containers using the v rule
md:
	for dir in $(FINDALL_DIR); do \
		$(MAKE) -C "$${dir}" v; \
	done

vdl:
	for dir in $(FINDALL_DIR); do \
		$(MAKE) -C "$${dir}" vl; \
	done

# Cleans all the valgrind docker containers 
cld:
	for dir in $(FINDALL_DIR); do \
		$(MAKE) -C "$${dir}" cv; \
	done

# Commits to github all current files
# 	Substitute github-link with a github link to push to github
github:
	git remote set-url origin github-link
	git add .
	echo "Please type a commit messsage"
	read COMMIT; \
	git commit -m "$$COMMIT"; \
	git push;

# Commits to git located at 42 vogsphere
#	Substitute 42-vog for your 42 intra project link
submit:
	git remote set-url origin 42-vog
	git add .
	echo "Please type a commit message"
	read COMMIT; \
	git commit -m "$$COMMIT"; \
	git push

# Intitailises the local repository to add the 42 vogsphere and pushes the upstream to the correct origin (first commit after initialising local repo)
init:
	git remote add origin 42-vog
	git add .
	echo "Please type a commit message"
	read COMMIT; \
	git commit -m "$$COMMIT"; \
	git push --set-upstream origin main
