    .global main
main:
    mov $7, %eax
loop:
    call writei32    // вывели результат
    dec %eax
    jnz loop
    call finish
