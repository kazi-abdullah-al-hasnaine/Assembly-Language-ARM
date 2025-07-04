.org 0x1000
.data
str1: .asciz "ami tomake"
str2: .asciz "bhalobashi"
result: .space 350
.text
.global _start
_start:
ldr r0, =str1
ldr r1, =str2
ldr r2, =result

loop_s1:
ldrb r3, [r0], #1
cmp r3, #0
BEQ l_1_done
strb r3, [r2]
add r2, r2, #1
b loop_s1

l_1_done:
mov r12, #' '
strb r12, [r2]
add r2, r2, #1

loop_s2: 
ldrb r4, [r1], #1
cmp r4, #0
beq exit
strb r4, [r2]
add r2, r2, #1
b loop_s2
exit:
mov r5, #0
strb r5, [r2]
swi 0
