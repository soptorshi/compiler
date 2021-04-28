CC := gcc
BIN := ./bin
OBJ := ./obj
SRC := ./src
SRCS := $(wildcard $(SRC)/*.c)
OBJS := $(patsubst $(SRC)/%.c,$(OBJ)/%.o,$(SRCS))
EXEC := $(BIN)/compiler
CFLAGS := -Wall

.PHONY: all run clean

all: $(EXEC)

$(EXEC): $(OBJS) | $(BIN)
	$(CC) $^ -o $@

$(OBJ)/%.o: $(SRC)/%.c | $(OBJ)
	$(CC) $(CFLAGS) -c $< -o $@

$(BIN) $(OBJ):
	mkdir $@

run: $(EXEC)
	$<

clean:
	rm -f ./bin/compiler ./obj/*.o
