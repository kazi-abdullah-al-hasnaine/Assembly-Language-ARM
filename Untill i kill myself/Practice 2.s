@2. Write down an ASM program to check whether it’s positive or negative. If the number is
@ positive store 1 in r8 register, otherwise store 2 in r8 register
.org 0x100
.data

.text
.global _start
_start:

mov r0, #-5
mov r1, #0

cmp r1, r0 
BGE  is_negative

is_postive:
mov r8, #1
B end

is_negative:
mov r8, #2

end:
B end
	
	