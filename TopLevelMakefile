# README
#	This makefile can be used in a Piscine style project (CPPModules, CPiscine etc)
# 	It will find all directories that you specify below
# 	
#	The below will find all directories starting with ex
#	TOFIND = ex
# 	Will find all folders starting with ex e.g: ex01, ex02, ex03
# 	
# 	As long as the corresponding folders have makefiles inside with the 
# 	following rules: clean all
#	the program will work, you can customise it as needed.

TOFIND = ex


FINDALL_DIR	=	$(shell find . -name "${TOFIND}**" -type d -print)

.SILENT:

# Cleans all the subdirectories ready to eval
ca:
	for dir in $(FINDALL_DIR); do \
		$(MAKE) -C "$${dir}" clean; \
	done

# Makes all directories in the current folder structure
ma:
	for dir in $(FINDALL_DIR); do \
		$(MAKE) -C "$${dir}" all; \
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
	
