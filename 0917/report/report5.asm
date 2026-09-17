.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
    mov eax, 5          ; EAX 레지스터에 5를 대입
    add eax, 6          ; EAX 레지스터에 6을 더함

    INVOKE ExitProcess, 0
main ENDP
END main