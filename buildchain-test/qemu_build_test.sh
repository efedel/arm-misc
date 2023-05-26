#!/bin/sh

# Packages
# 64-bit
# binutils-aarch64-linux-gnu
# gcc-aarch64-linux-gnu 
# 32-bir
# binutils-arm-linux-gnueabihf 
# binutils-arm-linux-gnueabi 
# gcc-arm-linux-gnueabihf 
# gcc-arm-linux-gnueabi 
# C++
# g++-arm-linux-gnueabi  
# g++-arm-linux-gnueabihf
# Go
# gccgo-arm-linux-gnueabi 
# gccgo-arm-linux-gnueabihf 
# QEMU
# qemu-user qemu-user-static

# 64-bit
# C
aarch64-linux-gnu-gcc -static -o test64_c_quemu_static test64.c
aarch64-linux-gnu-gcc -o test64_c_quemu_dynamic test64.c
echo 'Test run (64 C):'
qemu-aarch64 -L /usr/aarch64-linux-gnu ./test64_c_quemu_dynamic

# ASM
aarch64-linux-gnu-as test64.s -o test64_asm.o
aarch64-linux-gnu-ld test64_asm.o --static -o test64_asm_quemu_static 
aarch64-linux-gnu-ld test64_asm.o -o test64_asm_quemu_dynamic 
echo 'Test run (64 ASM):'
qemu-aarch64 -L /usr/aarch64-linux-gnu ./test64_asm_quemu_dynamic

# 32-bit
# C
arm-linux-gnueabihf-gcc -static -o test32_c_quemu_static test32.c
arm-linux-gnueabihf-gcc -o test32_c_quemu_dynamic test32.c
echo 'Test run (32 C):'
qemu-arm -L /usr/arm-linux-gnueabihf ./test32_c_quemu_dynamic
# ASM
arm-linux-gnueabihf-as test32.s -o test32_asm.o
arm-linux-gnueabihf-ld test32_asm.o --static -o test32_asm_quemu_static 
arm-linux-gnueabihf-ld test32_asm.o -o test32_asm_quemu_dynamic 
echo 'Test run (32 ASM):'
qemu-arm -L /usr/arm-linux-gnueabihf ./test32_asm_quemu_dynamic
