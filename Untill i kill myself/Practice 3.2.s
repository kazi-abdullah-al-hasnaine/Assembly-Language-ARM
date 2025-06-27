@ ---------------------------------------------
@ Program: Fibonacci Number Generator (First 10)
@ Description: This program calculates the first
@              10 Fibonacci numbers using a loop
@              and a subroutine.
@ Target: ARMv7-A (Cortex-A9)
@ ---------------------------------------------

.org 0x100              @ Set code start address

.data
fibonacci: .space 40    @ Reserve 40 bytes for 10 Fibonacci numbers (4 bytes each)

.text
.global _start
_start:
    ldr r0, =fibonacci   @ r0 = base address of the fibonacci array
    mov r1, #0           @ r1 = first Fibonacci number (0)
    mov r2, #1           @ r2 = second Fibonacci number (1)
    mov r3, #8           @ r3 = loop counter (already stored first 2, need 8 more)

    str r1, [r0], #4     @ Store 0 at [r0], then r0 += 4
    str r2, [r0], #4     @ Store 1 at [r0], then r0 += 4

loop:
    BL fibonacci_next    @ Call subroutine to compute next Fibonacci number
    str r4, [r0], #4     @ Store the result (r4) into array, then r0 += 4
    subs r3, r3, #1      @ Decrement loop counter
    cmp r3, #0           @ Compare counter with 0
    BGE loop             @ If r3 >= 0, continue loop

end:
    B end                @ Infinite loop to stop program

@ ---------------------------------------------
@ Subroutine: fibonacci_next
@ Description: Computes next Fibonacci number
@ Input:  r1 = previous number
@         r2 = current number
@ Output: r4 = next number (r1 + r2)
@         Also updates r1 and r2 for next use
@ ---------------------------------------------
fibonacci_next:
    push {r4}            @ Save r4 on the stack (callee-saved)
    add r4, r1, r2       @ r4 = r1 + r2 (next Fibonacci number)
    mov r1, r2           @ Update r1 to previous current value
    mov r2, r4           @ Update r2 to new value
    pop {r4}             @ Restore r4 from the stack
    BX lr                @ Return to caller
