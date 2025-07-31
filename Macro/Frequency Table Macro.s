.org 0x1000
.data
source: .word 7,6,5,4,7,6,6,8,3,10,0
store: .space 400

.text
.global _start

.macro Distribute source, store
loop: 
ldr r2, [\source], #4

cmp r2, #0
BEQ end

ldr r3, [\store, r2, LSL #2]
add r3, r3, #1
str r3, [\store, r2, LSL #2]

b loop

.endm

_start:
ldr r0, =source
ldr r1, =store


Distribute r0, r1



end:
swi 0
b end

	
	