.org 0x1000
.data
arr: .word 1,2,3,4
rev: .space 16

.text
.global _start
_start:


ldr r0,=arr
ldr r1, [r0]
ldr r2 , [r0,#4]
ldr r3 , [r0,#8]
ldr r4 , [r0,#12]

ldr r5, =rev
str r4, [r5]
str r3 , [r5,#4]
str r2 , [r5,#8]
str r1 , [r5,#12]



.end	
	