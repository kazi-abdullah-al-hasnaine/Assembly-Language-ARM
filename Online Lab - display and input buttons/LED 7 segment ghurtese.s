.org 0x1000
.data
.text
.global _start

delay:
ldr r3, =#0x500000
delay_loop:
subs r3, r3, #1
bne delay_loop
bx lr


_start:

ldr r0,=#0xff200020
mov r1,#0b01

display:
str r1, [r0]
ror r1, #31
bl delay
b display
	
	
.end