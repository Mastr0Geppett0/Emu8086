; Calcola r=(a+b)/2 per b da 1 a 10
   
dati SEGMENT                    ;segmento dati
    		
        a DB 12d 
        b DB 1d 
        r DB ?  
            
dati ENDS                       ;fine segmento dati
    
codice SEGMENT		            ;segmento codice    
       ASSUME CS:codice, DS:dati    
       
inizio:     mov AX,dati
            mov DS,AX         
        
            lea SI,a                  ;SI=&a
            mov AL, [SI]              ;AL=[SI]
        
            lea SI,b                  ;SI=&b
            mov AH, [SI]              ;AH=[SI] 
            
            
        
iniziociclo:CMP AH,10                 ;confronta b con 10
        
            JA fineciclo
        
            mov BL,AL
            
            ADD BL,AH                 ;AL=AL+AH                 
            SHR BL,1                  ;AL=AL/2
        
            lea DI,r
            mov [DI], BL
        
            INC AH                    ;incrementa b (add AH,1)
        
            JMP iniziociclo
        
fineciclo:  mov AH,4Ch                ;fine programma            
            int 21h 
        
codice ENDS		                  ;fine segmento codice


END inizio                        ;fine del programma