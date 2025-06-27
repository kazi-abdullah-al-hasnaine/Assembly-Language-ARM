@ ---------------------------------------------------------
@ Program: Frequency of Marks Distribution (0–10)
@ Description: Counts how many times each mark (0–10)
@              appears in a 20-element array of student marks.
@ ---------------------------------------------------------

.org 0x100

.data
marksArray:      .byte 7, 6, 5, 4, 7, 6, 6, 8, 3, 10,0, 1, 2, 3, 4, 5, 6, 7, 8, 10    @ 20 marks

frequencyArray:  .space 44        @ 11 bytes (0–10) frequencies, aligned to word size

.text
.global _start
_start:
    ldr r0, =marksArray        @ r0 points to start of marks array
    ldr r1, =frequencyArray    @ r1 points to frequency array
    mov r2, #20                @ r2 = loop counter for 20 students

loop:
    ldrb r3, [r0], #1          @ Load one byte (mark) from marksArray
    mov r4, r3                 @ r4 = mark (index into frequency array)
    add r5, r1, r4             @ r5 = address of frequencyArray[mark]
    ldrb r6, [r5]              @ load current frequency count
    add r6, r6, #1             @ increment frequency
    strb r6, [r5]              @ store it back
    subs r2, r2, #1            @ decrement student count
    bne loop                   @ if not zero, continue

end:
    b end                      @ Infinite loop to halt
