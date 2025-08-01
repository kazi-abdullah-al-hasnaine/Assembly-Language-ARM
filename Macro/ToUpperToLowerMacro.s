.org 0x1000
.data
line: .asciz "Final Assignment0"
upper: .space 25
lower: .space 25
.text
.global _start
.macro ToUpper a
ldr r8,=upper
mov r10, \a
loop: 
ldrb r1,[\a],#1
cmp r1, #0
BEQ endm
cmp r1, #'A'
BLT asIs
BGT checkUpper

asIs:
strb r1,[r8], #1
b loop

isUpper:
strb r1,[r8], #1
b loop

checkUpper:
cmp r1, #'Z'
BLT isUpper
BGT checkLower

checkLower: 
cmp r1, #'a'
BLT asIs
BGT checkLTz

checkLTz:
cmp r1, #'z'
BGT asIs
BLT convertToLower

convertToLower:
sub r1, r1, #32
b asIs

endm:
ToLower r10
.endm

.macro ToLower a
    ldr r9, =lower
loop2: 
    ldrb r2, [\a], #1
    cmp r2, #0
    BEQ endmacro

    cmp r2, #'a'
    BLT lowerAsIs
    BGT checkLowUpper

lowerAsIs:
    strb r2, [r9], #1
    b loop2

isLowerUpper:
    strb r2, [r9], #1
    b loop2

checkLowUpper:
    cmp r2, #'z'
    BLT isLowerUpper
    BGT checkUpperCase

checkUpperCase:
    cmp r2, #'A'
    BLT lowerAsIs
    BGT checkUpZ

checkUpZ:
    cmp r2, #'Z'
    BGT lowerAsIs
    BLT convertToUpper

convertToUpper:
    add r2, r2, #32
    b lowerAsIs

endmacro:
.endm

_start:
	
	ldr r0, =line
	ToUpper r0
	