    .global main
main:
    xor %eax, %eax
    xor %ebx, %ebx
loop:
    inc %eax
    inc %ebx
    jmp loop
