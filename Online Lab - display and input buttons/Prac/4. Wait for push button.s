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
ldr r0,=seven_seg_patterns
ldr r1,=#0xff200020
ldr r3,=#0xff200050

loop:
wait:
ldr r5,[r3]
cmp r5, #1
BEQ wait

ldr r2, [r0], #4
cmp r2, #0
BEQ end
str r2,[r1]
bl delay
b loop


end: 
ldr r0,=seven_seg_patterns
b loop
