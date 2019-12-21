# measm

A small collection of useless assembly language programs written in x86 assembly (`nasm`), targeting Linux (ELF).

## Getting Started

First, you need to create the `bin`, `obj` and `create-file` directories. The `create-file` directory needs to exist for the `create-file` program to run correctly.

```
mkdir ./bin && mkdir ./obj && mkdir ./create-file
```

## Shell Scripts

The shell scripts (`build`, `clean`, `debug` and `run`) exist to make building, debugging and executing the programs less tedious. When using these commands, with the exception of `clean.sh`, you need to specify an argument for the target program name (e.g. `create-file`). Otherwise, the scripts default to `main` and `main.asm` obviously doesn't exist - unless you add it, of course.

When running `debug.sh`, a second argument can be given to specify a different command file for gdb. This is the case with the `get-time` program in order to compare / see the resulting values.

----

### Example (using `create-time.asm`)

Run the following commands:

`./build.sh create-file` - This will assemble / compile and run the linker (`ld`), generating the executable binary in `./bin`
`./clean.sh` - This will clean existing files from `./bin` and `./obj`
`./debug.sh create-file` - This will run `./build.sh` then launch `gdb` with the initial commands specified in `.debug-cmds`
`./run.sh create-file` - This will run `./build.sh` then execute the binary located in the `./bin` folder

----

## Included Programs

### `create-file.asm`

This program makes a syscall to create a new (empty) file in a directory (`./create-file/new-file.txt`). That's all it does (for now).

### `get-time.asm`

This program makes a syscall to get the current time Unix epoch format. To test this program, run `./debug.sh get-time .debug-get-time`. gdb will execute then exit, and you should see the following near the end of the output:

```
$1 = {EAX_VALUE}
17	    mov eax, SYS_EXIT     ; syscall number (sys_exit)
$2 = {EPOCH_TIME_VALUE}
```

Where `{EAX_VALUE}` is the value of the `eax` register (the result of the syscall), and `{EPOCH_TIME_VALUE}` is the value of the `epoch_time` variable, which is copied from `eax`.

----

## Environment Info

1. Ubuntu 18.04.3 (64-bit)
2. 8GB RAM
3. Intel Core i5-7200U CPU (quad-core @ 2.50GHz)
4. nasm