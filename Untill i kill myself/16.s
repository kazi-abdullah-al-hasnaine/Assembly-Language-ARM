.org 0x100

.data
matrix: .word 1, 2, 3,     \
              4, 5, 6,     \
              7, 8, 9,     \
              10,11,12     @ 4x3 matrix (4 rows, 3 cols)

transpose: .space 48       @ 3x4 = 12 integers × 4 bytes

.text
.global _start
_start:
    ldr r0, =matrix        @ r0 = source matrix base
    ldr r1, =transpose     @ r1 = destination (transpose) base

    mov r2, #0             @ r2 = row index i (0..3)
row_loop:
    mov r3, #0             @ r3 = column index j (0..2)
col_loop:
    @ calculate source offset: (i * 3 + j) * 4
    mul r4, r2, #3         @ r4 = i * 3
    add r4, r4, r3         @ r4 = i*3 + j
    lsl r4, r4, #2         @ r4 = byte offset
    ldr r5, [r0, r4]       @ r5 = matrix[i][j]

    @ calculate destination offset: (j * 4 + i) * 4
    mul r6, r3, #4         @ r6 = j * 4
    add r6, r6, r2         @ r6 = j*4 + i
    lsl r6, r6, #2         @ r6 = byte offset
    str r5, [r1, r6]       @ transpose[j][i] = matrix[i][j]

    add r3, r3, #1         @ j++
    cmp r3, #3             @ cols = 3
    blt col_loop

    add r2, r2, #1         @ i++
    cmp r2, #4             @ rows = 4
    blt row_loop

done:
    b done                @ infinite loop
