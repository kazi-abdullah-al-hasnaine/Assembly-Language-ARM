.org 0x1000
.data
.text
.global _start

.macro fib a
mov r4, #0
mov r5, #1
mov r3, #1
loop: 
add r3,r3,#1 @counter

add r6, r4, r5
mov r4, r5
mov r5, r6

cmp r3, \a
BEQ end
B loop
.endm

_start:
mov r0, #23
fib r0 


end:
b end

	
	