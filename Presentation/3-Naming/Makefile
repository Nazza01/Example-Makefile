# Define the helloworld rule which calls the testfile rule first
helloworld: testfile
	@echo "Hello World"

# Define testfile rule
# 	Call recursive make on the file using -f to filemake
testfile:
	@$(MAKE) -f filemake