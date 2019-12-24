; syscall constants
SYS_EXIT  equ 0x01
SYS_CLOSE equ 0x06
SYS_OPEN  equ 0x05
SYS_WRITE equ 0x04

; file mode constants
O_CREAT   dw 0100
O_RDWR    dw 02
FILE_PERM dw 0777

section .text
global  _start

    _start:

    open_file:
        mov edx, [FILE_PERM] ; permissions = 777
        mov ecx, [O_CREAT]   ; ecx is o_creat
        or ecx, O_RDWR       ;     OR o_rdwr
        mov ebx, path        ; file path to open / create
        mov eax, SYS_OPEN    ; syscall number (sys_open)
        int 0x80             ; call kernel
        mov [fd_out], eax    ; capture file descriptor

    write_file:
        mov edx, len         ; length to write
        mov ecx, message     ; message to write
        mov ebx, [fd_out]    ; file descriptor
        mov eax, SYS_WRITE   ; syscall number (sys_write)
        int 0x80             ; call kernel

    close_file:
        mov ebx, [fd_out]    ; file descriptor
        mov eax, SYS_CLOSE   ; syscall number (sys_close)
        int 0x80             ; call kernel

    quit:
        mov eax, SYS_EXIT   ; syscall number (sys_exit)
        mov ebx, 0          ; return code
        int 0x80            ; call kernel

section     .data
    path    dw './create-file/write-file.txt',0x0
    message db 'Test message to write to file!'
    len     equ $ - message

section     .bss
    fd_out  resd 1