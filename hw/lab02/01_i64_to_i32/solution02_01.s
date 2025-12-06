.intel_syntax noprefix
.global main

main:
    call readi64

    mov rbx, 2147483647
    cmp rax, rbx
    jg .set_max

    mov rbx, -2147483648
    cmp rax, rbx
    jl .set_min

    mov rdi, rax
    jmp .print_result

.set_max:
    mov rdi, 2147483647
    jmp .print_result

.set_min:
    mov rdi, -2147483648
    jmp .print_result

.print_result:
    call writei32
    call nl
    call finish
