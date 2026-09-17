.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    ; 64비트(8바이트) 변수 정의
    val1 QWORD 100000000000h
    val2 QWORD 200000000000h
    sum  QWORD 0

.code
main PROC
    ; 1. 하위 32비트(Lower 32 bits) 덧셈
    mov eax, DWORD PTR val1          ; val1의 하위 4바이트 로드
    add eax, DWORD PTR val2          ; val2의 하위 4바이트 더함
    mov DWORD PTR sum, eax           ; 결과를 sum의 하위 4바이트에 저장

    ; 2. 상위 32비트(Upper 32 bits) 덧셈 (올림수 포함)
    mov eax, DWORD PTR val1 + 4      ; val1의 상위 4바이트 로드
    adc eax, DWORD PTR val2 + 4      ; val2의 상위 4바이트 + Carry 플래그 더함
    mov DWORD PTR sum + 4, eax       ; 결과를 sum의 상위 4바이트에 저장

    ; 프로그램 종료
    INVOKE ExitProcess, 0
main ENDP
END main