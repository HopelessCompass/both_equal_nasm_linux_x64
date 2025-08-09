global _start

section .rodata
    a: db 1
    b: db 1
    
    true: db "True", 10
    true_len: equ $ - true
    false: db "False", 10
    false_len: equ $ - false
    
section .text

set_syswrite_registers:
    mov rax, 1
    mov rdi, 1
    ret
    
print_true:
    call set_syswrite_registers
    mov rsi, true
    mov rdx, true_len
    syscall
    ret 
    
print_false:
    call set_syswrite_registers
    mov rsi, false
    mov rdx, false_len
    syscall
    ret
    
_start:
    
    movzx rbx, byte [a]
    movzx rcx, byte [b]
    
    cmp rbx, 1
    jne l2
   
    cmp rbx, rcx
    je l1
    jmp l2
    
l1:    
    call print_true
    jmp exit
    
l2:
    call print_false 
    jmp exit
    
exit:    
    mov rax, 60
    mov rdi, 0
    syscall
