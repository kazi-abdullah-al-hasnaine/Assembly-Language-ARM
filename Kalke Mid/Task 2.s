.org 0x1000
.data
a: .word -5

.text
.global _start
_start:

ldr r0, =a
ldr r1, [r0]
cmp r1, #0
BLT isNeg
mov r8, #1
b exit
isNeg:
mov r8, #2
b exit

exit: 
swi 0


	
	