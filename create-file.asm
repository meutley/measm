; syscall constants
SYS_EXIT  equ 0x01
SYS_CREAT equ 0x08

; file mode constants
S_IRUSR   dw 0400
S_IWUSR   dw 0200

section .text
global  _start

    _start:
        jmp create_file

    create_file:
        mov edx, S_IRUSR    ; edx is s_irusr
        or edx,  S_IWUSR    ;     OR s_iwusr
        mov ecx, edx        ; mode = s_irusr OR s_iwusr
        mov ebx, path       ; file path to create
        mov eax, SYS_CREAT  ; syscall number (sys_creat)
        int 0x80            ; call kernel

    quit:
        mov eax, SYS_EXIT   ; syscall number (sys_exit)
        mov ebx, 0          ; return code
        int 0x80            ; call kernel

section     .data
    path    dw './create-file/new-file.txt',0xa