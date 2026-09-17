<a id="top"></a>

# 💻 3. Assembly Language Fundamentals
---

## 📑 목차 (Table of Contents)

1. [📌 1. 기본 언어 요소 (Basic Language Elements)](#sec-1)
2. [🛠️ 2. 어셈블리 프로그램의 기본 구조 및 예제](#sec-2)
3. [🔄 3. 어셈블, 링크 및 실행 (Assemble-Link-Execute Cycle)](#sec-3)
4. [📊 4. 데이터 정의 (Defining Data)](#sec-4)
5. [🔑 5. 기호 상수 (Symbolic Constants)](#sec-5)

---

<a id="sec-1"></a>
## 📌 1. 기본 언어 요소 (Basic Language Elements)

### (1) 명령어(Instruction) vs 지시자(Directive)
* **Instruction (명령어)**: CPU가 실제 실행하는 행동 지침입니다 (예: `MOV`, `ADD`, `SUB`, `NOP` 등).
* **Directive (지시자)**: 어셈블러(Assembler)에게 프로그램 구조나 메모리 할당 방식을 안내하는 지시서입니다 (예: `.data`, `.code`, `PROC`, `ENDP` 등).

### (2) 리터럴 (Literals)
* **정수 리터럴 (Integer Literals)**: 숫자 뒤에 진법 접미사(Radix)를 붙여 표현합니다.
  * `26` / `26d` : 10진수
  * `11010011b` : 2진수
  * `42q` / `42o` : 8진수
  * `1Ah` / `0A3h` : 16진수 (첫 글자가 문자인 경우 맨 앞에 `0`을 붙여 식별자와 구분)
* **실수 리터럴 (Real Number Literals)**: IEEE 754 부동소수점 표준 방식을 사용합니다.
  * 32비트 float 기준: **부호 비트($S$, 1bit)** + **지수부($E$, 8bit)** + **가수부($M$, 23bit)**
* **문자 및 문자열 리터럴**: 홑따옴표(`'`) 또는 쌍따옴표(`"`)를 사용해 정의하며, 문자열 끝에는 `0` (NUL)을 붙여 마감하기도 합니다.

### (3) 상수 정수식 (Constant Integer Expressions)
* **연산자 우선순위**: `( )` (1순위) $\rightarrow$ Unary `+`, `-` (2순위) $\rightarrow$ `*`, `/`, `MOD` (3순위) $\rightarrow$ `+`, `-` (4순위)

### (4) 식별자 (Identifiers) 및 예약어 (Reserved Words)
* **식별자 규칙**: 대소문자를 구분하지 않으며, 1~247자 길이를 가집니다. 첫 글자는 영문자, `_`, `@`, `?`, `$`만 가능합니다.
* **예약어**: 레지스터 이름, 명령어 이름(MOV, ADD 등), 지시자, 데이터 타입(BYTE, WORD 등)은 식별자로 사용할 수 없습니다.

### (5) 주석 (Comments) & NOP
* **한 줄 주석**: 세미콜론(`;`) 사용.
* **블록 주석**: `COMMENT ! ... !` 또는 `COMMENT & ... &` 사용.
* **NOP (No Operation)**: 1바이트 크기의 명령어로, 아무 작업도 수행하지 않지만 메모리 주소 정렬(Alignment)을 통해 연산 속도를 최적화할 때 사용됩니다.

[🔝 맨 위로 이동](#top)

---

<a id="sec-2"></a>
## 🛠️ 2. 어셈블리 프로그램의 기본 구조 및 예제

```assembly
.data
    sum DWORD 0           ; 32비트 변수 sum 선언 및 0으로 초기화

.code
main PROC
    mov eax, 5            ; EAX 레지스터에 5 대입
    add eax, 6            ; EAX 레지스터에 6을 더함 (EAX = 11)
    mov sum, eax          ; 결과를 sum 변수에 저장
    
    INVOKE ExitProcess, 0 ; 프로그램 종료 (운영체제로 제어 반환)
main ENDP
END main
```

### 📂 세그먼트 구조 (Segment Structure)

| 세그먼트 | 영역 설명 |
| :--- | :--- |
| **`.data`** | 변수가 위치하는 데이터 영역 |
| **`.code`** | 실행 가능한 명령어가 위치하는 코드 영역 |
| **`.stack`** | 런타임 스택 영역 |

[🔝 맨 위로 이동](#top)

---

<a id="sec-3"></a>
## 🔄 3. 어셈블, 링크 및 실행 (Assemble-Link-Execute Cycle)

1. **Source File (`.asm`)**: 어셈블리 언어로 작성된 소스 코드
2. **Assembler (MASM)**: 소스 코드를 기계어 오브젝트 파일(`.obj`)로 변환하고 리스팅 파일(`.lst`) 생성 가능
3. **Linker**: 오브젝트 파일과 라이브러리를 결합하여 최종 실행 파일(`.exe`) 생성

[🔝 맨 위로 이동](#top)

---

<a id="sec-4"></a>
## 📊 4. 데이터 정의 (Defining Data)

### (1) 주요 내장 데이터 타입 (Intrinsic Data Types)

| 데이터 타입 | 크기 | 설명 |
| :--- | :--- | :--- |
| **BYTE / SBYTE** | 8비트 (1바이트) | 부호 없는 / 부호 있는 8비트 정수 |
| **WORD / SWORD** | 16비트 (2바이트) | 부호 없는 / 부호 있는 16비트 정수 |
| **DWORD / SDWORD** | 32비트 (4바이트) | 부호 없는 / 부호 있는 32비트 정수 |
| **QWORD** | 64비트 (8바이트) | 64비트 정수 |
| **TBYTE** | 80비트 (10바이트) | Packed BCD 정수 |
| **REAL4 / REAL8 / REAL10** | 4 / 8 / 10바이트 | 단정밀도 / 배정밀도 / 확장정밀도 부동소수점 |

### (2) 배열 및 공간 할당 (`DUP` 연산자)
* 반복되는 데이터 할당 시 `DUP` 연산자를 사용합니다.
  * `BYTE 20 DUP(0)` : 0으로 초기화된 20바이트 공간
  * `BYTE 20 DUP(?)` : 초기화되지 않은 20바이트 공간

### (3) 미초기화 데이터 영역 (`.DATA?`)
* 초기화되지 않은 대용량 변수 선언 시 `.DATA?` 세그먼트를 사용하면 실행 파일(`.exe`)의 크기를 획기적으로 줄일 수 있습니다.

### (4) 엔디안 (Endianness)
* **Little-Endian (리틀 엔디안)**: Intel x86 계열 CPU에서 사용하며, **하위 바이트(LSB)를 낮은 메모리 주소**에 저장합니다. (산술 연산 최적화)
* **Big-Endian (빅 엔디안)**: 상위 바이트(MSB)를 낮은 메모리 주소에 저장합니다. (네트워크 전송 표준)

[🔝 맨 위로 이동](#top)

---

<a id="sec-5"></a>
## 🔑 5. 기호 상수 (Symbolic Constants)

상수 이름에 값을 바인딩하여 코드의 가독성과 유지보수성을 높입니다.

### (1) 등호 지시자 (`=`)
* 정수 표현식과 상수를 연결하며, 코드 중간에 **재정의(Redefinition)가 가능**합니다.
* 현재 위치 카운터(`$`)를 활용하여 배열이나 문자열의 크기를 자동으로 계산할 수 있습니다.

```assembly
list BYTE 10, 20, 30, 40
ListSize = ($ - list)        ; ListSize = 4
```

### (2) `EQU` 지시자
* 정수 식, 기호, 텍스트 등을 상수에 바인딩하며, **재정의가 불가능**합니다.

```assembly
PI EQU <3.1416>
pressKey EQU <"Press any key to continue...", 0>
```

### (3) `TEXTEQU` 지시자
* 텍스트 매크로를 생성하여 코드 표현을 치환할 수 있습니다.

```assembly
move TEXTEQU <mov>
setupAL TEXTEQU <move al, 10>
```

[🔝 맨 위로 이동](#top)
