.org 0x1000
.data
.text
.global _start
_start:

mov r0, #0
mov r1, #1
mov r12, #2 @counter

loop:
add r2, r1, r0
mov r0, r1
mov r1, r2
add r12, r12, #1
cmp r12, #23
BLE loop
b exit


exit:
swi 0



	
	