TARGET_EXEC	:=	final_program

BUILD_DIR	:=	build
SRC_DIRS	:=	sources
INC_DIRS	:=	includes

SRCS := $(shell find $(SRC_DIRS) -name '*.cpp' -or -name '*.c')
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

INC_FLAGS := $(addprefix -I,$(INC_DIRS))
CPPFLAGS := $(INC_FLAGS) -MMD -MP

.SILENT:

# Building target exec using objs
$(TARGET_EXEC): $(OBJS)
	$(CC) $(OBJS) -o $@ $(LDFLAGS)
	$(info Linked $(OBJS) to $@)
	$(info Program $(TARGET_EXEC) ready to run)

# Compiling .c.o from .c
$(BUILD_DIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@
	$(info Compiled $< to $@)

# Compiling .cpp.o from .cpp
$(BUILD_DIR)/%.cpp.o: %.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@
	$(info Compiled $< to $@)

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
	rm -f $(TARGET_EXEC)
	$(info $(BUILD_DIR) $(TARGET_EXEC) cleaned)

-include $(DEPS)