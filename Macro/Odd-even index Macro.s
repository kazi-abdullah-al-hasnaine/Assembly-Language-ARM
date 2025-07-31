.org 0x1000
.data
arr: .word 6,3,1,4,0,8, 9, 2, 7,5,91
even: .space 32
odd: .space 32

.text
.global _start

.macro OddEven a, o, e
mov r5,#0 @index
loop: 
ldr r3,[\a],#4
cmp r3, #91
BEQ end

AND r4,r5,#1
cmp r4, #1
BEQ isodd
BNE iseven


iseven:
str r3,[\e],#4
add r5, r5, #1
b loop

isodd:
str r3,[\o],#4
add r5, r5, #1
b loop

.endm

_start:
ldr r0, =arr
ldr r1, =even
ldr r2, =odd


OddEven r0, r2, r1



end:
swi 0
b end

	
	