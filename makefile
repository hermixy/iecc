FLEX = flex
YACC = bison
OBJC = clang

DIR_IECC = src/iecc
INC_IECC = include/iecc
SRC_IECC_M = $(shell find $(DIR_IECC) -name "*.m")
SRC_IECC_LM = $(shell find $(DIR_IECC) -name "*.lm")
SRC_IECC_YM = $(shell find $(DIR_IECC) -name "*.ym")
OBJ_IECC = $(SRC_IECC_YM:.ym=.out.o) \
					 $(SRC_IECC_LM:.lm=.out.o) \
					 $(SRC_IECC_M:.m=.o)

IECC_BIN=iecc
IECC_LIB=iecc.so

LIBS = $(shell gnustep-config --base-libs)
FLAGS = $(shell gnustep-config --objc-flags)

all: $(IECC_BIN)

$(IECC_BIN): $(IECC_LIB)
	@echo Linking $(IECC_BIN)...
	@$(OBJC) $(LIBS) ./$(IECC_LIB) -o $(IECC_BIN)

$(IECC_LIB): $(OBJ_IECC)
	@echo Linking $(IECC_LIB)...
	@$(OBJC) $(OBJ_IECC) -fPIC -shared -o $(IECC_LIB)

$(DIR_IECC)/%.o: $(DIR_IECC)/%.m
	@echo Compiling $*.m...
	@$(OBJC) -I$(INC_IECC) $(FLAGS) -fPIC \
					 -c $< -o $@ -MF $(DIR_IECC)/$*.dep

$(DIR_IECC)/%.out.tmp: $(DIR_IECC)/%.lm
	@echo Building and compiling $*.lm...
	@$(FLEX) -o $(DIR_IECC)/$*.out.tmp $<

$(DIR_IECC)/%.out.tmp: $(DIR_IECC)/%.ym
	@echo Building and compiling $*.ym...
	@$(YACC) -o $(DIR_IECC)/$*.out.tmp $<

$(DIR_IECC)/%.out.o: $(DIR_IECC)/%.out.tmp
	@$(OBJC) -I$(INC_IECC) $(FLAGS) -fPIC -xobjective-c \
						-c $< -o $@ -MF $(DIR_IECC)/$*.dep

.PHONY: clean

clean:
	@rm -f $(IECC_BIN) $(IECC_LIB)
	@rm -f $(shell find . -name "*.o" -or -name "*.dep" -or -name "*.out.tmp")

.SECONDARY:
	@echo Just works. :)

-include $(SRC_IECC:.m=.dep)
