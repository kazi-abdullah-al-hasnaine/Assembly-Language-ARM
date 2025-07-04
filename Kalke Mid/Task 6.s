.org 0x1000
.data
arr1: .word 7,6,5,4,7,6,6,8,3,10
freq: .word 0,0,0,0,0,0,0,0,0,0,0

.text
.global _start
_start:

    ldr r0, =arr1      @ pointer to marks
    ldr r1, =freq      @ pointer to frequency
    mov r12, #0        @ loop counter for 10 students

loop:
    cmp r12, #10
    beq exit

    ldr r2, [r0], #4   @ load mark from arr1 and increment pointer
    mov r3, #4
    mul r3, r3, r2     @ r3 = mark * 4 (offset)
    add r4, r1, r3     @ r4 = &freq[mark]
    ldr r5, [r4]       @ load current frequency
    add r5, r5, #1     @ increment frequency
    str r5, [r4]       @ store it back

    add r12, r12, #1   @ next student
    b loop

exit:
    swi 0
