; edx\r8b - 32bits register for integers
; dl\r8d  - 8bits register for char
; xor     - Implements the bitwise XOR operation

SECTION	.TEXT
	GLOBAL ft_strcmp

; ft_strcmp(char *s1, char *s2)
; ft_strcmp(arg1, arg2)
; ft_strcmp(rdi, rsi)
; return (arg1 - arg2)

ft_strcmp:
	mov rcx, -1				; i = -1 | Move counter to -1
loop:
	inc rcx					; i++ | Increment counter
	mov dl, BYTE [rdi+rcx]	; c1 = arg1[i] | Move char1 to arg1
	mov r8b, BYTE [rsi+rcx]	; c2 = arg1[i] | Move char2 to arg2
	cmp dl, 0				; c1 == '\0' | Compare if char1 is NULL
	je  end					; true | Call function to return 0
	cmp r8b, 0				; c2 == '\0' | Compare if char2 is NULL
	je  end					; true | Call function to return 0
	cmp dl, r8b				; src[i] == '\0' | Compare  to NULL
	je  loop				; true | Call loop function if the comparison is true
end:
	sub edx, r8d			; char1 - char2 | Subtract different chars
	mov eax, edx			; rValue = subResult | Move returnValue to subtractResult
	ret						; return RAX
