@ ---------------------------------------------------------
@ Program: Insert Space Before Punctuation (if needed)
@ Description:
@   - Adds space between a letter and a punctuation if
@     there is no space.
@   - Input string is null-terminated
@ ---------------------------------------------------------

.org 0x100

.data
inputString:  .asciz "A computer programmer,sometimes called more recently a coder,is a person who creates computer software."
outputString: .space 200         @ enough space for result (add spaces)
punctuations: .asciz ",.!?;"     @ punctuation set to check against

.text
.global _start
_start:
    ldr r0, =inputString         @ r0 = pointer to input string
    ldr r1, =outputString        @ r1 = pointer to output string

check_next:
    ldrb r2, [r0], #1            @ load input char into r2, increment pointer
    cmp r2, #0
    beq finish                   @ if null terminator, we're done

    strb r2, [r1], #1            @ write current character to output

    @ peek at the next character (r3)
    ldrb r3, [r0]                @ don't increment r0 here
    cmp r3, #0
    beq check_next               @ end of string, skip check

    @ Check: current is a letter (A-Z or a-z)
    cmp r2, #'A'
    blt check_next               @ skip if less than 'A'
    cmp r2, #'Z'
    ble maybe_insert             @ A-Z → check next

    cmp r2, #'a'
    blt check_next
    cmp r2, #'z'
    bgt check_next              @ not a letter

maybe_insert:
    @ check if r3 (next char) is punctuation
    ldr r4, =punctuations        @ r4 = base of punctuation list
punct_loop:
    ldrb r5, [r4], #1
    cmp r5, #0
    beq check_next               @ if end of punctuation list, skip

    cmp r3, r5
    beq insert_space             @ if match, insert space

    b punct_loop

insert_space:
    mov r6, #' '                 @ r6 = space
    strb r6, [r1], #1            @ insert space into output
    b check_next                 @ continue processing

finish:
    mov r6, #0
    strb r6, [r1]                @ null-terminate output string

    b finish                     @ infinite loop to halt
