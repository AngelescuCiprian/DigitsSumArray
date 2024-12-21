.model small
stack 100h
.data
    array db 5 dup(?)
        len=($-array)
    msj1 db 'Enter 5 digits',10,13,'$'
    msj2 db 10,13,'You have entred',10,13,'$'
    msj3 db 10,13,'Sum of the digits you have entred is',10,13,'$'
.code
    start:
        mov ax,@data
        mov ds,ax
        mesaj MACRO msj
            mov ah,09h
            lea dx,msj
            int 21h
        ENDM
    mesaj msj1
    mov cx,len
    lea di,array
    for1:
        mov ah,01h
        int 21h
        mov [di],al
        inc di
        ;carriage return
        mov ah,02h
        mov dl,10 
        int 21h
        mov dl,13 
        int 21h
    loop for1
    mesaj msj2
    lea si,array
    mov cx,len
    for2:
        mov ah,02h
        mov dl,[si]
        int 21h
        inc si
        ;carriage return
        mov ah,02h
        mov dl,10 
        int 21h
        mov dl,13 
        int 21h
    loop for2
    ;Sum of the 5 digits
    mov cx,len
    xor bx,bx
    lea si,array
    mesaj msj3
    sum:
        sub [si],48
        add bl,[si]
        inc si 
    loop sum
    mov ax,bx
    xor cx,cx 
    mov bx,10
    descompunere:
        xor dx,dx 
        div bx 
        push dx
        inc cx 
        cmp ax,0 
            je afisare 
        jmp descompunere
    
    afisare:
        pop dx 
        add dx,48
        mov ah,02h
        int 21h
    loop afisare
    mov ah,4ch
    int 21h
    end start