;Calcola l'espressione r=(a+b)/2 a 8 bit 
;con le direttive standard

;d: decimale
;h: esadecimale
;b: binario
;o: ottale

;Segmento dati
dati SEGMENT		;Segmento dati       DB: Define Byte: variabili a 1 Byte, 8 bit 
        a DB 03d    ;[a]=3d              DW: Define Word: variabili a 2 Byte, 16 bit
        b DB 05d    ;[b]=5d              DDW: Define Double Word: variabili a 4 Byte, 32 bit
        r DB ?      ;r non inizializzato
dati ENDS                                                      

;Segmento dati extra (non usato)
dati_extra SEGMENT
            x DB 07h
            y DW 0009h
dati_extra ENDS 


codice SEGMENT		;Segmento codice
       ASSUME CS:codice, DS:dati, ES:dati_extra  ;Associa codice al registro CS, dati al registro DS e dati_extra al registro ES
        
        ;inizializzazione del registro DS 
inizio: mov AX,dati	;assegnazione a DS dell'indirizzo base del Data Segment prima in AX
        mov DS,AX   ;poi da AX in DS   
        
        ;trasferisce il valore di a in AL
        lea SI,a	;copia in SI l'indirizzo di a (SI=&a)
        mov AL,[SI]	;copia in AL il dato all'indirizzo SI (AL=[SI])
        
        ;trasferisce il valore di b in AH
        lea SI,b	;copia in SI l'indirizzo di b
        mov AH,[SI]	;(AH=[SI])             
        
        ;somma a e b ponendo il risultato in AH
        add AH,AL	;AH=AH+AL   (AH: a+b)
        
        ;divide la somma per 2 tramite right shift di AH
        shL AH,1	;right shift di 1 bit di AH (AH=AH/2  AH: (a+b)*2)
        
        ;trasferisce il risultato contenuto in AH nella variabile r
        lea DI,r	;copia in DI l'indirizzo di r
        mov [DI],AH	;copia il contenuto di AH (il risultato) nella celle di memoria indirizzata da DI ([DI]=AH)
        
        ;ritorno al Sistema Operativo (return)
        mov AH,4Ch
        int 21h
codice ENDS		;fine segmento codice

END inizio		;fine del programma       