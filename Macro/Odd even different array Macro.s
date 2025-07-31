.org 0x1000
.data
arr: .word 6,3,1,4,0,8, 9, 2, 7,5,0
even: .space 24
odd: .space 24

.text
.global _start

.macro OddEven a, o, e

loop: 
ldr r3,[\a],#4

cmp r3, #0
BEQ end

AND r4,r3,#1
cmp r4, #1
BEQ iseven
BNE isodd


iseven:
str r3,[\e],#4
b loop

isodd:
str r3,[\o],#4
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

	
	