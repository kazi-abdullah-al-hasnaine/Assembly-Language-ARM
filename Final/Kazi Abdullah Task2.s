.org 0x1000
.data
letters: .word 0x77,0x7C,0x39,0x5E,0x79,0x71,0

numbers: .word 0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F,0
.text

delay:
mov r12, #0x500000
	delayloop:
	SUB r12,r12,#1
	CMP r12,#1
	BNE delayloop
bx lr

.global _start
_start:


ldr r0,=letters
ldr r1,=numbers
ldr r2,=0xff200020
ldr r4,=0xff200050

loop: 

wait: 
ldr r5,[r4]
cmp r5, #1
BEQ wait
cmp r5,#2
BEQ print_af
	ldr r3,[r1],#4
	cmp r3, #0
	BEQ loop_done
	str r3,[r2]
	bl delay
	b loop

loop_done:
ldr r1,=numbers
b loop

print_af:
	wait2: 
	ldr r5,[r4]
	cmp r5, #3
	BEQ wait2
	
ldr r6,[r0],#4
cmp r6, #0
BEQ print_af_done
str r6,[r2]
bl delay
b print_af


print_af_done:
ldr r0,=letters
b print_af





	