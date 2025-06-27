@ ---------------------------------------------------------
@ Program: Palindrome Checker
@ Description:
@   - Checks if input string is palindrome
@   - Input string is null-terminated
@   - r8 = 1 if palindrome ("Yes")
@   - r8 = 0 if not palindrome ("No")
@ ---------------------------------------------------------

.org 0x100

.data
inputString: .asciz "racecar"      @ change this string to test other words

.text
.global _start
_start:
    ldr r0, =inputString      @ r0 = pointer to start of string

    @ Find string length
    mov r1, r0                @ r1 = pointer used for length calculation
    mov r2, #0                @ length counter

strlen_loop:
    ldrb r3, [r1], #1
    cmp r3, #0
    beq strlen_done
    add r2, r2, #1
    b strlen_loop

strlen_done:
    cmp r2, #0
    beq palindrome_yes        @ empty string is palindrome

    sub r2, r2, #1           @ r2 = index of last character (length-1)
    mov r4, #0               @ r4 = start index

check_loop:
    cmp r4, r2
    bge palindrome_yes       @ checked all pairs

    ldrb r5, [r0, r4]        @ char at start index
    ldrb r6, [r0, r2]        @ char at end index

    cmp r5, r6
    bne palindrome_no        @ mismatch found, not palindrome

    add r4, r4, #1           @ start++
    sub r2, r2, #1           @ end--
    b check_loop

palindrome_yes:
    mov r8, #1               @ palindrome found
    b end

palindrome_no:
    mov r8, #0               @ not palindrome

end:
    b end                    @ infinite loop
