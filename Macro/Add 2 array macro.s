.org 0x1000
.data
arr1: .word 1,2,3,4,5
arr2: .word 5,4,3,2,1
result: .space 200
.text
.global _start

.macro addArr a, b, res

loop:
ldr r3, [\a], #4
cmp r3, #0
BEQ end
ldr r4, [\b], #4

add r5, r3, r4
str r5,[\res], #4
b loop

.endm

_start:
ldr r0, =arr1
ldr r1, =arr2
ldr r2, =result

addArr r0, r1, r2



end:
swi 0
.end

	
	