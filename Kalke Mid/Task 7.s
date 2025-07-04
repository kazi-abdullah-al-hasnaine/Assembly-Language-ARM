.org 0x1000
.data
array: .word 1,2,3,4,5,6,7,8,9
even:  .space 24
odd: .space 24
.text
.global _start
start: 

ldr r0, =array
ldr r1, =even
ldr r2, =odd
mov r12, #0
loop:
cmp r12, #10
BEQ exit

AND r3, r12, #1
cmp r3, #0
BEQ iseven
ldr r4, [r0],#4
str r4, [r2], #4
add r12, r12, #1 
b loop

iseven:
ldr r4, [r0],#4
str r4, [r1], #4
add r12, r12, #1 
b loop


exit:
swi 0



