.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

; 1. 일주일 7일에 대한 기호 정수 상수 정의 (= 사용)
Sunday    = 0
Monday    = 1
Tuesday   = 2
Wednesday = 3
Thursday  = 4
Friday    = 5
Saturday  = 6

.data
; 2. 위에서 정의한 기호 상수를 초기화 값으로 가지는 배열 변수 생성 (BYTE 타입)
dayArray BYTE Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday

.code
main PROC
    ; (선택 사항) 배열 값이 잘 들어갔는지 레지스터에 로드하여 확인
    mov al, dayArray[0]      ; AL = Sunday (0)
    mov bl, dayArray[1]      ; BL = Monday (1)
    mov cl, dayArray[6]      ; CL = Saturday (6)

    ; 프로그램 종료
    INVOKE ExitProcess, 0
main ENDP
END main