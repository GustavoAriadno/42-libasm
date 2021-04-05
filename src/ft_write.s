SECTION	.TEXT
	GLOBAL ft_write
	EXTERN __errno_location

; ft_write(int fd, const void *buf, size_t count)
; ft_write(arg1, arg2, arg3)
; ft_write(rdi, rsi, rdx)
; return number of byter written or -1

ft_write:
	mov rax, 1				; The (syscall) system call number of "write"
	syscall					; Syscall's return value in rax, args are already in place
	cmp rax, 0				; RAX < 0 | Check if RAX is lower than zero
	jl  error				; true | Calls error function if RAX is lower than zero
	ret						; return RAX
error:
	neg rax					; RAX *= -1 | Turns RAX into 1
	push rax				; Put RAX in top of stack
	call __errno_location	; Call error number definition
	pop rbx					; Get RBX from top of stack
	mov [rax], rbx			; &RAX = RBX | Set error in ptr RAX
	mov rax, -1				; Set return to -1
	ret						; return RAX
