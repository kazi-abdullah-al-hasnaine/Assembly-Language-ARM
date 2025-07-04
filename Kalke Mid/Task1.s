.org 0x1000
.data
.text
.global _start
_start:
mov r0, #2
mov r1, #4
mul r1, r1, r0 @8
mul r1, r1, r0 @ 16
mul r1, r1, r0 @4x^3 
mov r2, #5
mul r2, r2, r0
mul r2, r2, r0 @ 5x^2
mov r3, #2
mul r3, r3, r0
mov r4, #1
add r5, r1, r2
sub r5, r5, r3
add r5, r5, r4

mov r7, #1
swi 0

	
	