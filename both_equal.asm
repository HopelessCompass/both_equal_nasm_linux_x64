global _start

section .rodata
    a: db 1
    b: db 1
    
    true: db "True", 10
    true_len: equ $ - true
    false: db "False", 10
    false_len: equ $ - false
    
section .text

    _start:
    
    mov dh, [a]
    mov dl, [b]
    
    cmp dh, 1
    je continue
    mov rax, 1
    mov rdi, 1
    mov rsi, false
    mov rdx, false_len
    syscall
    call exit
    
    continue:
    cmp [a], dl
    je is_true
    
    is_true:
    mov rax, 1
    mov rdi, 1
    mov rsi, true
    mov rdx, true_len
    syscall
    call exit
    
    exit:
    mov rax, 60
    mov rdi, 0
    syscall
