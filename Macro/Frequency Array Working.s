.org 0x1000
.data
input: .asciz "FinalAssignment"
freq: .word 0,0,0,0,0,0
.text

.macro vowel a
ldr r1,=freq

loop:
ldrb r2,[\a],#1
cmp r2, #0
BEQ end

cmp r2,#'a'
BEQ isA
cmp r2, #'A'
BEQ isA
cmp r2,#'e'
BEQ isE
cmp r2, #'E'
BEQ isE
cmp r2,#'i'
BEQ isI
cmp r2, #'I'
BEQ isI
cmp r2,#'o'
BEQ isO
cmp r2, #'O'
BEQ isO
cmp r2,#'u'
BEQ isU
cmp r2, #'U'
BEQ isU
b loop


isA:
ldr r8,[r1] 
add r8,r8,#1
str r8,[r1]
ldr r3,[r1] 
b loop

isE:
ldr r8,[r1,#4] 
add r8,r8,#1
str r8,[r1,#4]
ldr r4,[r1,#4] 
b loop

isI:
ldr r8,[r1,#8] 
add r8,r8,#1
str r8,[r1,#8]
ldr r5,[r1,#8] 
b loop

isO:
ldr r8,[r1,#12] 
add r8,r8,#1
str r8,[r1,#12]
ldr r6,[r1,#12] 
b loop
isU:
ldr r8,[r1,#16] 
add r8,r8,#1
str r8,[r1,#16]
ldr r7,[r1,#16] 
b loop

end: 
b end

.endm


.global _start
_start:
ldr r0, =input
vowel r0


	
	