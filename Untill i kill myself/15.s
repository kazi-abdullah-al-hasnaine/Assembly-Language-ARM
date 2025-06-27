.org 0x100

.data
matrix: .space 64        @ 4x4 = 16 integers × 4 bytes = 64 bytes

.text
.global _start

_start:
    ldr r0, =matrix       @ r0 = base address of matrix
    bl create_identity    @ call procedure to fill matrix

done:
    b done                @ infinite loop

@ --------------------------------------------------
@ Procedure: create_identity
@ Description: creates a 4x4 identity matrix at [r0]
@ Input: r0 = pointer to base of matrix
@ Output: matrix filled at r0
@ --------------------------------------------------
create_identity:
    mov r1, #0            @ row index i = 0

outer_loop:
    mov r2, #0            @ col index j = 0

inner_loop:
    mov r3, r1            @ copy row
    cmp r3, r2
    moveq r4, #1          @ if i == j → r4 = 1
    movne r4, #0          @ else → r4 = 0

    @ calculate offset: (i * 4 + j) * 4 = address offset in bytes
    mul r5, r1, #4        @ r5 = i * 4
    add r5, r5, r2        @ r5 = i*4 + j
    lsl r5, r5, #2        @ r5 = (i*4 + j)*4 (byte offset)

    str r4, [r0, r5]      @ store value (0 or 1) in matrix[i][j]

    add r2, r2, #1        @ j++
    cmp r2, #4
    blt inner_loop

    add r1, r1, #1        @ i++
    cmp r1, #4
    blt outer_loop

    bx lr                 @ return from procedure
