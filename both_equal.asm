global _start

section .rodata
    a: db 0
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
    call set_syswrite_registers
    mov rsi, false
    mov rdx, false_len
    call finish
    
    continue:
    cmp [a], dl
    jne is_false
    call is_true
    
    set_syswrite_registers:
    mov rax, 1
    mov rdi, 1
    ret
    
    is_true:
    call set_syswrite_registers
    mov rsi, true
    mov rdx, true_len
    call finish
    
    is_false:
    call set_syswrite_registers
    mov rsi, false
    mov rdx, false_len
    call finish
    
    finish:
    syscall
    mov rax, 60
    mov rdi, 0
    syscall
