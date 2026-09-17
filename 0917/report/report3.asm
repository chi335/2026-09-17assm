.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    ; Table 3-2에 정의된 데이터 타입별 변수 선언 및 초기화

    ; 1. 8비트 (1바이트)
    var1  BYTE   255                 ; 8비트 부호 없는 정수 (0 ~ 255)
    var2  SBYTE  -128                ; 8비트 부호 있는 정수 (-128 ~ +127)

    ; 2. 16비트 (2바이트)
    var3  WORD   65535               ; 16비트 부호 없는 정수
    var4  SWORD  -32768              ; 16비트 부호 있는 정수

    ; 3. 32비트 (4바이트)
    var5  DWORD  4294967295          ; 32비트 부호 없는 정수
    var6  SDWORD -2147483648         ; 32비트 부호 있는 정수

    ; 4. 48비트 (6바이트) - 16진수 접미사 h로 수정
    var7  FWORD  123456789ABCh       ; 48비트 정수/포인터

    ; 5. 64비트 (8바이트)
    var8  QWORD  1234567890123456h   ; 64비트 정수

    ; 6. 80비트 (10바이트)
    var9  TBYTE  10000000000000000000h ; 80비트 정수/BCD

    ; 7. 부동 소수점 (실수)
    var10 REAL4  3.14159             ; 32비트 단정밀도 실수 (Float)
    var11 REAL8  3.141592653589793   ; 64비트 배정밀도 실수 (Double)
    var12 REAL10 3.1415926535897932384 ; 80비트 확장 정밀도 실수

.code
main PROC
    ; 변수들의 메모리 주소나 일부 값을 레지스터에 로드하여 정상 동작 확인
    mov al, var1         ; var1 (BYTE) -> AL 레지스터로 복사
    mov ax, var3         ; var3 (WORD) -> AX 레지스터로 복사
    mov eax, var5        ; var5 (DWORD) -> EAX 레지스터로 복사

    ; 프로그램 종료
    INVOKE ExitProcess, 0
main ENDP
END main