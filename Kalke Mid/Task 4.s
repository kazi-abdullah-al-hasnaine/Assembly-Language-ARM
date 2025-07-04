.org 0x1000
.data
arr: .byte 0,1,2,3,4,5,6,7,8,9
.text
.global _start

_start:
mov r12, #0 
ldr r0, =arr

loop1:
mov r11, #0
cmp r12, #10
BEQ exit
ldrb r1,[r0]

ldr r5, =arr

loop2:
cmp r11, #10
BEQ done
ldrb r2,[r5]

cmp r1, r2
BLT isMin
mov r10, r2
add r5, r5, #1
add r11, r11, #1
b loop2


isMin:
add r5, r5, #1
add r11, r11, #1
cmp r1,r9
BGT loop2
mov r9, r1
b loop2

done:
add r0, r0, #1
add r12, r12, #1
b loop1

exit:
b exit



	
	