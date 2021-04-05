; rdi - 64bits register for arg1
; rax - 64bits register for store values to return
; rcx - 64bits register generally used as a counter
; inc - INCrement to instruction
; jne - Jump if Not Equal
; mov - MOVe data to dst from src

SECTION	.TEXT
	GLOBAL ft_strlen

; ft_strlen(char *str)
; ft_strlen(arg1)
; ft_strlen(rdi)
; return length of str

ft_strlen:
	mov rcx, -1				; i = -1 | Move counter to -1
loop:
	inc rcx					; i++ | Increment counter
	cmp BYTE[rdi + rcx], 0	; arg1[i] == '\0' | Compare string to NULL
	jne loop				; true | Call loop function if the comparison is false
	mov rax, rcx			; returnValue = i | Move counter to RAX
	ret						; return RAX