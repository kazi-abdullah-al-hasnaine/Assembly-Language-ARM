.org 0x1000
.data
fib:  .space 40
.text
.global _start
Procedure:
loop:
add r2, r1, r0
mov r0, r1
mov r1, r2

str r2, [r11],#4

add r12, r12, #1
cmp r12, #10
BLT loop
Bx lr

_start:

mov r0, #0
mov r1, #1
ldr r11, =fib
str r0,[r11],#4
str r1, [r11],#4
mov r12, #2
BL Procedure 

b exit

exit:
swi 0



	
	