.intel_syntax noprefix
.global main

.text
main:
    push rbp
    mov rbp, rsp
    
    call readi32
    mov r12d, eax

    cmp r12d, 0
    jl .done

.my_loop:
    mov edi, r12d
    call writei32
    call nl

    dec r12d
    cmp r12d, 0
    jge .my_loop

.done:
    call finish
