SECTION	.TEXT
	GLOBAL ft_strdup
	EXTERN ft_strlen
	EXTERN ft_strcpy
	EXTERN malloc
	EXTERN __errno_location

; ft_strdup(const char *s)
; ft_strdup(arg1)
; ft_strdup(rdi)
; return a pointer to duplicate string

ft_strdup:
	call ft_strlen			; Call ft_strlen, RDI is already in place
	mov r8, rdi				; R8 = arg1 | Saving arg1 to use later as arg2 in ft_strcpy
	mov rdi, rax			; RDI = ft_strlenReturn | Moving the size of bytes to use as parameter to malloc
	inc rdi					; RDI++ | Increment RDI for NULL space to malloc
	call malloc				; Call malloc function
	cmp rax, 0				; mallocReturn == NULL | Check if malloc was successful
	jle error				; false | Calls error function if failed
	mov rdi, rax			; RDI = mallocReturn | Moving the addres returned from malloc to rdi
	mov rsi, r8				; RSI = arg1 | Saving arg1 to use later as arg2 to ft_strcpy
	call ft_strcpy			; Call ft_strcpy, RDI and RSI are in place
	ret						; return RAX

error:
	neg rax					; RAX *= -1 | Turns RAX into 1
	push rax				; Put RAX in top of stack
	call __errno_location	; Call error number definition
	pop rbx					; Get RBX from top of stack
	mov [rax], rbx			; &RAX = RBX | Set error in ptr RAX
	mov rax, 0				; Set return to NULL
	ret						; return RAX
