bits 16
org 0x7c00

mov si, 0

print:
    mov ah, 0x0e ; 0x0e == 13h
    mov al, [hello + si]
    int 0x10
    add si, 1
    cmp byte [hello + si], 0
    jne print

jmp $

hello:
    db "Hello, World !",  0 ; on met a 0 la fin

times 510 - ($ - $$) db 0
dw 0xAA55