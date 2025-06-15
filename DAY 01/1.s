.org 0x1000
.data
x: .byte 2
.text
.global _start
_start:
ldr r0, = x
ldrb r1, [r0]
mul r2, r1,r1 @r2 = x^2
mul r3, r2,r1 @r3 = x^3
mov r10, #4
mov r11, #5
mov r12, #2
mul r4, r3, r10 @r4 = 4x^3
mul r5 , r2, r11 @r5 = 5x^2
mul r6, r1, r12 @ r6 = 2x
add r7, r4, r5 @ r7 = 4x^3+5x^2
add r8, r7, #1 @ r8 = 4x^3+5x^2+1
sub r9, r8, r6 @r9 = 4x^3+5x^2+1 - 2x
.end	
	