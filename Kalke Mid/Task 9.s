.org 0x1000
.data
String: .asciz "M3ye1t12!"
target: .byte 'a'
.text
.global _start 
_start:

ldr r0, =String
ldr r1, =target
ldrb r3,[r1]
loop:
ldrb r2,[r0]
cmp r2,#0
BEQ not_found 
cmp r2,r3
BEQ same
add r0, r0, #1
b loop
same:
ldr r4, =String
sub r5, r0, r4
b exit
not_found:
mov r9, #1

exit:
swi 0






