bits 16

MOV AX, 0x7C0 ; The Bootloader resides in 0x7C00 address only
MOV DS, AX 

MOV AX, 0x7E0 ; The bootloader's size is 512bytes, so from 0x7C00 we need segment upto 0x7E00
MV SS, AX 

MV SP, 0x2000 ; making an 8k stack

clearscreen:
    PUSH BP
    MOV BP, SP
    PUSHA

    MOV AH, 0x07 ; tells BIOS to scroll down window
    MOV AL, 0X00 ; clear entire window
    MOV BH, 0x07 ; White on black
    MOV CX, 0x00 ; specifies top left of screen as (0, 0)
    MOV DH, 0x18 ; 18h = 24 rows of chars
    MOV DL, 0x4f ; 4fh = 79 cols of chars
    int 0x10     ; calls video interrupt

    POPA
    MOV SP, BP
    POP BP
    RET

movecursor:
    PUSH BP
    MOV BP, SP
    PUSHA

    MOV DX, [BP + 4] ; get the argument from the stack |BP| = 2, |arg| = 2
    MOV AH, 0x02     ; set cursor position
    MOV BH, 0x00     ; page 0 - doesn't matter, we're not using double - buffering
    INT 0x10 

    POPA
    MOV SP, BP
    POP BP
    RET
