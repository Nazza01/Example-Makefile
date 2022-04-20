NAME 	=	graphics

#####################################################
#					DIRECTORIES						#
#####################################################
BLDDIR	=	./build
HDRDIR	=	./headers
LIBDIR	=	./libraries
OBJDIR	=	./objects
SRCDIR	=	./sources
INCHDR	=	./headers/imported

TEMPDIR	=	$(BLDDIR) $(OBJDIR) $(INCHDR)

#####################################################
#					FILES							#
#####################################################
SOURCES	:=	$(shell find $(SRCDIR) -name '*.c')
HEADERS	:=	$(shell find $(HDRDIR) -name '*.h')
OBJECTS	:=	$(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

#####################################################
#					COMPILER/FLAGS					#
#####################################################
CC		=	gcc
FLAGS	=	-Wall -Wextra -Werror -std=c99 -I $(HDRDIR) -I $(INCHDR)
CFLAGS	=	$(FLAGS)
LFLAGS	=	$(FLAGS)

#####################################################
#					EXTERNAL/UTILS					#
#####################################################
RM		=	rm -rf
MKDIR	=	mkdir -p
CP		=	cp

#####################################################
#					LIBRARIES						#
#####################################################
L42DIR	=	$(LIBDIR)/lib42
LIB42	=	$(L42DIR)/build/lib42.a

ALL_LIBS=	$(LIB42)

#####################################################
#					COMMANDS						#
#####################################################
all: dirs libs $(BLDDIR)/$(NAME)

dirs:
	@$(MKDIR) $(TEMPDIR)
	@clear
	@printf "Made directories: %s\n" $(TEMPDIR)

libs:
	@$(CP) $(L42DIR)/**/*.h $(INCHDR)
	@$(MAKE) -C $(L42DIR)
	@clear
	@printf "Made libraries: %s\n" $(ALL_LIBS)

$(BLDDIR)/$(NAME): $(OBJECTS)
	@$(CC) $(OBJECTS) $(LFLAGS) -o $@ $(ALL_LIBS)
	@clear
	@printf "Compiled %s successfully\n" $@

$(OBJECTS): $(OBJDIR)/%.o : $(SRCDIR)/%.c
	@$(CC) $(CFLAGS) -c $< -o $@
	@clear
	@printf "Linked %s to %s\n" $< $@

clean:
	@$(RM) $(TEMPDIR)
	@clear
	@printf "Cleaned: %s\n" $(TEMPDIR)

re: clean all
	@clear
	@printf "Cleaned and remade all files!\n"