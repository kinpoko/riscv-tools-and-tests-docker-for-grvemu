FROM ubuntu:18.04

ENV RISCV=/opt/riscv
ENV PATH=$RISCV/bin:$PATH
ENV MAKEFLAGS=-j4
WORKDIR $RISCV

RUN apt update && \
	apt install -y autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev pkg-config git libusb-1.0-0-dev device-tree-compiler default-jdk gnupg vim 

RUN git clone -b rvv-0.9.x --single-branch https://github.com/riscv/riscv-gnu-toolchain.git && \
	cd riscv-gnu-toolchain && git checkout 5842fde8ee5bb3371643b60ed34906eff7a5fa31 && \
	git submodule update --init --recursive
RUN cd riscv-gnu-toolchain && mkdir build && cd build && ../configure --prefix=${RISCV} --enable-multilib && make

RUN git clone -b master --single-branch https://github.com/riscv/riscv-tests && \
	cd riscv-tests && git checkout c4217d88bce9f805a81f42e86ff56ed363931d69 && \
	git submodule update --init --recursive

