@ ---------------------------------------------------------
@ Program: String Concatenation
@ Description:
@   Concatenate string1 and string2 into resultString.
@   Input strings are not modified.
@ ---------------------------------------------------------

.org 0x100

.data
string1:     .asciz "Hello World,"
string2:     .asciz " this is Assembly Language Programming"
resultString: .space 100            @ enough space for concatenated string

.text
.global _start
_start:
    ldr r0, =string1       @ r0 = pointer to string1 (source)
    ldr r1, =resultString  @ r1 = pointer to destination (result)

copy_string1:
    ldrb r2, [r0], #1      @ load byte from string1, post-increment r0
    strb r2, [r1], #1      @ store byte in resultString, post-increment r1
    cmp r2, #0             @ check if null terminator
    bne copy_string1       @ if not zero, keep copying

    ldr r0, =string2       @ r0 = pointer to string2 (source)

copy_string2:
    ldrb r2, [r0], #1      @ load byte from string2
    strb r2, [r1], #1      @ store byte in resultString
    cmp r2, #0             @ null terminator?
    bne copy_string2

done:
    b done                 @ infinite loop
