bits 16
org 0x7c00

;
;   specification pour FAT de base BPB
;
FatVersionName:             db "mkfs.fat" ; on specifie le nom de la version de FAT utilisee
BytesPerSectors:            dw 512 ; bytes par cluster
SectorsPerCluster:          db 1 ; secteurs par cluster
ReservedSectors:            dw 1
FileAllocationTables:       db 2
RooEntries:                 dw 224
TotalSectors:               dw 2880
Media:                      db 0xF0
FATSize:                    dw 9
SectorsPerTrack:            dw 18 ; nombre de secteur par piste
NumHeads:                   dw 2
HiddenSectors:              dd 0
TotalLargeSectors:          dd 0 ; param non utiliser par fat12

;
; specification supp pour FAT12 EBPB
;
DriveNumber:                db 0x00
Flag:                       db 0
Signature:                  db 0x29
VolumeID:                   dd 0
VolumeLabel:                db "FATFILESYS "
SystemIdentifier:           db "FAT12   "

start:
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
    db "Hello, World!",  0 ; on met a 0 la fin

times 510 - ($ - $$) db 0
dw 0xAA55