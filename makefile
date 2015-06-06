# On a Windows machine
ifeq ($(OS),Windows_NT)
  # TODO
else
  # On Mac OS X
  ifeq ($(shell uname -s),Darwin)
		OBJC = clang
    LIBS = -framework Foundation -lobjc
		FLAGS = -Wall
  else
    # On Linux
    ifeq ($(shell uname -s),Linux)
			OBJC = clang
			LIBS = $(shell gnustep-config --base-libs)
			FLAGS = -Wall $(shell gnustep-config --objc-flags)
    else
      # TODO
    endif
  endif
endif

FLEX = flex
YACC = bison

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

all: $(IECC_BIN)

$(IECC_BIN): $(IECC_LIB)
	@echo Linking $(IECC_BIN)...
	@$(OBJC) ./$(IECC_LIB) -o $(IECC_BIN)

$(IECC_LIB): $(OBJ_IECC)
	@echo Linking $(IECC_LIB)...
	@$(OBJC) $(LIBS) $(OBJ_IECC) -fPIC -shared -o $(IECC_LIB)

$(DIR_IECC)/%.o: $(DIR_IECC)/%.m
	@echo Compiling $*.m...
	@$(OBJC) -I$(INC_IECC) $(FLAGS) -fPIC \
					 -c $< -o $@ -MMD -MF $(DIR_IECC)/$*.dep

$(DIR_IECC)/%.out.tmp: $(DIR_IECC)/%.lm
	@echo Building and compiling $*.lm...
	@$(FLEX) -o $(DIR_IECC)/$*.out.tmp $<

$(DIR_IECC)/%.out.tmp $(DIR_IECC)/%.tmp.h: $(DIR_IECC)/%.ym
	@echo Building and compiling $*.ym...
	@$(YACC) --report=states --report-file=$(DIR_IECC)/$*.states.tmp -o $(DIR_IECC)/$*.out.tmp --defines=$(DIR_IECC)/$*.tmp.h $<

$(DIR_IECC)/%.out.o: $(DIR_IECC)/%.out.tmp
	@$(OBJC) -I$(INC_IECC) $(FLAGS) -fPIC -xobjective-c \
						-c $< -o $@ -MMD -MF $(DIR_IECC)/$*.out.dep

.PHONY: clean

clean:
	@rm -f $(IECC_BIN) $(IECC_LIB)
	@rm -f $(shell find . -name "*.o" -or -name "*.dep")
	@rm -f $(shell find . -name "*.out.tmp" -or -name "*.tmp.h")

.SECONDARY:
	@echo Just works. :)

-include $(SRC_IECC:.m=.dep)
-include $(SRC_IECC_LM:.lm=.out.dep)
-include $(SRC_IECC_YM:.ym=.out.dep)
