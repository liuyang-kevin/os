org 7c00H
;; make data/code/extra segment the same
mov ax,cs
mov ds,ax
mov es,ax
lea bx,
mov esi,_STR2
mov edi,_STR
mov cx,_SLEN
cld
locallabel
cmp cx,0
je lconti
movsb
dec cx
jmp locallabel
lconti
mov cx,5
mov esi,_STR2
mov edi,_STR
rep movsw

call _DispStr
jmp $

;; function display string
_DispStr:
mov ah, 02h
mov bh, 0
mov dh, 4h
mov dl, 4h
int 10h
mov ax, _STR
mov bp, ax
mov cx, _SLEN
mov ax, 01301h
mov bx, 000ch
mov dl, 0
int 10h
ret

_STR: resb 64
_STR2 db "Hello World!",10,0
_SLEN equ $ - _STR2 
times   510-($-$$)   db  0
dw 0xaa55

