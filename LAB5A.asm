DATA SEGMENT
    ARRAY DB 1,2,3,4,5,6,7,8,9,10
    ARRAY_SIZE EQU $-ARRAY   
DATA ENDS
    
CODE SEGMENT
ASSUME CS:CODE, DS:DATA

_START:
    MOV AX, DATA
    MOV DS, AX                  ; Initialize DS segment register

    MOV SI, 0                   ; SI = Source index (start of the array)
    MOV DI, ARRAY_SIZE - 1      ; DI = Destination index (end of the array)
    MOV CX, ARRAY_SIZE / 2      ; CX = Number of iterations (half of the array size)

REVERSE_LOOP:
    MOV AL, [ARRAY + SI]        ; Load element from the beginning
    MOV BL, [ARRAY + DI]        ; Load element from the end
    MOV [ARRAY + SI], BL        ; Swap them
    MOV [ARRAY + DI], AL        ; Swap them

    INC SI                      ; Move source index forward
    DEC DI                      ; Move destination index backward
    LOOP REVERSE_LOOP           ; Repeat until CX becomes zero

    MOV AH, 4CH                 ; AH = 4CH is the DOS exit function
    INT 21H                     ; Call DOS

CODE ENDS
END _START
