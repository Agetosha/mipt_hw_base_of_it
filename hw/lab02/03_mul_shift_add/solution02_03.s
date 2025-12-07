.intel_syntax noprefix
.global process, A, B, R

.data
    A: .long 0
    B: .long 0
    R: .long 0

.text
process:
    push rbp
    mov rbp, rsp

    mov eax, DWORD PTR [A]
    mov ebx, DWORD PTR [B]
    xor ecx, ecx
    xor r8d, r8d

    cmp eax, 0
    jge .check_b
    neg eax
    xor r8d, 1

.check_b:
    cmp ebx, 0
    jge .loop_start
    neg ebx
    xor r8d, 1

.loop_start:
    cmp ebx, 0
    je .apply_sign

    test ebx, 1
    jz .skip_add

    add ecx, eax

.skip_add:
    shl eax, 1
    shr ebx, 1
    jmp .loop_start

.apply_sign:
    cmp r8d, 1
    jne .store_result
    neg ecx

.store_result:
    mov DWORD PTR [R], ecx

    pop rbp
    ret
