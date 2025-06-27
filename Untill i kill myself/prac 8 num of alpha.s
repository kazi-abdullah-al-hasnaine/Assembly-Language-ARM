@ ---------------------------------------------------------
@ Program: Count Alphabets and Digits in a String
@ Description: Counts total number of alphabets and digits
@              in a null-terminated string.
@ Output:
@   r8 = alphabet count
@   r9 = digit count
@ ---------------------------------------------------------

.org 0x100

.data
myString: .asciz "Hello1234World!2024"   @ sample input string

.text
.global _start
_start:
    ldr r0, =myString      @ r0 = pointer to string
    mov r8, #0             @ r8 = alphabet counter
    mov r9, #0             @ r9 = digit counter

scan_loop:
    ldrb r1, [r0], #1      @ load next byte from string and post-increment pointer
    cmp r1, #0             @ check for null terminator
    beq end                @ if null, end loop

    @ Check if it's an uppercase letter (A–Z)
    cmp r1, #'A'
    blt check_digit        @ if < 'A', not a letter
    cmp r1, #'Z'
    ble is_alpha           @ if ≤ 'Z', it's an uppercase letter

    @ Check if it's a lowercase letter (a–z)
    cmp r1, #'a'
    blt check_digit
    cmp r1, #'z'
    ble is_alpha           @ if ≤ 'z', it's a lowercase letter

check_digit:
    cmp r1, #'0'
    blt scan_loop          @ if < '0', skip
    cmp r1, #'9'
    bgt scan_loop          @ if > '9', skip
    add r9, r9, #1         @ it's a digit
    b scan_loop

is_alpha:
    add r8, r8, #1         @ it's an alphabet
    b scan_loop

end:
    b end                  @ Infinite loop (done)
