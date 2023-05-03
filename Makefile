SAIL_DIR ?=
C_OUT_DIR ?= ./build

build: c_files c_emulator

run: build
	./c_emulator

c_files: src/main.sail
	mkdir $(C_OUT_DIR) > /dev/null
	sail -c src/main.sail -o $(C_OUT_DIR)/main

c_emulator: c_files 
	gcc -O3 $(C_OUT_DIR)/main.c $(SAIL_DIR)/lib/*.c -lgmp -lz -I $(SAIL_DIR)/lib/ -o c_emulator

clean:
	-rm -f $(C_OUT_DIR)/*
	-rm -f c_emulator
