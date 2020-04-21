SRC_DIR=./src
TEST_DIR=./test
OUT_DIR=./build

INCLUDE_DIRS=-Isrc 

SRCS=\
	LightScheduler.c \
	main.c

OBJS := $(addprefix $(OUT_DIR)/,$(SRCS:.c=.o))

.PHONY: all test test_clean clean

test:
	make -C $(TEST_DIR)

test_clean:
	make -C $(TEST_DIR) clean
	
all: run.X


$(OUT_DIR)/%.o: $(SRC_DIR)/%.c
	gcc -c $(INCLUDE_DIRS) -o $@ $^

run.X: $(OBJS)
	gcc -o ./build/run.X $^

clean:
	rm $(OUT_DIR)/*.o