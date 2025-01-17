## Содержание дисциплины
- # Раздел 1. Архитектура процессоров
# Тема 1. Язык ассемблера

Инструкции языка ассемблера. Операнды, способы адресации. Регистры процессора. Оперативная память. Константы в языке ассемблера.

- [Архитектура фон Неймана](#архитектура-фон-неймана)
- [Целые числа](#целые-числа)
- [Знаковые числа](#знаковые-числа)
- [Машинный код и язык ассемблера](#машинный-код-и-язык-ассемблера)
- [Первые инструкции](#первые-инструкции)
- [Инструкции сдвига](#инструкции-сдвига)




## Лекция

https://skillbox.ru/media/code/printsipy-fon-neymana-i-pervye-kompyutery-na-ikh-osnove/

## Архитектура фон Неймана

![image1](images/von-neumann.png "image1")

Фон-Неймановский компьютер:

- электронный, цифровой;
- адресуемая память — набор одинаковых пронумерованных ячеек;
- хранимая программа в виде набора инструкций;
- инструкции исполняются по одной, в определённой последовательности; есть IP — instruction pointer, ячейка памяти внутри control unit, где хранится адрес текущей инструкции;
- инструкции и данные хранятся в одной и той же памяти, инструкции можно обрабатывать как данные.

Von Neumann bottleneck: одна и та же шина памяти используется для передачи инструкций и данных.

Типичный шаг исполнения программы:

- fetch — из памяти приносим следующую инструкцию;
- decode — определяем, как она будет исполняться;
- execute — исполнение:
  - производим вычисления и обновляем операнды;
  - обновляем instruction pointer.

```
   ┌───────────────┐
   │               │
   │               │             ┌─────────────┐
...│               │             │     IP      │
   ├───────────────┤             │             │
247│ add x, 1      │◄──────┐     │             │
   ├───────────────┤       └─────┤     247     │
248│ jmp 247       │             └─────────────┘
   ├───────────────┤
249│               │
   ├───────────────┤
250│               │
   ├───────────────┤
...│               │
   │               │
   │               │
   │               │
   └───────────────┘
```

ISA (instruction set architecture) — набор инструкций конкретного компьютера, их семантика и способ кодирования в памяти. Примеры ISA: x86, ARM, MIPS, RISC-V.

Компьютеры с одинаковой ISA могут быть по-разному устроены на уровне микроархитектуры — от этого может зависеть скорость или эффективность исполнения программ.

См. также: гарвардская архитектура (инструкции и данные отдельно): https://en.wikipedia.org/wiki/Harvard_architecture


- # Целые числа
Двоичное представление:

42=32+8+2=25+23+21=1010102.

49=32+16+1=25+24+20=1100012.

Нумерация битов:

     ... 0 0 1 1 0 0 0 1 = 49
     ... 7 6 5 4 3 2 1 0

```
<- старшие разряды
     младшие разряды ->
```

Ячейки памяти разного размера:

- 8 бит:
00000000 = 0
11111111 = 255

- 16 бит:
0000000000000000 = 0
1111111111111111 = 65535
...
- Шестнадцатеричные цифры:
```
0000 0         1000 8
0001 1         1001 9
0010 2         1010 a
0011 3         1011 b
0100 4         1100 c
0101 5         1101 d
0110 6         1110 e
0111 7         1111 f
```

Например, 42 = 0b00101010 = 0x2A. Полезно помнить некоторые степени двойки:

```
2**8  = 256   =   0x100
2**10 = 1024  =   0x400
2**12 = 4096  =  0x1000
2**16 = 65536 = 0x10000
```

Переполнение 16-битной ячейки памяти:
```
  0xffff  = 65535
+ 0x0001
= 0x0000
```
(должно было быть 0x10000, но старший бит не поместился)
Получается арифметика по модулю 2N, в данном случае — по модулю 216=65536.

- # Знаковые числа
Two's complement representation (два-дополнительный код) на примере 4-разрядных (4-битных) чисел:
```
Биты	Число
0000	0
0001	1
0010	2
0011	3
0100	4
0101	5
0110	6
0111	7
1000	-8
1001	-7
1010	-6
1011	-5
1100	-4
1101	-3
1110	-2
1111	-1
Старший бит — знаковый.
```

−x=x¯+1 (побитовая инверсия и сложение), например,          ``−0001=0001⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯+1=1110+1=1111.``

«Переполнение» беззнаковых чисел здесь работает вполне логично:
```
  0xffff  = -1
+ 0x0001
= 0x0000
```

Могут быть и другие, реже используемые, представления знаковых чисел, например sign-magnitude: бит знака, а в остальных битах модуль числа. (В таком представлении есть отдельно +0 и -0.)

---
Машинный код и язык ассемблера
---

Читать инструкции процессора в виде чисел очень неудобно (а писать тем более):
```
    2c93:       48 8d 91 00 00 fe ff
    2c9a:       48 39 c2 
    2c9d:       b8 00 00 02 00
    2ca2:       48 0f 46 c1
```
Поэтому для инструкций придумывают названия (мнемоники) и правила записи их операндов, а потом делают конвертор из такого текстового представления в двоичное (машинный код). Такой конвертор называется ассемблером, а текстовое представление инструкций — языком ассемблера.
```
    lea    -0x20000(%rcx),%rdx
    cmp    %rax,%rdx
    mov    $0x20000,%eax
    cmovbe %rcx,%rax
```
В мире x86 исторически больше всего используются два синтаксиса языка ассемблера: AT&T vs Intel. Эти же инструкции в синтаксисе Intel выглядят так:
```
    lea rdx, [rcx - 0x20000]
    cmp rdx, rax
    mov eax, 0x20000
    cmovbe rax, rcx
```

Можно заметить, что мнемоники инструкций в основном те же, но операнды записываются иначе и идут в другом порядке.

Мы будем использовать синтаксис AT&T, потому что в среде GNU он используется по умолчанию.

Регистры
«Переменные» внутри процессора.
```
  von Neumann             closer to reality
┌────────────────┐       ┌────────────────┐
│  CPU           │       │ CPU            │
│                │       │                │
│ ┌────────────┐ │       │                │
│ │Control unit│ │       │ Registers      │
│ │            │ │       │                │
│ │IP          │ │       │ (including IP) │
│ └────────────┘ │       │                │
│                │       │                │
└────────┬───────┘       └────────┬───────┘
         │                        │
         │                        │
┌────────┴───────┐       ┌────────┴───────┐
│  Memory        │       │ Cache(s)       │
│                │       │                │
│                │       │                │
│                │       └────────┬───────┘
│                │                │
│                │       ┌────────┴───────┐
│                │       │ RAM            │
│                │       │                │
│                │       │                │
└────────────────┘       └────────────────┘
```

Instruction pointer (program counter): eip.

Регистры общего назначения (general purpose registers):

```
Регистр	  Младшие 16 бит	Два младших байта

    eax	        ax	        ah, al
    ebx     	bx      	bh, bl
    ecx	        cx	        ch, cl
    edx	        dx	        dh, dl
    esi	        si      	—
    edi	        di	        —
    ebp	        bp	        —
```

(Есть ещё регистр esp, который мы пока не трогаем.)

## Первые инструкции
Инструкция выглядит примерно так: 
    
    мнемоника операнд, операнд.

Операнд-регистр записывается после знака процента: ``%eax``.

Наша первая мнемоника: ``mov``.

```
mov SRC, DST   // копировать SRC в DST

movl %eax, %ebx // скопировать биты eax в ebx
                // старое значение ebx теряется
movw %ax, %bx
movb %ah, %bl

```
Суффиксы размера операндов:
```
b (byte) — 8 бит
w (word) — 16 бит
l (long) — 32 бита
q (quad) — 64 бита (не используем)
```
[Справочник (в синтаксисе Intel)](https://www.felixcloutier.com/x86/mov)

[Список инструкций](https://www.felixcloutier.com/x86/index.html)

Непосредственно заданный операнд:
```
movl $42, %ecx   // положить в %ecx битовое представление числа 42

movl $0x80, %edx // шестнадцатеричная запись операнда
movl $-1, %eax   // установить все биты eax в 1
```
Библиотека simpleio
```
call writei32   // напечатать на экране значение eax
                // как знаковое десятичное число
call readi32    // ввести с клавиатуры число и сохранить в eax
call readi64    // ввести с клавиатуры число и сохранить в edx:eax
call writei64   // вывести edx:eax
call finish     // завершить исполнение программы
```

Наша первая программа на языке ассемблера x86, вычисляющая сумму двух чисел:
```
    .global main
main:
    call readi32     // считали первое число
    movl %eax, %ecx  // сохранили его в ecx
    call readi32     // считали второе число в eax
    addl %ecx, %eax  // сложили первое и второе
    call writei32    // вывели результат
    call finish      // завершили программу
```
Сохраним её в файл sum.S (да, заглавная S), оттранслируем и запустим:
```bash
$ gcc -m32 -g sum.S simpleio_i686.S -o sum
$ ./sum
```

Некоторые арифметические инструкции
```
add SRC, DST  // DST += SRC
sub SRC, DST  // DST -= SRC
inc DST       // DST++
dec DST       // DST--
neg DST       // DST = -DST
not DST       // DST = ~DST
and SRC, DST  // DST &= SRC
or  SRC, DST  // DST |= SRC
xor SRC, DST  // DST ^= SRC
```

# Инструкции сдвига
## Логический сдвиг: 
двигаем биты внутри регистра, дополняя его нулями и теряя то, что «выпало».
```
movw $0x1234, %ax
shrw $4, %ax        // ax == 0x0123
shlw $4, %ax        // ax == 0x1230
addw $7, %ax        // ax == 0x1237
rorw $4, %ax        // ax == 0x7123
```
## Арифметический сдвиг вправо:
 двигаем биты, дополняя слева знаковым битом
```
movw 0xfff0, %ax    // ax == -16
sarw $4, %ax        // ax == 0xffff == -1
salw $5, %ax        // ax == 0xfff0 == -16
```
См. также [справочник.](https://www.felixcloutier.com/x86/movw)


## Самостоятельная работа

Понятие ассемблера и языка ассемблера. Основные понятия языка ассемблера. Виды и типы ассемблеров. Синтаксис языка ассемблера. Макрокоманды в языке ассемблера.


