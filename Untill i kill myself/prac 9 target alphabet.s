@ ---------------------------------------------------------
@ Program: Search for Character in a String
@ Description:
@   - Searches for a character in a null-terminated string
@   - Stores the index of the first match in r8
@   - If not found, r9 = 1
@ ---------------------------------------------------------

.org 0x100

.data
myString: .asciz "HelloWorld2024"
targetChar: .byte 'o'         @ character to search for

.text
.global _start
_start:
    ldr r0, =myString         @ r0 = pointer to string
    ldrb r1, =targetChar      @ r1 = target character
    mov r2, #0                @ r2 = index counter
    mov r9, #0                @ r9 = flag for found (default = 0)

search_loop:
    ldrb r3, [r0], #1         @ load current character from string
    cmp r3, #0
    beq not_found             @ if null terminator reached, not found

    cmp r3, r1
    beq found                 @ if match, go to found

    add r2, r2, #1            @ increment index
    b search_loop

found:
    mov r8, r2                @ store found index in r8
    mov r9, #0                @ found, so set r9 to 0 (optional)
    b end_program

not_found:
    mov r9, #1                @ not found, so r9 = 1

end_program:
    b end_program             @ infinite loop to stop
