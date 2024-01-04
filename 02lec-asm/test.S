    .global main
main:
    xor %eax, %eax
loop:
    add $3, %eax
    call writei32    // вывели результат
    // test $3, %eax
    and $3, %eax
    jnz loop
    call finish
