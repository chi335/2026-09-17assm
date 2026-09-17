
# 💻 3. Assembly Language Fundamentals

> **어셈블리 언어 기초(Assembly Language Fundamentals)** 핵심 내용을 세부 항목별로 정돈하여 요약한 자료입니다.

---

## 📋 목차
1. [기본 언어 요소 (Basic Language Elements)](#1-기본-언어-요소-basic-language-elements)
2. [어셈블리 프로그램의 기본 구조 및 예제](#2-어셈블리-프로그램의-기본-구조-및-예제)
3. [어셈블, 링크 및 실행 (Assemble-Link-Execute Cycle)](#3-어셈블-링크-및-실행-assemble-link-execute-cycle)
4. [데이터 정의 (Defining Data)](#4-데이터-정의-defining-data)
5. [기호 상수 (Symbolic Constants)](#5-기호-상수-symbolic-constants)

---

## 1. 기본 언어 요소 (Basic Language Elements)

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
  * 32비트 float 기준: **부호 비트(S, 1bit)** + **지수부(E, 8bit)** + **가수부(M, 23bit)**
* **문자 및 문자열 리터럴**: 홑따옴표(`'`) 또는 쌍따옴표(`"`)를 사용해 정의하며, 문자열 끝에는 `0` (NUL)을 붙여 마감하기도 합니다.

### (3) 상수 정수식 (Constant Integer Expressions)
* **연산자 우선순위**: 
  `( )` (1순위) $\rightarrow$ Unary `+`, `-` (2순위) $\rightarrow$ `*`, `/`, `MOD` (3순위) $\rightarrow$ `+`, `-` (4순위)

### (4) 식별자 (Identifiers) 및 예약어 (Reserved Words)
* **식별자 규칙**: 대소문자를 구분하지 않으며, 1~247자 길이를 가집니다. 첫 글자는 영문자, `_`, `@`, `?`, `$`만 가능합니다.
* **예약어**: 레지스터 이름, 명령어 이름(`MOV`, `ADD` 등), 지시자, 데이터 타입(`BYTE`, `WORD` 등)은 식별자로 사용할 수 없습니다.

### (5) 주석 (Comments) & NOP
* **한 줄 주석**: 세미콜론(`;`) 사용
* **블록 주석**: `COMMENT ! ... !` 또는 `COMMENT & ... &` 사용
* **NOP (No Operation)**: 1바이트 크기의 명령어로, 아무 작업도 수행하지 않지만 메모리 주소 정렬(Alignment)을 통해 연산 속도를 최적화할 때 사용됩니다.

---

## 2. 어셈블리 프로그램의 기본 구조 및 예제

```assembly
.data
    sum DWORD 0             ; 32비트 변수 sum 선언 및 0으로 초기화

.code
main PROC
    mov eax, 5              ; EAX 레지스터에 5 대입
    add eax, 6              ; EAX 레지스터에 6을 더함 (EAX = 11)
    mov sum, eax            ; 결과를 sum 변수에 저장
    
    INVOKE ExitProcess, 0   ; 프로그램 종료 (운영체제로 제어 반환)
main ENDP
END main
