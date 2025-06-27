.org 0x100
.data
a: .byte 5 @int a = 5
b: .space 5 @5 byte jayga rakhse
.equ k,6 @ const k=6
arr: .space 6 int arr[6];
.equ arr_len, .-arr
arr1: .word 1,2,3 
ch: .hword 'A'
str: .byte 'B,'C,'D,'0
str1: .asciz "Hello"


.text
.global _start
_start:

.end	
	