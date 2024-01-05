    .global main
main:
    call    readi32 //%eax=1
loop:
    add     $1, %eax     //%eax = 1+1   //%eax=2+1
    call    writei32    //2  3
    mov     %eax, %ebx      // %ebx = 2  %ebx =3
    sub     $1000, %ebx // %ebx = %ebx - 1000
    jz      fin // %ebx ?= 0

    jmp     loop

fin:
    call    finish
