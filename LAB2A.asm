.model small
.stack 100h

.data
    num1 db 5
    num2 db 13
    num3 db 7
    min_num db ?
    max_num db ?

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Load the numbers into registers
    mov al, num1
    mov bl, num2
    mov cl, num3

    ; Assume num1 is both minimum and maximum initially
    mov min_num, al
    mov max_num, al

    ; Compare with num2
    cmp bl, min_num
    jge check_max
    mov min_num, bl
    check_max:
    cmp bl, max_num
    jle end_cmp2
    mov max_num, bl
end_cmp2:
    
    ; Compare with num3
    cmp cl, min_num
    jge check_max2
    mov min_num, cl
check_max2:
    cmp cl, max_num
    jle end_cmp3
    mov max_num, cl
end_cmp3:

    ; Move min_num and max_num into registers
    mov al, min_num
    mov bl, max_num

    ; You can use the values in al and bl as needed
    mov ax, 4c00h
    int 21h

main endp

end main