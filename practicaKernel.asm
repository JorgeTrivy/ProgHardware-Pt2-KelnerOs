
section .data

BUFFER DB 100         	; Reservar 100 bytes para el búfer de teclas
buffer_index DB 0     	; Índice actual del búfer

section .bss

key_pressed RESB 1    	; Almacenar la tecla pulsada


section .text

loop:
    	PUSHA   		; Guardar todos los registros
    
    	MOV AH, 0  	      	; Función 0 del servicio de interrupción del teclado
    	INT 16h              	; Llamar a la interrupción del teclado
    	MOV [key_pressed], AL 	; Almacenar la tecla pulsada en key_pressed
    
    	; Mostrar y cargar tecla pulsada
    	MOV AH, 0Ah          
    	MOV AL, [key_pressed]
    	MOV CX, 5            ; Número de veces a mostrar
    	INT 10h              ; Interrupción de video
    
   	;--FUNCIONES
    	CMP AL, 27           ; Tecla escape para salir
    	JE exit
    	CMP AL, '1'          ; Obtener información del sistema
    	JE info_dos
    	CMP AL, '2'          ; Obtener información de la CPU
    	JE info_cpu
    	CMP AL, '3'          ; Obtener información de la memoria
    	JE info_memoria
    
    	MOVZX EBX, byte [buffer_index]     ; Cargar el índice del búfer
    	MOV [BUFFER + EBX], AL             ; Almacenar la tecla en el búfer
    	INC byte [buffer_index]            ; Incrementar el índice del búfer
    	
    	;Mostrar el contenido actual del búfer
    	MOVZX ECX, byte [buffer_index]     ; Carga índice actual
    	MOV EDX, ECX			    ; Copiar indice
    	DEC EDX			    ; Decrementa EDX para obtener el índice base 0
    	MOV AL, [BUFFER+EDX]		    ; Carga valores
    	MOV AH, 0Eh			    ; Mostrar caracter
    	INT 10h
    	
    	POPA                 		    ; Restaurar todos los registros
    
    	JMP loop
    
    
info_dos:
    	CALL limpiar_pantalla
    
    	MOV AH, 30h          ; Obtener información de sistema
    	INT 21h              ; Interrupción de DOS
    	MOV AH, 09h          ; Imprimir cadena
    	INT 21h              ; Imprimir información
    
    	JMP loop
    
info_cpu:
    	CALL limpiar_pantalla
    
    	; Info de CPU
    	MOV AX, 0
    	CPUID
    	MOV AH, 09h
    	INT 21h
    
    	JMP loop
    
info_memoria:
    	CALL limpiar_pantalla
    
    	MOV AX, 12FFh	     ; Tamanio de memoria
    	INT 15h
    	MOV AH, 09h
    	INT 21h
    
    	JMP loop
    
limpiar_pantalla:
    	MOV AH, 06h          ; Borrar pantalla
    	MOV AL, 0            ; Carácter de borrado
    	XOR CX, CX           ; Posición superior izquierda (0)
    	MOV DX, 184Fh        ; Posición inferior derecha
    	INT 10h
    
    	RET


exit:
    	POPA                 ; Restaurar todos los registros
    	RET                  ; Retornar de la interrupción
    	MOV AH, 4Ch
    	INT 21h
