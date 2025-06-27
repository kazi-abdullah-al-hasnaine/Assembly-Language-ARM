@ ---------------------------------------------------
@ Program: Find Minimum and Maximum in an Array
@ Description: This program finds the minimum and
@              maximum value from a 10-element array.
@ Output:
@   r8 = minimum value
@   r9 = maximum value
@ ---------------------------------------------------

.org 0x100

.data
array: .word 10, 22, -5, 47, 0, 15, -20, 88, 9, 33  @ 10 signed integers

.text
.global _start
_start:
    ldr r0, =array        @ r0 points to the base of the array
    ldr r1, [r0], #4      @ r1 = first element, increment pointer
    mov r8, r1            @ r8 = min = first element
    mov r9, r1            @ r9 = max = first element
    mov r2, #9            @ r2 = loop counter (remaining 9 elements)

loop:
    ldr r3, [r0], #4      @ Load next array element into r3

    cmp r3, r8            @ Compare current value with min
    blt update_min        @ If r3 < r8, update min

    cmp r3, r9            @ Compare current value with max
    bgt update_max        @ If r3 > r9, update max

    b next                @ Skip to next loop iteration

update_min:
    mov r8, r3            @ Update min value
    b next

update_max:
    mov r9, r3            @ Update max value

next:
    subs r2, r2, #1       @ Decrement loop counter
    bne loop              @ If not zero, repeat loop

end:
    b end                 @ Infinite loop (end of program)
