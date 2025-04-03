LXI H, 0x0015    ; Загружаем адрес 0015h в регистровую пару HL
MOV B, M         ; B = x1

INX H            ; HL = 0016h (x2)
MOV A, M         ; A = x2
CMA              ; A = !x2

INX H            ; HL = 0017h (x3)
MOV A, M         ; A = x3
CMA              ; A = !x3
MOV C, A         ; C = !x3

MOV D, A        ; D = !x2 (копируем для дальнейшего вычисления)
MOV A, C        ; A = !x3
ANA D           ; A = !x2 AND !x3

INX H           ; HL = 0018h (x4)
MOV D, M        ; D = x4 (без инвертирования)
ANA D           ; A = (!x2 AND !x3) AND x4

ORA B           ; A = x1 OR [(!x2 AND !x3) AND x4]

INX H           ; HL = 0019h
MOV M, A        ; сохраняем результат (y) по адресу 0019h
HLT             ; остановка процессора


; https://www.sim8085.com/
; y=x1 or !x2 * !x3 * x4
; 0x0015 - 01
; 0x0016 - 01
; 0x0017 - 00
; 0x0018 - 00
; Ожидаемый вывод
; 0x0019 - 01