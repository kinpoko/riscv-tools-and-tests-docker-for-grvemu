#!/bin/bash

cd `dirname $0`
SCRIPT_DIR=$(pwd)
RESULT_DIR=../results

UI_INST=(sw lw add addi sub and andi or ori xor xori sll srl sra slli srli srai slt sltu slti sltiu beq bne blt bge bltu jal jalr lui auipc)
MI_INST=(csr scall)

for INST in ${UI_INST[@]}
do
	grvemu rv32ui-p-$INST.bin -d -t -e 0xff9ff06f > $RESULT_DIR/$INST.txt
	if [ `tail $RESULT_DIR/$INST.txt -c2` = "1" ]; then
		echo "PASS $INST"
	else
		echo "FAIL $INST"
	fi
done

for INST in ${MI_INST[@]}
do
	grvemu rv32mi-p-$INST.bin -d -t -e 0xff9ff06f > $RESULT_DIR/$INST.txt
	if [ `tail $RESULT_DIR/$INST.txt -c2` = "1" ]; then
		echo "PASS $INST"
	else
		echo "FAIL $INST"
	fi
done
