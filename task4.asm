LXI H, 0x002A  ; Загрузка адреса начала массива
MVI B, 1        ; Инициализация счётчика позиций
MVI C, 0        ; Сумма нечётных позиций
MVI D, 0        ; Сумма чётных позиций

SUM_LOOP:
    MOV E, M     ; Загрузка элемента массива в E
    MOV A, B     ; Проверка чётности позиции
    ANI 1        ; Младший бит в A
    JZ EVEN_POS  ; Если позиция чётная

ODD_POS:        ; Обработка нечётной позиции
    MOV A, C    ; Загрузка суммы нечётных
    ADD E       ; Добавление элемента
    MOV C, A    ; Сохранение обратно в C
    JMP NEXT

EVEN_POS:       ; Обработка чётной позиции
    MOV A, D    ; Загрузка суммы чётных
    ADD E       ; Добавление элемента
    MOV D, A    ; Сохранение обратно в D

NEXT:
    INX H       ; Следующий элемент массива
    INR B       ; Увеличение счётчика позиций
    MOV A, B    
    CPI 11      ; Проверка окончания цикла (10 элементов)
    JNZ SUM_LOOP ; Повтор, если не все элементы обработаны

END:
    MOV M, D    ; Сохранение суммы чётных позиций
    INX H       
    MOV M, C    ; Сохранение суммы нечётных позиций
    HLT         ; Остановка процессора

ORG 0x002A      ; Размещение массива
DB 1, 1, 1, 1, 1, 1, 1, 1, 1, 1




LXI H, 0x002A 
MVI B, 1
MVI A, 0
MOV C, A
MOV D, A

SUM_LOOP:
    MOV     A, B          
    CPI     11 
    JZ      END
    MOV     E, M      
    MOV     A, B        
    ORA     A      
  JPE EVEN

ODD:
  MOV A, C
  ADD E
  MOV C, A
  JMP NEXT

EVEN:
  MOV A, D
  ADD E
  MOV D, A

NEXT:
  INX H
  INR B
  JMP SUM_LOOP

END:
  MOV M, D
  INX H
  MOV M, C
  HLT