.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

; 1. 심볼릭 텍스트 상수 정의
str1 TEXTEQU <"Welcome to Assembly Programming!", 0>
str2 TEXTEQU <"Visual Studio 2022 MASM", 0>
str3 TEXTEQU <"Symbolic Text Constants Example", 0>

.data
; 2. 심볼릭 상수를 초기화 값으로 사용
msg1 BYTE str1
msg2 BYTE str2
msg3 BYTE str3

.code
main PROC
    mov edx, OFFSET msg1
    mov edx, OFFSET msg2
    mov edx, OFFSET msg3

    INVOKE ExitProcess, 0
main ENDP
END main