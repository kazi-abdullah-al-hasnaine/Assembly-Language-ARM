@ ---------------------------------------------------------
@ Program: Split Array by Index Parity (Even/Odd Indexes)
@ Description: Given an array of 10 elements, this program
@              splits even-indexed values to evenArray,
@              and odd-indexed values to oddArray.
@ ---------------------------------------------------------

.org 0x100

.data
inputArray:  .word 6, 3, 1, 4, 0, 8, 9, 2, 7, 5
evenArray:   .space 20      @ 5 elements × 4 bytes = 20 bytes
oddArray:    .space 20      @ 5 elements × 4 bytes = 20 bytes

.text
.global _start
_start:
    ldr r0, =inputArray     @ r0 points to input array
    ldr r1, =evenArray      @ r1 points to even-index array
    ldr r2, =oddArray       @ r2 points to odd-index array
    mov r3, #0              @ index counter (0 to 9)
    mov r4, #0              @ even index for evenArray
    mov r5, #0              @ odd index for oddArray

loop:
    cmp r3, #10             @ check if we've done 10 elements
    beq end_loop            @ exit loop if r3 == 10

    mov r6, r3
    lsl r6, r6, #2          @ r6 = r3 * 4 (offset in word array)
    ldr r7, =inputArray
    add r7, r7, r6          @ r7 = &inputArray[r3]
    ldr r8, [r7]            @ r8 = inputArray[r3]

    tst r3, #1              @ check if index is odd (r3 & 1)
    beq store_even          @ if even, go store in evenArray

store_odd:
    mov r9, r5
    lsl r9, r9, #2          @ r9 = odd array offset
    add r10, r2, r9         @ r10 = &oddArray[oddIndex]
    str r8, [r10]           @ store value
    add r5, r5, #1          @ oddIndex++
    b next

store_even:
    mov r9, r4
    lsl r9, r9, #2          @ r9 = even array offset
    add r10, r1, r9         @ r10 = &evenArray[evenIndex]
    str r8, [r10]           @ store value
    add r4, r4, #1          @ evenIndex++

next:
    add r3, r3, #1          @ index++
    b loop

end_loop:
    b end_loop              @ infinite loop (done)
