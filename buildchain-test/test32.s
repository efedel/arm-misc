.section .text
.global _start

_start:
    mov r0, #1    ;/* STDOUT */
    ldr r1, =str  ;/* &str  */
    ldr r2, =len  ;/* len */
    mov r7, #4    ;/* syscall 4: write */
    svc #0
    mov r0, #0    ;/* 0 (success) */
    mov r7, #1    ;/* syscall 1: exit */
    svc #0

str:
.ascii "ARM32\n"
len = . - str
