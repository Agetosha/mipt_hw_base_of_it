.intel_syntax noprefix
.text
.global my_sin

.data
    minus_one: .double -1.0

.text
my_sin:
    push rbp
    mov rbp, rsp

    movsd xmm1, xmm0
    movsd xmm2, xmm0
    mulsd xmm2, xmm0
    movsd xmm3, [rip + minus_one]
    mulsd xmm2, xmm3

    mov rcx, 15
    mov rax, 2

.loop_start:
    mulsd xmm1, xmm2

    pxor xmm3, xmm3
    cvtsi2sd xmm3, rax
    divsd xmm1, xmm3
    inc rax

    pxor xmm3, xmm3
    cvtsi2sd xmm3, rax
    divsd xmm1, xmm3
    inc rax

    addsd xmm0, xmm1

    loop .loop_start

    pop rbp
    ret