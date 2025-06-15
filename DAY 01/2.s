.org 0x1000
.data
a: .byte 3
b: .byte 4
c: .byte 5
.text
.global _start
_start:
ldr r0, = a
ldrb r1, [r0]

ldr r0, = b
ldrb r2, [r0]

ldr r0, = c
ldrb r3, [r0]

mul r4, r1,r1
mul r5, r2,r2
mul r6, r3,r3

add r7, r4, r5


cmp r6, r7
beq equal
mov r0, #2

@exit
mov r7, #1
swi 0


equal:
mov r0, #1
@exit
mov r7, #1
swi 0




.end	
	