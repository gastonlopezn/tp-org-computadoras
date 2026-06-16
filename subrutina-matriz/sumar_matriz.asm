section .text
    global _sumar_matriz

_sumar_matriz:
    ; Prologo
    push ebp
    mov ebp, esp
    
    push esi                        ; Indice
    push edi                        ; Lo vamos a usar como borrador
    push ebx                        ; ??
    
    ; Agarramos parametros
    mov eax, [ebp + 8]              ; Primer parametro
    mov ebx, [ebp + 12]             ; Segundo parametro
    mov edx, [ebp + 16]             ; Tercer parametro (0)
    mov ecx, [ebp + 20]             ; Cuarto parametro, cantidad de vueltas del ciclo
    mov esi, 0                      ; Indice 

    inicio_bucle:                       
        cmp esi, ecx                ; Comparamos el indice con las vueltas
        je fin_bucle                ; Si la cantidad es estrictamente menor, salimos del bucle

        mov edi, [eax + esi * 4]    ; Nos traemos al EDI el PRIMER PARAMETRO (M1)
        add edi, [ebx + esi * 4]    ; Sumamos nuestro primer parametro con EL SEGUNDO
        mov [edx + esi * 4], edi    ; Nos movemos a la direccion EDX lo que tenga EDI

        inc esi                     ; Incrementamos nuestro indice
        jmp inicio_bucle            ; Volvemos al inicio del bucle
    
    fin_bucle:
        ; Epilogo
        pop ebx
        pop edi
        pop esi

        mov esp, ebp
        pop ebp
        ret
             

