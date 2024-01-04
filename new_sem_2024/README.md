# Странички семинаров по курсу CA (Computer Architecture ) FA

# Проекты

В качестве семинарской оценки у нас будет оценка за проект.

Страничка с проектами: [проекты](projects)

Прошлогодние проекты: [проекты](2022_216/projects)

# Темы текущего года

1. [[конспект](01-intro/README.md)][[youtube](https://youtu.be/WGxA9WTWyNQ?si=19kf_FQjDpgLqb_1)][[vk](https://vk.com/video-221776054_456239019)] - Терминал. vim. tmux. 
2. [[конспект](02-asm/README.md)][[youtube](https://youtu.be/U6r8ubs-SAw)][[vk](https://vk.com/video-221776054_456239020)] - Язык ассемблера. Представление целых чисел. Сдвиги. GDB.
3. [[конспект](03-stack/README.md)][[youtube](https://www.youtube.com/watch?v=TwgwQ6H4wz0)][[vk](https://vk.com/video-221776054_456239021)] - Переменные и массивы. Стек. Cdecl. Запуск asm+c и asm+c++ кода.
4. [[конспект](04-more-asm/README.md)][[youtube](https://www.youtube.com/watch?v=vtA6kedKMD8)][[vk](https://vk.com/video-221776054_456239022)] - Lea, строки, части регистров, switch.
5. [[конспект](05-asm-func/README.md)][[youtube](https://youtu.be/N-jkF3YofR8?si=E1ev_esI6ntMv8eA)][[vk](https://vk.com/video-221776054_456239023)] - Указатели на функции. Variadic functions.
6. [[конспект](06-c-basics/README.md)][[youtube](https://youtu.be/6YEfGrcKMK8?si=4f4AzAKbPrftyIRw)][[vk](https://vk.com/video-221776054_456239024)] - Си. Printf/scanf, неожиданные последствия UB, буферизация, атака переполнением буфера, работа со строками используя арифметику указателей.
7. [[конспект](07-c-dynamic-mem/README.md)][[youtube](https://youtu.be/8n6i81ZGi6U)][[vk](https://vk.com/video-221776054_456239025)] - Си. Работа с динамической памятью. malloc/calloc/realloc. Brk/Sbrk. OOM-killer.
8. [[конспект](08-utf-8/README.md)][[youtube](https://youtu.be/ieerMEthNhE)][[vk](https://vk.com/video-221776054_456239026)] - Кодировки. Unicode, UTF-8, KOI8-R. Как работают emoji.
9. [[конспект](09-float/README.md)][[youtube](https://youtu.be/G3_ZJeLUoRU)][[vk](https://vk.com/video-221776054_456239027)] - IEEE754, float/double, разбираемся в битах, смотрим на 0.1+0.2 != 0.3
10. [[конспект](10-gdb/README.md)][[youtube](https://youtu.be/jf0zcz2fjFc)][[vk](https://vk.com/video-221776054_456239028)] - GDB. Break, watch. Встроенный питон. Обратный дебаг. Pretty printers.

# Консультации

1. [youtube](https://youtu.be/Ad-wV1it4Ls?si=ayp3mM1UauGXmy98) - секции кода, представление чисел, гдб

## Прошлые года

[2021 год. 207 группа](2021_207)

[2022 год. 216 группа](2022_216)

## Правила игры

### Форматирование ASM

1. В одном блоке кода (участок кода отделенный новой строкой сверху и снизу) между командами и аргументами должен быть отступ одного размера. Отступ должен быть сделан табом, а не пробелом. То есть все аргументы должны быть выравнены.

```
        pushl   %ebp
        movl    %esp, %ebp

        subl    $4, %esp
        and     $-16, %esp
        leal    -4(%ebp), %eax
```

### Реджекты

Сданный код проходит тестирование в тестирующей системе, а затем проверяется глазами семинариста и ассистентов.

Прошедший тесты код может быть отправлен на исправление (получен статус reject), если решение является неоптимальным, если нарушает условия, установленные в задаче или если нарушает форматирование.

### Списывание

Проверка на списывание запускается в случайное время. При обнаружении списывания обнуляется ВЕСЬ контест и составляется записка в УО.

В проверке на списывание участвуют все доступные онлайн материалы, в том числе известные репозитории с решениями и решения прошлых годов.

Если вы берете код из общедоступного источника, то нужно прикладывать ссылку на этот источник и пояснять комментариями код, чтобы было видно, что вы этот код понимаете.



## Полезные ссылки

### Материалы

* [Материалы курса ВШЭ 2020 года](https://github.com/blackav/hse-caos-2020)
* [Материалы физтеха](https://github.com/victor-yacovlev/fpmi-caos)
* [Вики учебник по asm](https://ru.wikibooks.org/wiki/%D0%90%D1%81%D1%81%D0%B5%D0%BC%D0%B1%D0%BB%D0%B5%D1%80_%D0%B2_Linux_%D0%B4%D0%BB%D1%8F_%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%81%D1%82%D0%BE%D0%B2_C)

### Тулзы

* [Godbolt - compiler explorer](https://gcc.godbolt.org/)

## Файлы

* [C11 стандарт](C11_standard.pdf)
