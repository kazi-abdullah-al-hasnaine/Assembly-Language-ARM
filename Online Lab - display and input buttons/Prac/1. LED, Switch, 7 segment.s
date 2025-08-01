.org 0x1000
.data
.text
.global _start
_start:

ldr r3,=0xff200040
ldr r1,[r3]


ldr r0, =0xff200000 @address of leds
str r1, [r0]



ldr r0, =0xff200020 @first segment
str r1, [r0]




ldr r0, =0xff200030 @second segment
str r1, [r0]