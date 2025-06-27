@ ---------------------------------------------------------
@ Program: Add Two Arrays
@ Description: Adds elements of Array1 and Array2,
@              stores the result in SumArray.
@ ---------------------------------------------------------

.org 0x100

.data
array1:     .word 1, 2, 3, 4, 5
array2:     .word 6, 4, 5, 1, 4
sumArray:   .space 20             @ 5 elements × 4 bytes = 20 bytes

.text
.global _start
_start:
    ldr r0, =array1        @ r0 = pointer to array1
    ldr r1, =array2        @ r1 = pointer to array2
    ldr r2, =sumArray      @ r2 = pointer to sumArray
    mov r3, #5             @ r3 = loop counter (5 elements)

loop:
    ldr r4, [r0], #4       @ Load array1[i], increment pointer
    ldr r5, [r1], #4       @ Load array2[i], increment pointer
    add r6, r4, r5         @ r6 = array1[i] + array2[i]
    str r6, [r2], #4       @ Store sum into sumArray[i]
    subs r3, r3, #1        @ Decrement counter
    bne loop               @ Repeat if not zero

end:
    b end                  @ Infinite loop to stop
