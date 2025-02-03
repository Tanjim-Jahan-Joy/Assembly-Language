.MODEL SMALL  
.CODE
MAIN PROC
            MOV AH,2
            MOV DL,'?'
            INT 21H
            
            MOV AH,1
            INT 21H
            MOV BL,AL
            INT 21H
            
            CMP BL, AL
            JG SWITCH
            JMP DISPLAY
            
SWITCH:     XCHG AL,BL
DISPLAY:
            MOV AH,2
            MOV DL,0AH
            INT 21H
            MOV DL,BL
            INT 21H
            MOV DL,AL
            INT 21H
            
OUT_:       MOV AH,4CH
            INT 21H
            
MAIN ENDP
END MAIN