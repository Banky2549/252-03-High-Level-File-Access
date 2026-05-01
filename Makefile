CC = gcc
CFLAGS = -Wall -Wextra -Werror -g -Iinclude
BIN_DIR = bin

all: $(BIN_DIR)/report_buffer_lab

check: all
	bash ./scripts/check.sh

grade: all
	bash ./scripts/grade.sh

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(BIN_DIR)/report_buffer_lab: src/report_buffer_lab.c include/report_buffer_lab.h | $(BIN_DIR)
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(BIN_DIR)/report_buffer_lab

.PHONY: all check grade clean
