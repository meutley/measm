; syscall constants
SYS_EXIT  equ 0x01
SYS_WRITE equ 0x04

; file descriptors
FD_STDOUT equ 0x01

section .text
global  _start

    _start:
        mov ecx, message   ; set ecx = start of message

    _printnext:
        mov edx, 1         ; length (one character)
        mov ebx, FD_STDOUT ; file descriptor stdout
        mov eax, SYS_WRITE ; syscall number (sys_write)
        int 0x80           ; call kernel

    _checknext:
        inc ecx            ; increment ecx
        cmp [ecx], byte 0  ; check if [ecx] is zero
        jne _printnext     ; go to _printnext if [ecx] is not zero (end of string)

    quit:
        mov eax, SYS_EXIT  ; syscall number (sys_exit)
        mov ebx, 0         ; return code
        int 0x80           ; call kernel

section .data
    message dw 'Printing a message one character at a time...',0xa