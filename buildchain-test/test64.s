.section .text
.global _start

_start:
    mov x0, #1    ;/* STDOUT */
    ldr x1, =str  ;/* &str  */
    ldr x2, =len  ;/* len */
    mov w8, #64   ;/* syscall 64: write */
    svc #0
    mov x0, #0    ;/* 0 (success) */
    mov w8, #93   ;/* syscall 93: exit */
    svc #0

str:
.ascii "ARM64\n"
len = . - str
