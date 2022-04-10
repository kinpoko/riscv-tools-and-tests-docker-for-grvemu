# riscv-tools-and-tests-docker-for-grvemu

## build

```bash
docker compose up -d --build
```

## get into container

```bash
docker exec -it riscv-tools-and-tests-docker-for-grvemu-riscv-tests-build-1 bash
```

## build riscv-tests for [grvemu](https://github.com/kinpoko/grvemu)

### edit link.ld at container

```bash
vim /opt/riscv/riscv-tests/env/p/link.ld
```

at SECTIONS
`0x80000000 -> 0x00000000`

### build riscv-tests

```bash
cd /opt/riscv/riscv-tests
autoconf
./configure --prefix=/target/
make
make install
```

### convert ELF to binary

```bash
./tests/tobin.sh
```

## compile c code

```bash
./c/ctest.sh
```

## test grvemu

### test riscv-test

```bash
./tests/riscv_tests.sh
```

### test c program

```bash
grvemu c/ctest.bin -d -e 0xc0001073
```
