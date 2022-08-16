m: all
	leaks -atExit -- ./$(NAME) > leak_out.txt || true
	grep -E '(Process) [0-9]{1,}: [0-9]{1,} (leak)' leak_out.txt
	grep -E '(ROOT LEAK): <' leak_out.txt || true
	rm leak_out.txt
	
v:
	$(ECHO) Removing old $(VALGRND_NAME) docker containers
	docker stop $(VALGRND_NAME) > $(VALGRND_NAME)_docker.log 2>&1 || true && docker rm $(VALGRND_NAME) >> $(VALGRND_NAME)_docker.log 2>&1 || true
	$(ECHO) Creating valgrind docker named: $(VALGRND_NAME)
	docker run --name $(VALGRND_NAME) -dit livingsavage/42valgrind:v4 >> $(VALGRND_NAME)_docker.log
	$(ECHO) Copying Makefile $(HDR_DIR) $(SRC_DIR) to $(VALGRND_NAME)
	docker cp $(HDR_DIR) $(VALGRND_NAME):/code/includes
	docker cp $(SRC_DIR) $(VALGRND_NAME):/code/sources
	docker cp Makefile $(VALGRND_NAME):/code/Makefile
	$(ECHO) Using makefile to create $(NAME)
	docker exec $(VALGRND_NAME) make >> $(VALGRND_NAME)_docker.log
	$(ECHO) Using valgrind to log results for $(NAME)
	docker exec $(VALGRND_NAME) valgrind --log-file=$(VALGRND_NAME)_leaks.log -- ./$(NAME) > $(NAME).log
	$(ECHO) Copying over $(VALGRND_NAME)_leaks.log file
	docker cp $(VALGRND_NAME):/code/$(VALGRND_NAME)_leaks.log .
	$(ECHO) Done!
	echo "The container $(VALGRND_NAME) is still running, if you want to go into the container type: docker attach $(VALGRND_NAME)"
	echo "Typing [make vl] to view valgrind logs, or [make pl] to view program logs, will view the respective logs using less"

h:
	echo "The following logs contain the following: "
	echo "Valgrind leak output - $(VALGRND_NAME)_leaks.log"
	echo "Normal program output - $(NAME).log"
	echo "Docker command output - $(VALGRND_NAME)_docker.log"
	echo "Makefile output - $(VALGRND_NAME)_make.log"
	echo "Typing [make vl] to view valgrind logs, or [make pl] to view program logs, will view the respective logs using less"

vl:
	less $(VALGRND_NAME)_leaks.log

pl:
	less $(NAME).log
