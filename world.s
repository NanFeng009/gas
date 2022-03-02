# ----------------------------------------------------------------------------------------
# Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.
# To assemble and run:
#
#     gcc -c world.s && ld world.o && ./a.out
#
# or
#
#     gcc -nostdlib world.s && ./a.out
# ----------------------------------------------------------------------------------------


/* int __world(); */
.file "world.s"


/* declare a function with default visibility */
.macro DECLARE_GLOBAL_FUNC name
    .globl \name
    .type \name, @function
\name:
	endbr64
.endm

.text
DECLARE_GLOBAL_FUNC __world
	# write(1, message, 13)
	mov     $1, %rax                # system call 1 is write
	mov     $1, %rdi                # file handle 1 is stdout
	mov     $msg, %rsi    		    # address of string to output
	mov     $len, %rdx              # number of bytes
	syscall                         # invoke operating system to do the write
	
	# exit(0)
	mov     $60, %rax               # system call 60 is exit
	xor     %rdi, %rdi              # we want return code 0
	syscall                         # invoke operating system to exit

.data
	msg: .ascii  "Hello, world\n"
	len = . - msg
