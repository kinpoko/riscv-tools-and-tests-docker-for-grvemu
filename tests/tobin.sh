#!/bin/bash

cd `dirname $0`
SCRIPT_DIR=$(pwd)

FILES=../target/share/riscv-tests/isa/rv32*i-p-*
SAVE_DIR=$SCRIPT_DIR

for f in $FILES
do
	FILE_NAME="${f##*/}"
	if [[ ! $f =~ "dump" ]]; then 
	riscv64-unknown-elf-objcopy -O binary $f $SAVE_DIR/$FILE_NAME.bin
	fi
done