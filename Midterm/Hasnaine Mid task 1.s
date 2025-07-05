.org 0x1000
.data
string_1: .asciz "Hello"
isZero: .byte 0
string_2: .asciz "Hellow"
outputString: .space 200 @enough 
.text
.global _start
_start:
ldr r0, =string_1
ldr r1, =string_2
ldr r2, =outputString

loop: 
ldrb r3, [r0],#1
cmp r3, #0
BEQ check_str_2
ldrb r4, [r1], #1
cmp r3, r4
BNE lexi_check
b loop

check_str_2:
ldrb r4, [r1], #1
cmp r4, #0
BEQ put_Same
b lexi_check

put_Same:
mov r8, #0 @end of the string e rakhbo taai
mov r9, #'S'
mov r10, #'a'
mov r11, #'m'
mov r12, #'e'

strb r9, [r2], #1
strb r10, [r2], #1
strb r11, [r2], #1
strb r12, [r2], #1
strb r8, [r2], #1
b exit

lexi_check:
cmp r3, r4
BGT store_str_1
b store_str_2

store_str_1:
ldr r0, =string_1
ldr r1, =outputString
loop_str_1:
ldrb r2, [r0], #1
cmp r2, #0
BEQ exit
strb r2, [r1]
add r1,r1, #1 @alada karon eksathe support korena store er time e 
b loop_str_1

store_str_2:
ldr r0, =string_2
ldr r1, =outputString
loop_str_2:
ldrb r2, [r0], #1
cmp r2, #0
BEQ exit
strb r2, [r1]
add r1,r1, #1 @alada karon eksathe support korena store er time e 
b loop_str_2



exit:
mov r7, #1
swi 0
	