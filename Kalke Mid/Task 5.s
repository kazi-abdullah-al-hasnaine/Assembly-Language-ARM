.org 0x1000
.data
arr1: .word 1,2,3,4,5
arr2: .word 6,4,5,1,4
SumArray: .space 20
.text
.global _start
_start:
ldr r0, =arr1
ldr r1, =arr2
ldr r3, =SumArray
mov r12, #0

loop:
ldrb r4,[r0], #4
ldrb r5,[r1], #4
add r6, r4, r5
strb r6, [r3], #4

add r12, r12, #1
cmp r12, #5
BEQ exit
b loop

exit:
swi 0

