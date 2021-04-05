; rdi/rsi - 64bits register for arg1 and arg2

SECTION	.TEXT
	GLOBAL ft_strcpy

; ft_strcpy(char *dest, char *src)
; ft_strcpy(arg1, arg2)
; ft_strcpy(rdi, rsi)
; return address of dest

ft_strcpy:
	mov rcx, -1				; i = -1 | Move counter to -1
	mov rax, rdi			; RAX = &dest | Move address of dest to RAX
loop:
	inc rcx					; i++ | Increment counter
	cmp BYTE [rsi + rcx], 0	; src[i] == '\0' | Compare string to NULL
	mov dl, [rsi + rcx]		; tmpChar = src[i] | Move src[i] to tmpChar
	mov [rdi +rcx], dl		; dst[i] = tmpChar | Move tmpChar to dest[i]
	jne loop				; true | Call loop function if the comparison is false
	ret						; return RAX
