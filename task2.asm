﻿LXI H, 0x0017    ; Загружаем адрес x3 (0017h)
MOV A, M         ; Читаем x3 в аккумулятор
CMA              ; Инвертируем биты (!x3)
MOV B, A         ; Сохраняем !x3 в регистр B

LXI H, 0x0018    ; Загружаем адрес x4 (0018h)
MOV A, M         ; Читаем x4 в аккумулятор
ANA B            ; Вычисляем !x3 AND x4 (результат в A)

LXI H, 0x0015    ; Загружаем адрес x1 (0015h)
ORA M            ; Вычисляем x1 OR (!x3 AND x4)

LXI H, 0x0019    ; Адрес результата (0019h)
MOV M, A         ; Сохраняем F = x1 OR (!x3 AND x4)
HLT              ; Остановка процессора


; https://www.sim8085.com/
; y=(x1 or (!x3 * !x3 * x4))
; 0x0015 - 01
; 0x0016 - 01
; 0x0017 - 00
; 0x0018 - 00
; Ожидаемый вывод
; 0x0019 - 01