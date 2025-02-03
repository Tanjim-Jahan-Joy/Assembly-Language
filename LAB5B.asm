DATA SEGMENT
    ARRAY DB 10,9,8,7,6,5,4,3,2,1  ; Initial unsorted array
    ARRAY_SIZE EQU $-ARRAY   
DATA ENDS
    
CODE SEGMENT
ASSUME CS:CODE, DS:DATA

_START:
    MOV AX, DATA
    MOV DS, AX                      ; Initialize DS segment register

    MOV CX, ARRAY_SIZE              ; CX = Number of elements in the array
OUTER_LOOP:
    DEC CX                          ; CX = CX - 1 (reduce the number of elements to consider)
    MOV SI, 0                       ; SI = 0 (start from the first element)
    MOV DI, 1                       ; DI = 1 (start from the second element)
    MOV BX, CX                      ; BX = CX (number of comparisons in this pass)
INNER_LOOP:
    MOV AL, [ARRAY + SI]            ; Load element at position SI into AL
    MOV BL, [ARRAY + DI]            ; Load element at position DI into BL
    CMP AL, BL                      ; Compare AL and BL
    JLE NO_SWAP                     ; If AL <= BL, no swap needed
    MOV [ARRAY + SI], BL            ; Swap elements: move BL to position SI
    MOV [ARRAY + DI], AL            ; Swap elements: move AL to position DI
NO_SWAP:
    INC SI                          ; Move to the next pair of elements
    INC DI                          ; Move to the next pair of elements
    DEC BX                          ; Decrement BX (number of comparisons left)
    JNZ INNER_LOOP                  ; If BX is not zero, continue the inner loop

    CMP CX, 1                       ; Check if only one element is left
    JG OUTER_LOOP                   ; If more than one element, continue the outer loop

    MOV AH, 4CH                     ; AH = 4CH is the DOS exit function
    INT 21H                         ; Call DOS

CODE ENDS
END _START
