.org 0x100

.data
inputString:  .asciz "Final Assignment"
upperString:  .space 50
lowerString:  .space 50

.text
.global _start

@ Macro to convert to uppercase (only if lowercase)
.macro TO_UPPER charReg
    cmp \charReg, #'a'
    blt .LskipUpper\@
    cmp \charReg, #'z'
    bgt .LskipUpper\@
    sub \charReg, \charReg, #32
.LskipUpper\@:
.endm

@ Macro to convert to lowercase (only if uppercase)
.macro TO_LOWER charReg
    cmp \charReg, #'A'
    blt .LskipLower\@
    cmp \charReg, #'Z'
    bgt .LskipLower\@
    add \charReg, \charReg, #32
.LskipLower\@:
.endm

_start:
    ldr r0, =inputString      @ r0 = input string pointer
    ldr r1, =upperString      @ r1 = uppercase buffer pointer
    ldr r2, =lowerString      @ r2 = lowercase buffer pointer

loop:
    ldrb r3, [r0], #1         @ load char and increment pointer
    cmp r3, #0
    beq done

    mov r4, r3
    mov r5, r3

    TO_UPPER r4               @ convert r4 to uppercase if applicable
    TO_LOWER r5               @ convert r5 to lowercase if applicable

    strb r4, [r1], #1         @ store uppercase char
    strb r5, [r2], #1         @ store lowercase char

    b loop

done:
    mov r3, #0
    strb r3, [r1]             @ null terminate uppercase string
    strb r3, [r2]             @ null terminate lowercase string

    b done                    @ infinite loop
