bits 16 ; on lui dit que toutes les donnes seront en 16 bits
org 0x7c00 ; on definie l'adresse de depart de notr  programme

mov si, 0 ; on clear notre registre si

jmp main ; on saute au main (short veut dire que la valeur se trouve dans les 128 prochaines bits)

print: ; procedure pour afficher une valeur

    mov ah, 0x0e ; 0x0e == 13h
    mov al, [hello + si] ; on met la valeur de notre lettre dans le registre
    int 0x10 ; interruption 10h et 13h dans ah veut dire qu'on ecrit une lettre
    add si, 1 ; on ajoute 1 a si
    cmp byte [hello + si], 0 ; on compare 0 et la lettre qui va etre affichee
    jne print ; si le flag de comparaison n'est pas set on continue l'iteration
    je retprint

hello: db "Hello, World !",  0 ; on met a 0 la fin

main:
    ; on push les valeurs de si et ax dans le stack
    push si 
    push ax
    call print ; on saute a la fonction print

retprint:
    ; on recupere les valeurs de ax et si
    pop ax 
    pop si
    ret ; on retourne de la procedure

times 510 - ($ - $$) db 0 ; on repete 510 - la taille de notre programme fois la creation de valeur 0 pour avoir un bootloader de 512 bytes
dw 0xAA55 ; ce dernier byte sera toujours le meme