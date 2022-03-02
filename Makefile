# need add -no-pie
# https://stackoverflow.com/questions/43367427/32-bit-absolute-addresses-no-longer-allowed-in-x86-64-linux
# https://www.secureideas.com/blog/2021/05/linux-x86-assembly-how-to-build-a-hello-world-program-in-gas.html
#
# https://www.cs.princeton.edu/courses/archive/spr09/cos217/lectures/
ifdef debug
	CFLAGS += -g3
endif

#CFLAGS += -fno-pie -no-pie

C_FILES := hello.c
S_FILES := world.s

C_OBJS := $(C_FILES:.c=.o)
S_OBJS := $(S_FILES:.s=.o)

.PHONY: clean all

all: helloworld

$(C_OBJS): $(C_FILES)
	$(CC) -c $(CFLAGS) -o $@ $<

$(S_OBJS): $(S_FILES)
	$(CC) -c $(CFLAGS) -o $@ $<

helloworld: $(C_OBJS) $(S_OBJS)
	$(CC) -no-pie -o $@ $^ $(LDLIBS)


clean:
	$(RM) helloworld *.o
