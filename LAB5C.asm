DATA SEGMENT
    ARRAY1 DB 10,9,8,7,6,5,4,3,2,1  ; Initial array 1    
    ARRAY1_SIZE EQU $-ARRAY1 
DATA ENDS

EXTRA SEGMENT
    ARRAY2 DB 1,2,3,4,5,6,7,8,9,10  ; Initial array 2    
    ARRAY2_SIZE EQU $-ARRAY2
EXTRA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA, ES:EXTRA

_START:
    ; Initialize DS segment register to point to DATA segment
    MOV AX, DATA
    MOV DS, AX
    
    ; Initialize ES segment register to point to EXTRA segment
    MOV AX, EXTRA
    MOV ES, AX

    ; Set CX to the number of elements in ARRAY1 (ARRAY2 has the same size)
    MOV CX, ARRAY1_SIZE
    
    ; Initialize SI and DI to 0
    MOV SI, 0
    MOV DI, 0
	
SWAP_LOOP:
    ; Load element from ARRAY1 into AL
    MOV AL, [ARRAY1 + SI]
    
    ; Load element from ARRAY2 into BL using ES segment override
    MOV BL, ES:[DI]
    
    ; Store BL into ARRAY1
    MOV [ARRAY1 + SI], BL
    
    ; Store AL into ARRAY2 using ES segment override
    MOV ES:[DI], AL
    
    ; Increment SI and DI to move to the next element
    INC SI
    INC DI
    
    ; Loop until CX becomes zero
    LOOP SWAP_LOOP

    ; Exit program
    MOV AH, 4CH
    INT 21H

CODE ENDS
END _START
