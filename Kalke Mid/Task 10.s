.org 0x1000
.data
str: .asciz "Mystr,Chudi"
punc: .asciz "?.,!;"
out: .space 200
.text

.global _start
_start:
ldr r0, =str
ldr r1, =punc
mov r11, #0
loop1:
ldrb r2, [r0], #1
cmp r2, #0
BEQ exit
mov r12, #0
loop2:
ldrb r3, [r1], #1

cmp r3, #0
BEQ loop1

cmp r2, r3
BEQ check_space
b loop2
	
check_space:
ldrb r4, [r0]
cmp r4,#' '
BEQ add_space
b loop2

add_space:



exit:
swi 0
	

