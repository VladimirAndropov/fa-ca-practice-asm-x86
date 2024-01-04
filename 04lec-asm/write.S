    .text
    .global main
main:
    incl x ///4 byte- long


    .data
x:  .int 43 //.skip 4,0

    .bss
y:  .skip 1<<20

    .text
    mov x, %eax
    call writei32
    call finish