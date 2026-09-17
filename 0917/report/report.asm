.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
    ; 1. 각 레지스터에 정수값 임의 할당 (A = EAX, B = EBX, C = ECX, D = EDX)
    mov eax, 30        ; A = 30
    mov ebx, 20        ; B = 20
    mov ecx, 10        ; C = 10
    mov edx, 5         ; D = 5

    ; 2. (A + B) 계산 -> EAX에 저장
    add eax, ebx       ; EAX = EAX + EBX (30 + 20 = 50)

    ; 3. (C + D) 계산 -> ECX에 저장
    add ecx, edx       ; ECX = ECX + EDX (10 + 5 = 15)

    ; 4. (A + B) - (C + D) 계산 -> EAX에 최종 결과 저장
    sub eax, ecx       ; EAX = EAX - ECX (50 - 15 = 35)

    ; 프로그램 종료 (반환값: 0)
    INVOKE ExitProcess, 0
main ENDP
END main