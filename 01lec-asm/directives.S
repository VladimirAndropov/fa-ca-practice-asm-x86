.global main            // экспортировать символ main
main:
    movl $42, %eax
    .intel_syntax noprefix
    mov eax, 42             // код в синтаксисе Intel
    .att_syntax noprefix
    movl $42, eax           // noprefix — без символа %
                            // перед операндами-регистрами

    .att_syntax prefix
    .set answer, 4 * 10     // константа
    movl $answer + 2, %eax

    nop
    .byte 0x90
    .skip 5, 0x90

    call finish

    .word 1, 2, 3  // или .short 1, 2, 3
    .int 4, 5, 6
    .quad 7, 8, 9