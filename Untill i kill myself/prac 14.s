.org 0x100

.data
inputString: .asciz "Final Assignment"
vowelFreq:   .space 20      @ 5 vowels × 4 bytes = 20 bytes (int array)

.text
.global _start
_start:
    ldr r0, =inputString     @ r0 = pointer to string
    ldr r1, =vowelFreq       @ r1 = pointer to frequency array

loop:
    ldrb r2, [r0], #1        @ load character and increment
    cmp r2, #0
    beq done                 @ end of string

    @ Convert to lowercase if uppercase
    cmp r2, #'A'
    blt check_next
    cmp r2, #'Z'
    bgt check_vowel
    add r2, r2, #32          @ convert to lowercase

check_vowel:
    cmp r2, #'a'
    beq inc_a
    cmp r2, #'e'
    beq inc_e
    cmp r2, #'i'
    beq inc_i
    cmp r2, #'o'
    beq inc_o
    cmp r2, #'u'
    beq inc_u
    b loop

inc_a:
    ldr r3, [r1]             @ r3 = freq[0]
    add r3, r3, #1
    str r3, [r1]             @ store back
    b loop

inc_e:
    ldr r3, [r1, #4]         @ r3 = freq[1]
    add r3, r3, #1
    str r3, [r1, #4]
    b loop

inc_i:
    ldr r3, [r1, #8]         @ r3 = freq[2]
    add r3, r3, #1
    str r3, [r1, #8]
    b loop

inc_o:
    ldr r3, [r1, #12]        @ r3 = freq[3]
    add r3, r3, #1
    str r3, [r1, #12]
    b loop

inc_u:
    ldr r3, [r1, #16]        @ r3 = freq[4]
    add r3, r3, #1
    str r3, [r1, #16]
    b loop

check_next:
    b loop

done:
    b done                   @ infinite loop
