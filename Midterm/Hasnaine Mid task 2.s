@please switch to byte mode while checking for output
.org 0x1000 
.data
iden: .space 64
arr: .space 64
.text
.global _start
_start:
mov r9, #0 @pore store korbo tai
mov r10, #1 @pore store korbo taai 
BL procedure_1
b exit


procedure_1: @procedure
ldr r0,=arr 
mov r11, #1 @counter first loop

loop1:
cmp r11, #5@loop 1 end condition
BEQ exit
mov r12,#1 @counter loop 2
loop2:
cmp r12, #5 @loop 2 end condition
BEQ loop_2_done
cmp r11, r12 @row and col same hole 1 boshabo taai 
BEQ add_one
strb r9, [r0] @adding 0 cause row and col not same
add r0, r0, #1
add r12, r12, #1 @loop2 counter increment
b loop2

BX lr  @end of procedure


add_one: 
strb r10, [r0] 
add r0, r0, #1 
add r12, r12, #1 @loop2 counter increment
b loop2

loop_2_done:
add r11, r11, #1
b loop1

exit:
mov r7, #1
swi 0

	
	