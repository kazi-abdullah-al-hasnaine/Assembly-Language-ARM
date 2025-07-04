.org 0x1000
.data
str: .asciz "abcba"
.align 2
target: .space 200
.text

.global _start
_start:

ldr r0, =str
ldr r1, =target

BL str_ln @r3 te str er last address ache

loop:  @copy korar jnno
cmp r0, r3
BGT check_palin  @copy done
ldrb r4, [r3],#-1
strb r4, [r1], #1
b loop

check_palin:

ldrb r5, [r0],#1 @element from source
cmp r5, #0
beq is_palin
ldrb r6, [r1],#1 @element from target
cmp r5,r6
BNE no_palin
b check_palin

is_palin:
mov r8, #1
b exit

no_palin:
mov r8, #2
b exit


str_ln:
ldrb r2, [r0], #1
cmp r2, #0
bne str_ln
push {lr}
BL last_add
pop {lr}
bx lr

last_add:
sub r0, r0, #1
mov r3, r0 @r3 has the last address
ldr r0, =str
BX lr




exit:
swi 0
	

