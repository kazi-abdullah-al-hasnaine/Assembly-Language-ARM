.org 0x1000
.data
.text
.global _start
_start:
	mov r1, #0b1111
	
	
	
	ldr r0, =0xff200000
	str r1, [r0] 
	
	ldr r0, =0xff200020
	str r1, [r0]
	
	ldr r0, =0xff200030
	str r1, [r0]
	
	
	end:
	b end