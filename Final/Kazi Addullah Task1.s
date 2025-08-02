.org 0x1000
.data
num: .word 7,6,5,4,7,6,6,8,3,10
freq: .word 0,0,0,0,0,0,0,0,0,0

.text
Calc:
mov r9, #4
loop:
ldr r2,[r0],#4
	cmp r2, #0
	BEQ done
mul r2, r2, r9	
add r1, r1, r2
ldr r3, [r1]
add r3,r3,#1
str r3,[r1]
ldr r1, =freq
b loop
done:

bx lr
.global _start
_start:
ldr r0, =num
ldr r1, =freq
bl Calc
	
	