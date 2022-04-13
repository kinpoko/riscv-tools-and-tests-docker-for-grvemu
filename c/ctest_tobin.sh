#!/bin/bash

cd `dirname $0`

riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -c -o ctest.o ctest.c
riscv64-unknown-elf-ld -b elf32-littleriscv ctest.o -T link.ld -o ctest
riscv64-unknown-elf-objcopy -O binary ctest ctest.bin
riscv64-unknown-elf-objdump -b elf32-littleriscv -D ctest > ctest.elf.dmp
