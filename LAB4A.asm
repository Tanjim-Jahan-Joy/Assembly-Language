.MODEL SMALL
.DATA
A DB 11H
B DB 10H
.CODE

    MOV AX,@DATA
    MOV DS, AX
    
    MOV AL, A
    MOV BL, B
    MOV AH, 0H  
    MOV DL, 4H
    
    AD:
        ADD AX, AX
        RCL BL, 01H
        JNC SKIP
        
        ADD AX, BX
        JMP L1
        
    SKIP:
        DEC DL          
        JNZ AD
        
        L1: 
        MOV CH, 4H
        MOV CL, 4H
        
        MOV BX, AX
        
        
    L:
        ROL BX, CL
        MOV DL, BL
        AND DL, OFH
        
        ADD DL, 30H                                                           
        
        MOV AH, 2H
        INT 21H
        
        DEC CH                                                 
        JNZ 1
        
        MOV AH, 4CH
        INT 21H 
    
END