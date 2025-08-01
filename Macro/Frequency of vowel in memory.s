.org 0x1000
.data
input: .asciz "FinalAssignment"
freq: .space 300
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
ldrb r8,[r1] 
add r8,r8,#1
strb r8,[r1]

b loop

isE:
ldrb r8,[r1,#1] 
add r8,r8,#1
strb r8,[r1,#1]

b loop

isI:
ldrb r8,[r1,#2] 
add r8,r8,#1
strb r8,[r1,#2]

b loop

isO:
ldrb r8,[r1,#3] 
add r8,r8,#1
strb r8,[r1,#3]

b loop
isU:
ldrb r8,[r1,#4] 
add r8,r8,#1
strb r8,[r1,#4]

b loop

end: 
swi 0

.endm


.global _start
_start:
ldr r0, =input
vowel r0


	
	