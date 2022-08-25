SOURCES		:=	$(wildcard sources/*.c)
INCLUDES	:=	$(wildcard includes/*.h)
OBJECTS		:=	$(SOURCES:sources/%.c=build/objects/%.o)

