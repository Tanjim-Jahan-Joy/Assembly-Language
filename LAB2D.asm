.MODEL SMALL


.DATA 
STARS   DB 0AH,0DH, '**********$'

.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH,9
    LEA DX,STARS
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    

    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN