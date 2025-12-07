.intel_syntax noprefix
.global main
.extern syscall

.section .rodata
    prefix: .ascii "ECHO: "
    prefix_len = . - prefix

.bss
    .align 8
    buffer: .skip 64

.text

main:
    mov rdi, 0
    mov rsi, 0
    lea rdx, [rip + buffer]
    mov rcx, 64
    call syscall
    mov r12, rax
    cmp r12, 0
    jle .exit_program
    mov rdi, 1
    mov rsi, 1
    lea rdx, [rip + prefix]
    mov rcx, prefix_len
    call syscall
    mov rdi, 1
    mov rsi, 1
    lea rdx, [rip + buffer]
    mov rcx, r12
    call syscall
.exit_program:
    mov rdi, 60
    mov rsi, 0
    call syscall
