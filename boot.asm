bits 16

MOV AX, 0x7C0 ; The Bootloader resides in 0x7C00 address only
MOV DS, AX 

MOV AX, 0x7E0 ; The bootloader's size is 512bytes, so from 0x7C00 we need segment upto 0x7E00
MV SS, AX 

MV SP, 0x2000 ; making an 8k stack


