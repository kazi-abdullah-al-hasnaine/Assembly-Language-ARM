.org 0x1000
.data
seven_seg_patterns: .word 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x0
.text
.global _start

delay:
ldr r12, =#0x500000
delay_loop:
subs r12, r12, #1
bne delay_loop
bx lr


_start:

ldr r0,=#0xff200020 @7 segment
ldr r1, =seven_seg_patterns

loop:
ldr r2, [r1], #4
cmp r2, #0 @last value 0
beq end

str r2, [r0]
bl delay @delay procedure
b loop


end: 
mov r7, #1
swi 0