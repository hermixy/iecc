OBJC = clang

DIR_IECC = src/IECC
INC_IECC = include/IECC
SRC_IECC = $(shell find $(DIR_IECC) -name "*.m")
OBJ_IECC = $(SRC_IECC:.m=.o)

IECC=iecc

all: $(IECC)

$(IECC): $(OBJ_IECC)
	@echo Linking $(IECC)...
	@$(OBJC) $(OBJ_IECC) -o $(IECC)

$(DIR_IECC)/%.o: $(DIR_IECC)/%.m
	@echo Compiling $*.m...
	@$(OBJC) -I$(INC_IECC) -c $< -o $@ -MMD -MF $(DIR_IECC)/$*.dep

.PHONY: clean

clean:
	@rm -f $(IECC)
	@rm -f $(shell find . -name "*.o" -or -name "*.dep")

-include $(SRC_IECC:.m=.dep)
