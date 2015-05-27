OBJC = clang

DIR_IECC = src/IECC
INC_IECC = include/IECC
SRC_IECC = $(shell find $(DIR_IECC) -name "*.m")
OBJ_IECC = $(SRC_IECC:.m=.o)

IECC_BIN=iecc
IECC_LIB=iecc.so

all: $(IECC_BIN)

$(IECC_BIN): $(IECC_LIB)
	@echo Linking $(IECC_BIN)...
	@$(OBJC) ./$(IECC_LIB) -o $(IECC_BIN)

$(IECC_LIB): $(OBJ_IECC)
	@echo Linking $(IECC_LIB)...
	@$(OBJC) $(OBJ_IECC) -shared -o $(IECC_LIB)

$(DIR_IECC)/%.o: $(DIR_IECC)/%.m
	@echo Compiling $*.m...
	@$(OBJC) -I$(INC_IECC) -c $< -o $@ -MMD -MF $(DIR_IECC)/$*.dep

.PHONY: clean

clean:
	@rm -f $(IECC_BIN) $(IECC_LIB)
	@rm -f $(shell find . -name "*.o" -or -name "*.dep")

-include $(SRC_IECC:.m=.dep)
