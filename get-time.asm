; syscall constants
SYS_EXIT  equ 0x01
SYS_TIME  equ 0x0d

section .text
global  _start

_start:
    jmp get_time

get_time:
    mov eax, SYS_TIME     ; syscall number (sys_time)
    int 0x80              ; call kernel
    mov [epoch_time], eax ; epoch_time = eax

quit:
    mov eax, SYS_EXIT     ; syscall number (sys_exit)
    mov ebx, 0            ; return code
    int 0x80              ; call kernel

section     .data
    epoch_time dd 0