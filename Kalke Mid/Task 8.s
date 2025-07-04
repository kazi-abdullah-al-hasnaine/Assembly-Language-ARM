.org 0x1000
.data
String: .asciz "M3ye1t12!"
.text
.global _start 
_start:
mov r8, #0
mov r9, #0
ldr r0, =String

loop:
ldrb r1,[r0],#1

cmp r1, #0
BEQ exit

cmp r1, #'A'
BLT check_digit
cmp r1, #'Z'
BGT check_lower
b inc_char


check_digit:
cmp r1, #'0'
BLT loop
cmp r1, #'9'
BLE inc_digit
B loop

check_lower:
cmp r1, #'a'
blt loop
cmp r1, #'z'
bgt loop
b inc_char


inc_digit:
add r8,r8,#1
b loop

inc_char:
add r9,r9,#1
b loop

exit: 
swi 0




