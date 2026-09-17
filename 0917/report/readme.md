### 1. Problem (문제)

**Q. Provide examples of three different instruction mnemonics.**
(서로 다른 명령어 니모닉 3가지의 예시를 제시하시오.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **명령어(Instruction):** 컴퓨터 CPU가 수행해야 할 동작을 나타냅니다.
  * **니모닉(Mnemonic):** `10110000`과 같은 사람이 읽기 힘든 이진수 기계어를 쉽게 알아볼 수 있도록 영단어 약어로 바꾼 기호입니다.
* **풀이 방향:**
  * 어셈블리 언어에서 자주 사용되는 대표적인 니모닉 3가지(`MOV`, `ADD`, `JMP`)를 선택하고, 각각의 기능과 간단한 예시를 설명합니다.

---

### 3. Answer (정답)

**1. `MOV` (데이터 이동)**
* **설명:** 한 위치(레지스터 또는 메모리)에서 다른 위치로 데이터를 복사하거나 이동합니다.
* **예시:** `MOV AX, BX` (BX 레지스터의 값을 AX 레지스터로 복사)

**2. `ADD` (덧셈 연산)**
* **설명:** 두 값을 더한 뒤, 그 결과를 지정된 장소에 저장합니다.
* **예시:** `ADD AX, 5` (AX 레지스터에 있는 값에 5를 더함)

**3. `JMP` (점프 / 실행 흐름 이동)**
* **설명:** 조건 없이 지정된 메모리 주소나 라벨의 위치로 실행 순서를 옮깁니다.
* **예시:** `JMP MAIN_LOOP` (`MAIN_LOOP`라는 라벨 위치로 이동)


---
### 2. Problem (문제)

**Q. What is a calling convention, and how is it used in assembly language declarations?**
(호출 규약(Calling convention)이란 무엇이며, 어셈블리 언어 선언에서 어떻게 사용되나요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **호출 규약(Calling Convention):** 함수를 호출하는 쪽(Caller)과 호출받는 함수(Callee) 사이에서 데이터(인자, 반환값 등)를 어떻게 주고받을지 정한 **약속/규칙**입니다.
  * 어셈블리 언어에서는 고수준 언어(C/C++ 등)와 달리 인자 전달이나 스택 정리가 자동으로 이루어지지 않으므로, 두 함수가 서로 통신하기 위해 이 규약을 반드시 엄격하게 준수해야 합니다.
* **풀이 방향:**
  1. 호출 규약의 정의와 포함하는 주요 규칙들을 설명합니다.
  2. 어셈블리 언어 선언 및 코드 작성 시 어떻게 적용되고 사용되는지 정리합니다.

---

### 3. Answer (정답)

**1. 호출 규약(Calling Convention)이란?**
* 함수 호출 시 **매개변수(인자) 전달 방식**, **반환값 전달 위치**, **스택 정리 주체** 등을 정의한 통신 규칙입니다.

**2. 호출 규약이 결정하는 주요 항목:**
* **매개변수 전달 방식:** 인자를 스택(Stack)에 쌓아 전달할지, 특정 레지스터(예: `RCX`, `RDX` 등)에 넣어서 전달할지 정합니다.
* **스택 정리 주체:** 함수 실행이 끝난 후 사용된 스택 메모리를 호출한 함수(Caller)가 정리할지, 호출받은 함수(Callee)가 정리할지 결정합니다.
* **레지스터 보존:** 함수 내부에서 값을 변경해도 되는 레지스터와, 함수 호출 전의 값을 그대로 유지해야 하는 레지스터를 구분합니다.

**3. 어셈블리 언어 선언에서의 활용 방식:**
* **지시어/키워드 선언:** 어셈블리 함수나 외부 함수를 선언할 때 `cdecl`, `stdcall`, `fastcall` 등의 지시어를 명시하여 어떤 규칙을 사용할지 지정합니다.
* **규약에 맞는 코드 구현:**
  * 예를 들어 **`cdecl`** 규약 사용 시: 인자를 오른쪽에서 왼쪽 순서로 스택에 `PUSH`하고, 함수 종료 후 호출한 쪽(Caller)에서 스택 포인터(`ESP`)를 직접 복구합니다.
  * **`stdcall`** 규약 사용 시: 인자는 동일하게 스택으로 전달하지만, 호출받은 함수(Callee)가 종료될 때 `RET N` 명령어를 사용하여 스스로 스택을 정리합니다.
 

---

### 3. Problem (문제)

**Q. How do you reserve space for the stack in a program?**
(프로그램에서 스택을 위한 공간을 어떻게 확보/예약하나요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **스택(Stack):** 지역 변수 저장, 함수 호출 시 돌아갈 주소(Return Address) 저장, 매개변수 전달 등에 사용되는 메모리 영역입니다.
  * **공간 확보 방식:** 어셈블리 프로그램에서 스택 공간을 확보하는 방법은 크게 **어셈블러 지시어(Directive)를 통한 정적 선언**, **실행 중 스택 포인터(SP/ESP/RSP) 조작**, 그리고 **링커(Linker) 설정을 통한 확보** 방식으로 나뉩니다.
* **풀이 방향:**
  * 어셈블러 지시어를 사용해 선언하는 대표적인 예시들과, 함수 내부에서 런타임에 공간을 확보하는 방식을 함께 설명합니다.

---

### 3. Answer (정답)

**1. 어셈블러 지시어(Directive)를 사용하는 방법**
* **MASM (Microsoft Macro Assembler):**
  * `.STACK` 지시어를 사용하여 프로그램 시작 시 스택 크기를 바이트 단위로 직접 지정합니다.
  * 예시: `.STACK 4096` (4096바이트(4KB) 크기의 스택 공간 예약)
* **NASM (Netwide Assembler):**
  * `.bss` 섹션(초기화되지 않은 데이터 영역)에서 `resb` (Reserve Bytes) 지시어를 사용하여 메모리 블록을 확보한 뒤 스택으로 사용합니다.
  * 예시:
    ```assembly
    section .bss
    stack_space: resb 4096  ; 4KB 공간 예약
    stack_top:             ; 스택의 맨 위(시작 지점)를 가리킴
    ```

**2. 실행 시간(Runtime)에 스택 포인터를 조작하는 방법**
* 함수 내부에서 지역 변수 등을 위한 추가 공간이 필요할 때, 스택 포인터 레지스터(`ESP` 또는 `RSP`)에서 값을 빼서(`SUB`) 공간을 확보합니다. (스택은 높은 주소에서 낮은 주소 방향으로 확장되기 때문입니다.)
* 예시: `SUB RSP, 32` (스택 포인터를 32바이트 낮춰서 공간 확보)

**3. 링커(Linker) 옵션을 사용하는 방법**
* 코드 내에서 직접 지정하지 않고, 컴파일/링크 단계에서 링커 옵션을 통해 프로그램 전체의 기본 스택 크기를 설정할 수도 있습니다.
* 예시 (MSVC 링커): `/STACK:reserve_size` 옵션 지정


---

### 4. Problem (문제)

**Q. Explain why the term assembler language is not quite correct.**
('어셈블러 언어(Assembler language)'라는 용어가 아주 정확하지는 않은 이유를 설명하시오.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **어셈블리(Assembly):** 사람이 읽을 수 있는 형태의 저수준 **프로그래밍 언어** 그 자체를 의미합니다.
  * **어셈블러(Assembler):** 어셈블리 언어로 작성된 소스 코드를 컴퓨터가 이해할 수 있는 기계어(이진수)로 번역해 주는 **변환 프로그램(도구)**입니다.
* **풀이 방향:**
  * '언어(Language)'의 개념과 '번역 프로그램(Tool)'의 개념을 구분하여, 왜 '어셈블러 언어'라는 표현이 기술적으로 부적절한지 비교를 통해 설명합니다.

---

### 3. Answer (정답)

**1. 도구(Tool)와 언어(Language)의 혼동**
* **'어셈블러(Assembler)'**는 소스 코드를 기계어로 번역하는 **소프트웨어/도구**의 이름입니다.
* 반면 **'어셈블리(Assembly)'**는 작성하는 **프로그래밍 언어**의 이름입니다.
* 따라서 '어셈블러 언어'라고 부르는 것은 언어의 명칭과 이를 번역하는 도구의 명칭을 혼동한 표현입니다.

**2. 다른 언어에 비유한 예시**
* 'C 언어'를 번역하는 도구가 'C 컴파일러(Compiler)'라고 해서 C 언어를 '컴파일러 언어'라고 부르지 않는 것과 같습니다.
* 마찬가지로, 어셈블러가 번역하는 언어이므로 올바른 명칭은 **'어셈블리 언어(Assembly language)'**가 맞습니다.

*(참고: 과거 일부 컴퓨터 제조사(예: IBM)의 매뉴얼에서 'Assembler Language'라는 용어를 관습적으로 사용하기도 했으나, 컴퓨터 공학적으로 더 엄밀하고 올바른 용어는 'Assembly Language'입니다.)*


---


### 5. Problem (문제)

**Q. Explain the difference between big endian and little endian. Also, look up the origins of this term on the Web.**
(빅 엔디언과 리틀 엔디언의 차이점을 설명하시오. 또한, 웹에서 이 용어의 유래를 찾아 설명하시오.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **엔디언(Endianness):** 컴퓨터 메모리에 연속된 여러 바이트의 데이터(예: 4바이트 정수)를 배열하여 저장하는 **바이트 순서(Byte Order)**를 의미합니다.
* **풀이 방향:**
  1. **빅 엔디언**과 **리틀 엔디언**의 메모리 저장 방식 차이를 예시 수치(`0x12345678`)를 들어 명확히 구분합니다.
  2. 웹 검색 결과를 바탕으로 컴퓨터 분야에 이 용어가 도입된 **문학적 유래**와 **컴퓨터 학자의 풍자 배경**을 정리합니다.

---

### 3. Answer (정답)

**1. 빅 엔디언과 리틀 엔디언의 차이점**

* **빅 엔디언 (Big-Endian):**
  * **개념:** 상위 바이트(MSB, 가장 큰 값 쪽)를 메모리의 **낮은 주소**부터 순서대로 저장하는 방식입니다.
  * **특징:** 사람이 숫자를 왼쪽에서 오른쪽으로 읽는 방식과 같아서 가독성이 뛰어납니다. (네트워크 프로토콜 표준으로 주로 사용)
  * **예시 (`0x12345678` 저장 시):**
    * 주소 `0x00`: `12`
    * 주소 `0x01`: `34`
    * 주소 `0x02`: `56`
    * 주소 `0x03`: `78`

* **리틀 엔디언 (Little-Endian):**
  * **개념:** 하위 바이트(LSB, 가장 작은 값 쪽)를 메모리의 **낮은 주소**부터 순서대로 저장하는 방식입니다.
  * **특징:** 수치 연산(산술 연산) 시 하위 바이트부터 바로 처리할 수 있어 CPU 연산 효율이 좋습니다. (Intel x86/AMD x64 프로세서 등 현대 PC 시스템의 기본 방식)
  * **예시 (`0x12345678` 저장 시):**
    * 주소 `0x00`: `78`
    * 주소 `0x01`: `56`
    * 주소 `0x02`: `34`
    * 주소 `0x03`: `12`

---

**2. 용어의 유래 (Origins)**

* **문학적 출처:**
  * 조너선 스위프트(Jonathan Swift)의 1726년 소설 **《걸리버 여행기》(Gulliver's Travels)**에서 유래했습니다.
  * 소설 속 소인국(릴리퍼트)에서는 삶은 계란을 까먹을 때 **'큰 쪽 끝(Big-end)'**을 깨야 한다는 파벌(Big-Endians)과 **'작은 쪽 끝(Little-end)'**을 깨야 한다는 파벌(Little-Endians) 사이에 6번의 구데타와 전쟁이 일어날 정도로 쓸데없는 논쟁이 벌어집니다.

* **컴퓨터 공학으로의 도입:**
  * 1980년 컴퓨터 학자 **대니 코엔(Danny Cohen)**이 논문 *"On Holy Wars and a Plea for Peace"* (성전과 평화를 위한 탄원)에서 이 단어를 처음 도입했습니다.
  * 그는 바이트 순서 중 어느 쪽이 절대적으로 우월한지에 대한 컴퓨터 학계의 무의미하고 소모적인 논쟁을 계란 깨는 방식에 비유하며, "서로 방식만 다를 뿐 정답은 없으니 무의미한 싸움을 멈추자"는 메시지를 전달하기 위해 이 용어를 사용하기 시작했습니다.
 

---

### 6. Problem (문제)

**Q. Why might you use a symbolic constant rather than an integer literal in your code?**
(코드에서 정수 리터럴 대신 기호 상수를 사용하는 이유는 무엇인가요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **정수 리터럴 (Integer Literal):** 코드에 `100`, `3.14`, `50`과 같이 숫자를 직접 적어 넣는 방식입니다. (의미를 알기 어려운 '매직 넘버'가 되기 쉽습니다.)
  * **기호 상수 (Symbolic Constant):** `MAX_USERS EQU 100` 또는 `const int MAX_USERS = 100`처럼 숫자 값에 의미 있는 이름을 부여하여 사용하는 방식입니다.
* **풀이 방향:**
  * 가독성, 유지보수성, 오류 예방 등 소프트웨어 공학 관점에서 기호 상수가 제공하는 주요 장점들을 정리합니다.

---

### 3. Answer (정답)

**1. 코드 가독성 향상 (Readability & Meaning)**
* 숫자 `100`이 단독으로 쓰이면 이것이 '최대 사용자 수'인지, '배열의 크기'인지, '시험 만점 점수'인지 알기 어렵습니다.
* `MAX_USERS`와 같이 의미 있는 이름의 기호 상수를 사용하면 코드가 스스로의 의미를 설명(Self-documenting)하게 되어 읽기 쉬워집니다.

**2. 유지보수 용이성 (Maintainability)**
* 특정 설정값(예: 배열 크기)을 변경해야 할 때, 정수 리터럴을 사용했다면 코드 전체에서 숫자 `100`을 일일이 찾아 다 수정해야 합니다.
* 기호 상수를 사용하면 상수 선언부의 값 한 곳만 수정하면 되므로 코드 변경이 매우 간편해집니다.

**3. 오타 및 오류 방지 (Error Reduction)**
* 숫자를 일일이 직접 입력하다 보면 `1000` 대신 `100`을 적는 등의 오타가 발생하기 쉽습니다.
* 기호 상수를 미리 정의해 두면 오타가 발생했을 때 컴파일러나 어셈블러가 즉시 에러를 감지하여 버그를 미리 예방할 수 있습니다.


---

### 7. Problem (문제)

**Q. How is a source file different from a listing file?**
(소스 파일과 리스팅 파일의 차이점은 무엇인가요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **소스 파일 (Source File):** 프로그래머가 텍스트 에디터로 직접 작성한 텍스트 파일(예: `.asm` 파일)입니다.
  * **리스팅 파일 (Listing File):** 어셈블러가 소스 코드를 번역(어셈블)하는 과정에서 생성해 주는 분석용 출력 파일(예: `.lst` 파일)입니다.
* **풀이 방향:**
  * 작성 주체, 포함 내용, 생성 목적의 측면에서 두 파일의 차이점을 명확히 비교하여 설명합니다.

---

### 3. Answer (정답)

**1. 소스 파일 (Source File)**
* **생성 방식:** 프로그래머가 직접 작성합니다. (예: `main.asm`)
* **주요 내용:** 프로그래머가 입력한 어셈블리 명령어, 지시어, 주석(Comment)만 포함되어 있습니다.
* **주요 목적:** 프로그램의 로직을 작성하고 수정하기 위한 기본 코드입니다.

**2. 리스팅 파일 (Listing File)**
* **생성 방식:** 어셈블러(Assembler)가 번역 과정에서 자동으로 생성합니다. (예: `main.lst`)
* **주요 내용:**
  * **원본 소스 코드**
  * 변환된 **기계어 코드(16진수 바이트 값)**
  * 각 명령어의 **메모리 오프셋 주소(Offset Address)**
  * 심볼 테이블(Symbol Table, 변수 및 라벨 정보) 및 경고/에러 메시지
* **주요 목적:** 
  * 번역된 기계어와 주소 배치를 확인하여 **디버깅(Debugging)**을 용이하게 합니다.
  * 어셈블러가 각 명령어를 어떻게 분석하고 메모리에 배치했는지 상세히 검토할 때 사용됩니다.
 

---

### 8. Problem (문제)

**Q. How are data labels and code labels different?**
(데이터 라벨과 코드 라벨의 차이점은 무엇인가요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **라벨(Label):** 어셈블리 언어에서 특정 메모리 주소에 사람이 이해하기 쉽게 이름을 붙여 놓은 **식별자(Identifier)**입니다.
  * **차이점 발생 이유:** 라벨이 메모리의 어떤 영역(데이터 영역 vs 실행 코드 영역)을 가리키느냐에 따라 역할과 사용 방식이 달라집니다.
* **풀이 방향:**
  * 데이터 라벨과 코드 라벨 각각의 정의, 문법적 차이, 메모리 내 위치, 그리고 사용되는 목적을 명확하게 구분하여 설명합니다.

---

### 3. Answer (정답)

**1. 데이터 라벨 (Data Label)**
* **위치:** 데이터 세그먼트/섹션(`.data`)에 위치합니다.
* **역할:** 프로그램에서 사용하는 **변수나 상수가 저장된 메모리 주소**를 가리킵니다.
* **문법적 특징:** 라벨 이름 바로 뒤에 데이터 타입/크기 지시어(`BYTE`, `WORD`, `DWORD` 등)와 초기값이 작성됩니다. (일반적으로 콜론`:`을 붙이지 않습니다.)
* **예시:** `count DWORD 0` (`count`라는 라벨은 정수 0이 저장된 메모리 위치를 가리킴)

**2. 코드 라벨 (Code Label)**
* **위치:** 코드 세그먼트/섹션(`.code`)에 위치합니다.
* **역할:** CPU가 실행할 **실행 명령어(Instruction)의 메모리 주소**를 가리킵니다.
* **문법적 특징:** 라벨 이름 뒤에 **콜론(`:`)**을 붙여서 표기합니다.
* **주요 용도:** `JMP`(점프), `LOOP`(반복), `CALL`(함수 호출) 등의 명령어에서 실행 흐름(순서)을 해당 위치로 이동시킬 때 목적지로 사용됩니다.
* **예시:**
  ```assembly
  L1:
      ADD EAX, 1
      JMP L1       ; 'L1:' 라벨 위치로 실행 위치를 이동함  ```


---

### 9. Problem (문제)

**Q. (True/False): An identifier cannot begin with a numeric digit.**
(참/거짓: 식별자(Identifier)는 숫자로 시작할 수 없다.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **식별자(Identifier):** 어셈블리 언어에서 변수, 라벨, 상수, 프로시저(함수) 등에 붙이는 이름을 의미합니다.
* **식별자 명명 규칙 (x86 / MASM 기준):**
  1. 첫 번째 문자는 **영문자(A-Z, a-z)**, **언더스코어(`_`)**, **특수문자(`@`, `$`, `?`)**로 시작해야 합니다.
  2. 첫 번째 문자 이후에는 숫자를 포함할 수 있습니다.
  3. **숫자(0-9)로 시작하는 식별자는 허용되지 않습니다.** (어셈블러가 숫자로 시작하는 단어를 식별자가 아닌 '수치 리터럴/값'으로 해석하기 때문입니다.)

---

### 3. Answer (정답)

**정답: True (참)**

* **이유:** 어셈블리 언어를 비롯한 대부분의 프로그래밍 언어에서 식별자(이름)의 첫 번째 문자로 숫자를 사용하는 것은 문법적으로 금지되어 있습니다. (예: `1variable` (X) / `variable1` (O))


---

### 10. Problem (문제)

**Q. (True/False): A hexadecimal literal may be written as 0x3A.**
(참/거짓: 16진수 리터럴은 0x3A와 같이 작성할 수 있다.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **어셈블리 언어(MASM 기준)의 16진수 표기법:**
    * x86 MASM(Microsoft Macro Assembler) 어셈블리에서는 16진수 숫자 뒤에 접미사 **`h`** 또는 **`H`**를 붙여서 표기합니다. (예: `3Ah`, `0FFh`)
    * 접두사 `0x`를 붙이는 방식(`0x3A`)은 **C/C++ 또는 Java**와 같은 고수준 언어의 표기법입니다.
* **풀이 방향:**
  * 이 질문은 어셈블리 언어 교재(Kip Irvine의 x86 Assembly 등)의 단원 평가 문제로, 어셈블러(MASM) 문법에 맞는지 묻는 문제입니다.
  * MASM 어셈블러에서는 `0x3A` 형태를 구문 에러(Syntax Error)로 처리하므로 거짓(False)이 됩니다.

---

### 3. Answer (정답)

**정답: False (거짓)**

* **이유:** 
  * MASM 어셈블리 언어에서 16진수는 숫자 뒤에 `h`를 붙여 **`3Ah`** (또는 맨 앞 문자가 알파벳일 경우 `0`을 붙여 `03Ah`)와 같이 표기해야 합니다.
  * `0x3A`와 같은 `0x` 접두사 표기법은 C/C++ 언어 방식이며, MASM 어셈블러에서는 올바른 16진수 리터럴로 인식되지 않습니다.

 
---

### 11. Problem (문제)

**Q. (True/False): Assembly language directives execute at runtime.**
(참/거짓: 어셈블리 언어 지시어(Directives)는 런타임(실행 시간)에 실행된다.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **지시어 (Directives):** `.data`, `.code`, `BYTE`, `DWORD`, `PROC` 등과 같이 어셈블러(Assembler)에게 프로그램을 어셈블(번역)하는 방식을 지시하는 명령입니다.
  * **명령어 (Instructions):** `MOV`, `ADD`, `SUB`, `JMP` 등 CPU가 직접 실행하는 기계어로 번역되는 명령입니다.
* **시점의 차이:**
  * **지시어(Directives):** 어셈블러가 코드를 번역하는 **어셈블 시점(Assembly time / Compile time)**에 처리됩니다.
  * **명령어(Instructions):** 프로그램이 실제로 메모리에 로드되어 실행되는 **런타임(Runtime)**에 CPU에 의해 실행됩니다.

---

### 3. Answer (정답)

**정답: False (거짓)**

* **이유:** 지시어(Directive)는 CPU가 실행하는 기계어로 번역되는 코드가 아니며, 어셈블러가 프로그램을 번역하고 메모리를 배치하는 **어셈블 시점(Assembly time)**에만 동작합니다. 런타임(Runtime)에 CPU에 의해 실행되는 것은 지시어가 아니라 **명령어(Instruction)**입니다.


---

### 12. Problem (문제)

**Q. (True/False): Assembly language directives can be written in any combination of uppercase and lowercase letters.**
(참/거짓: 어셈블리 언어 지시어(Directives)는 대문자와 소문자의 어떠한 조합으로도 작성할 수 있다.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **대소문자 구별(Case Sensitivity):** 언어 문법에서 대문자와 소문자를 서로 다른 문자로 취급하는지 여부를 의미합니다.
  * **MASM(어셈블러)의 특징:** 어셈블리 언어(특히 표준 x86 MASM)는 기본적으로 **대소문자를 구별하지 않습니다(Case-insensitive)**.
* **적용 예시:**
  * 지시어인 `.data`, `.DATA`, `.Data`는 모두 동일하게 인식됩니다.
  * `DWORD`, `dword`, `Dword` 역시 모두 동일하게 어셈블러에 의해 처리됩니다.

---

### 3. Answer (정답)

**정답: True (참)**

* **이유:** 어셈블리 언어(MASM)는 대소문자를 구분하지 않으므로, 지시어(Directive)를 대문자, 소문자, 또는 대소문자가 혼합된 형태(`.Data`, `DwoRd` 등)로 자유롭게 입력해도 어셈블러가 올바르게 인식하고 처리합니다.


---

### 13. Problem (문제)

**Q. Name the four basic parts of an assembly language instruction.**
(어셈블리 언어 명령어 문장의 기본 4가지 구성 요소를 작성하세요.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * 어셈블리 언어의 한 줄(Instruction Statement)은 일정한 형식에 따라 최대 4개의 부분으로 나뉩니다.
  * **기본 문법 구조:** `[Label:] Mnemonic [Operand(s)] [; Comment]`
* **각 구성 요소:**
  1. **라벨 (Label):** (선택) 실행할 명령어의 위치(메모리 주소)를 나타냅니다.
  2. **연산자 / 니모닉 (Mnemonic):** (필수) 수행할 동작을 지정하는 어셈블리 명령 단어입니다.
  3. **피연산자 (Operand):** (필수/선택) 연산에 사용될 데이터, 레지스터, 메모리 주소 등입니다.
  4. **주석 (Comment):** (선택) 코드의 설명을 적는 부분으로 세미콜론(`;`) 뒤에 작성합니다.

---

### 3. Answer (정답)

**어셈블리 명령어의 4가지 기본 구성 요소:**

1. **Label (라벨)** - 선택 사항 (`:`)
2. **Instruction Mnemonic (니모닉 / 명령어)** - 필수 사항 (예: `MOV`, `ADD`, `JMP` 등)
3. **Operand(s) (피연산자)** - 명령어에 따라 필수 또는 선택 사항 (예: `EAX`, `count` 등)
4. **Comment (주석)** - 선택 사항 (`;`로 시작)

---

**💡 예시 코드 분석:**
```assembly
target:   MOV   EAX, 1   ; EAX 레지스터에 1을 대입
-------  -----  ------  ------------------------
  ①       ②       ③                ④
```


---

### 14. Problem (문제)

**Q. (True/False): MOV is an example of an instruction mnemonic.**
(참/거짓: MOV는 명령어 니모닉(Instruction Mnemonic)의 예시이다.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **니모닉 (Instruction Mnemonic):** CPU가 실행할 기계어 명령(Operation Code)을 사람이 읽고 이해하기 쉽게 만든 **영문 약어 연산자**입니다.
  * `MOV`는 "Move"의 약자로, 한 공간에서 다른 공간으로 데이터를 복사(이동)할 때 사용하는 어셈블리 언어의 대표적인 명령어 연산자입니다.

---

### 3. Answer (정답)

**정답: True (참)**

* **이유:** `MOV`는 어셈블리 언어에서 데이터를 이동/복사하는 동작을 나타내는 대표적인 **명령어 니모닉(Instruction Mnemonic)**입니다. (다른 예: `ADD`, `SUB`, `JMP`, `MUL` 등)


---

### 15. Problem (문제)

**Q. (True/False): A code label is followed by a colon (:), but a data label does not end with a colon.**
(참/거짓: 코드 라벨은 뒤에 콜론(:)이 붙지만, 데이터 라벨은 콜론으로 끝나지 않는다.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **코드 라벨(Code Label):** 실행 영역(`.code`)에서 점프나 루프 등의 목적지로 사용되며, **이름 뒤에 반드시 콜론(`:`)을 붙여야 합니다.** (예: `target:`)
  * **데이터 라벨(Data Label):** 데이터 영역(`.data`)에서 변수 역할을 하며, **콜론없이** 이름 뒤에 데이터 타입 지시어가 바로 옵니다. (예: `count DWORD 0`)
* **8번 문제와의 연관성:** 앞에서 다루었던 데이터 라벨과 코드 라벨의 문법적 주요 차이점에 대한 묻는 문제 항목입니다.

---

### 3. Answer (정답)

**정답: True (참)**

* **이유:** standard MASM 어셈블리 규칙상, 실행 코드 섹션에서 사용하는 **코드 라벨은 라벨명 뒤에 콜론(`:`)**을 붙여 선언하지만, 변수를 선언하는 **데이터 라벨은 콜론 없이** 타입 지정자(`BYTE`, `DWORD` 등)와 함께 선언합니다.



---

### 16. Problem (문제)

**Q. Show an example of a block comment.**
(블록 주석(여러 줄 주석)의 예시를 보여주세요.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **단일 행 주석 (Single-line comment):** 세미콜론(`;`)을 사용하여 해당 줄만 주석으로 처리합니다.
  * **블록 주석 (Block comment):** 여러 줄에 걸친 주석을 작성할 때 사용합니다.
* **MASM 어셈블리 문법:**
  * MASM 어셈블리에서는 **`COMMENT` 지시어**와 **사용자가 지정한 구분자(Delimiter문자, 예: `!`, `%`, `&` 등)**를 사용하여 블록 주석을 작성합니다.
  * `COMMENT` 뒤에 오는 첫 번째 문자가 구분자가 되며, 동일한 문자가 다시 나올 때까지의 모든 내용(여러 줄)이 주석으로 처리됩니다.

---

### 3. Answer (정답)

**어셈블리 언어 블록 주석 예시:**

```assembly
COMMENT !
    This is a block comment.
    It can span multiple lines.
    Assembler ignores everything inside this block.
!
```



---
### 17. Problem (문제)

**Q. Why is it not a good idea to use numeric addresses when writing instructions that access variables?**
(변수에 접근하는 명령어를 작성할 때 숫자 메모리 주소(Numeric addresses)를 직접 사용하는 것이 좋은 방법이 아닌 이유는 무엇인가요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **숫자 주소(Direct Numeric Address):** `MOV EAX, [00404000h]` 처럼 실제 메모리 오프셋/주소 숫자를 직접 명시하는 방식입니다.
  * **상징적 라벨(Symbolic Label / 변수명):** `MOV EAX, myVar` 처럼 주소 대신 변수 이름을 사용하는 방식입니다.
* **숫자 주소를 직접 쓸 때 발생하는 문제점:**
  1. **유지보수의 어려움:** 코드나 데이터 영역에 새로운 변수를 추가하거나 삭제하면 뒤따르는 변수들의 메모리 주소가 모두 이동하게 되어, 하드코딩된 숫자 주소를 일일이 수정해야 합니다.
  2. **재배치(Relocation) 및 가상 메모리 문제:** 프로그램이 메모리에 로드될 때 매번 동일한 절대 주소에 로드된다는 보장이 없으므로, 하드코딩된 주소는 오류(Crash)를 일으킬 수 있습니다.
  3. **가독성 저하:** 숫자 주소만 봐서는 해당 주소에 어떤 데이터가 들어있는지 의미를 파악하기 어렵습니다.

---

### 3. Answer (정답)

**이유 (Key Reasons):**

1. **코드 변경 및 유지보수의 어려움 (Code Modification & Maintenance):**
   * 새로운 변수나 코드가 추가/삭제될 때마다 메모리 배치가 달라지므로, 직접 하드코딩한 모든 숫자 주소를 사람이 수동으로 찾아서 수정해야 합니다.

2. **메모리 재배치 문제 (Address Relocation):**
   * 운영체제가 프로그램을 실행할 때 메모리의 어느 위치(주소)에 로드할지 매번 달라질 수 있으므로, 고정된 숫자 주소를 사용하면 잘못된 메모리에 접근하게 됩니다.

3. **가독성 및 오류 방지 (Readability & Error Prevention):**
   * 변수 이름(Symbolic Label)을 사용하면 어셈블러와 링크가 주소 계산을 자동으로 처리해 주며, 코드의 의미를 파악하기 쉽고 주소 계산 실수를 방지할 수 있습니다.



---

### 18. Problem (문제)

**Q. What type of argument must be passed to the ExitProcess procedure?**
(ExitProcess 프로시저에 전달해야 하는 인자(Argument)의 타입은 무엇인가요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **`ExitProcess`:** Windows API 함수 중 하나로, 현재 실행 중인 어셈블리 프로그램을 정상적으로 종료하고 운영체제(OS)로 제어를 반환하는 역할을 합니다.
  * **전달 인자 (Return/Exit Code):** 
    * `ExitProcess`는 프로그램이 종료될 때 OS에 전달할 **종료 코드(Return Code / Exit Code)**를 인자로 받습니다.
    * 이 종료 코드는 **32비트 정수 타입(DWORD 또는 UINT)**이어야 합니다.
    * 일반적으로 정상 종료 시 `0`을 전달하며, 오류가 발생했을 때는 0이 아닌 에러 코드를 전달합니다.

---

### 3. Answer (정답)

**정답: 32비트 정수 (DWORD / 32-bit integer / UINT / Return code)**

* **상세 설명:** `ExitProcess` 프로시저는 프로그램의 종료 상태를 나타내는 **32비트 무부호 정수(DWORD / doubleword)** 값(일반적으로 정상 종료를 의미하는 `0`)을 인자로 요구합니다.

---

**💡 예시 코드 (MASM 기준):**
```assembly
INVOKE ExitProcess, 0   ; 0(DWORD)을 인자로 전달하여 프로그램 정상 종료
```


---
### 19. Problem (문제)

**Q. Which directive ends a procedure?**
(프로시저(Procedure)를 종료하는 지시어(Directive)는 무엇인가요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **프로시저 (Procedure):** 다른 고수준 언어의 '함수(Function)'나 '메소드(Method)'에 해당하는 어셈블리 언어의 블록 단위입니다.
  * **선언 구조:**
    * 프로시저의 **시작**: `PROC` 지시어를 사용합니다.
    * 프로시저의 **끝**: **`ENDP`** 지시어를 사용합니다. (`END Procedure`의 약자)

---

### 3. Answer (정답)

**정답: ENDP**

* **설명:** 어셈블리 언어(MASM)에서 프로시저의 끝을 정의할 때는 **`ENDP`** 지시어를 사용합니다.

---

**💡 예시 코드:**
```assembly
main PROC          ; main 프로시저 시작
    ; 실행할 코드...
    exit
main ENDP          ; main 프로시저 종료 (ENDP 사용)
```


---

### 20. Problem (문제)

**Q. In 32-bit mode, what is the purpose of the identifier in the END directive?**
(32비트 모드에서 END 지시어 뒤에 붙는 식별자(Identifier)의 목적은 무엇인가요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **`END` 지시어:** 어셈블리 소스 파일의 맨 마지막 줄에 작성하여 어셈블러에게 파일의 끝임을 알립니다.
  * **`END` 뒤의 식별자(Identifier):** 보통 `END main`과 같이 작성합니다.
* **식별자의 역할:**
  * 이 식별자는 프로그램이 로드되어 실행될 때 **가장 먼저 실행을 시작할 지점(Entry Point, 엔트리 포인트)**이 되는 프로시저의 이름을 운영체제와 링커(Linker)에게 알려주는 역할을 합니다.

---

### 3. Answer (정답)

**정답: 프로그램의 시작점(Entry Point)을 지정하기 위해 사용합니다.**

* **상세 설명:** `END main`과 같이 `END` 지시어 뒤에 작성된 식별자는 프로그램이 실행될 때 최초로 제어가 전달되어 실행을 시작할 **진입점/시작점(Entry Point)** 프로시저를 지정해 줍니다.

---

**💡 예시 코드:**
```assembly
main PROC
    ; 프로그램 실행 코드...
    INVOKE ExitProcess, 0
main ENDP

END main    ; 'main' 프로시저가 프로그램의 시작점(Entry Point)임을 지정
```


---

### 21. Problem (문제)

**Q. What is the purpose of the PROTO directive?**
(PROTO 지시어의 목적은 무엇인가요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **`PROTO` (Prototype):** C/C++ 언어의 '함수 선언(Function Prototype)'과 동일한 역할을 하는 어셈블리 지시어입니다.
  * **주요 역할:**
    1. 어셈블러에게 **호출할 프로시저(함수)의 이름, 매개변수(Parameter)의 개수 및 타입**을 미리 알려줍니다.
    2. **`INVOKE` 지시어**를 사용하여 프로시저를 호출할 때, 전달하는 인자(Argument)가 올바른 타입과 개수인지 어셈블러가 **타입 검사(Type Checking)**를 할 수 있게 도와줍니다.

---

### 3. Answer (정답)

**정답: 프로시저의 프로토타입(선언부)을 정의하여 `INVOKE` 호출 시 매개변수의 개수와 타입을 검사할 수 있도록 하기 위해서입니다.**

* **상세 설명:** `PROTO` 지시어는 외부 함수(예: Windows API)나 나중에 정의될 프로시저의 이름과 매개변수 리스트를 미리 선언함으로써, 어셈블러가 `INVOKE` 명령을 처리할 때 인자 타입을 검사하고 적절한 호출 코드를 생성할 수 있게 해줍니다.

---

**💡 예시 코드:**
```assembly
; ExitProcess 프로시저의 프로토타입 선언 (ExitCode라는 DWORD 매개변수 1개를 받음)
ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
    ; PROTO 선언 덕분에 ExitProcess 호출 시 매개변수 검증 가능
    INVOKE ExitProcess, 0
main ENDP
```


---


---

### 22. Problem (문제)

**Q. (True/False): An Object file is produced by the Linker.**
(참/거짓: 오브젝트 파일(Object file, .obj)은 링커(Linker)에 의해 생성된다.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **어셈블러 (Assembler):** 소스 코드(`.asm`)를 번역하여 **오브젝트 파일(`.obj`)**을 생성합니다.
  * **링커 (Linker):** 하나 이상의 오브젝트 파일(`.obj`)과 라이브러리(`.lib`)들을 결합하여 최종 **실행 파일(`.exe`)**을 생성합니다.

---

### 3. Answer (정답)

**정답: False (거짓)**

* **이유:** 오브젝트 파일(`.obj`)을 생성하는 것은 **어셈블러(Assembler)**입니다. 링커(Linker)는 이렇게 생성된 오브젝트 파일들을 묶어서 **실행 파일(Executable file, `.exe`)**을 만들어냅니다.

---

**💡 빌드 과정 요약:**
```text
[ 소스 코드 (.asm) ] 
       │
       ▼ (어셈블러가 변환)
[ 오브젝트 파일 (.obj) ] 
       │
       ▼ (링커가 결합)
[ 실행 파일 (.exe) ]
```


---

### 23. Problem (문제)

**Q. (True/False): A Listing file is produced by the Assembler.**
(참/거짓: 리스팅 파일(Listing file, .lst)은 어셈블러(Assembler)에 의해 생성된다.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **리스팅 파일 (Listing file, `.lst`):** 어셈블리 소스 코드, 대응하는 기계어 16진수 바이트, 메모리 오프셋 주소, 기호 테이블(Symbol Table) 등을 한눈에 볼 수 있도록 나열한 텍스트 파일입니다.
  * **생성 주체:** 소스 파일(`.asm`)을 어셈블(번역)할 때 옵션(예: `/Fl`)을 주면 **어셈블러(Assembler)**가 오브젝트 파일과 함께 리스팅 파일을 생성해 줍니다.

---

### 3. Answer (정답)

**정답: True (참)**

* **이유:** 리스팅 파일(`.lst`)은 **어셈블러(Assembler)**가 소스 코드를 기계어로 번역하는 과정에서 생성하며, 코드의 메모리 주소 및 기계어 변환 결과를 확인할 수 있는 상세 보고서 역할을 합니다.


---

### 24. Problem (문제)

**Q. (True/False): A link library is added to a program just before producing an Executable file.**
(참/거짓: 링크 라이브러리(Link library)는 실행 파일(Executable file)이 생성되기 바로 직전에 프로그램에 추가된다.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **링크 라이브러리 (Link Library, `.lib`):** 자주 사용되는 공통 프로시저(함수)들이 미리 컴파일되어 모여 있는 파일입니다.
  * **빌드 과정 (Link Stage):**
    1. 어셈블러가 소스 코드(`.asm`)를 오브젝트 파일(`.obj`)로 변환합니다.
    2. **링커(Linker)**가 오브젝트 파일과 필요한 **링크 라이브러리(`.lib`)**들을 하나로 결합(Link)합니다.
    3. 결합이 완료되면 최종 **실행 파일(`.exe`)**이 생성됩니다.
* **해석:** 링크 라이브러리가 연결(추가)되는 시점은 링킹 과정, 즉 최종 실행 파일(`.exe`)이 만들어지기 바로 직전 단계가 맞습니다.

---

### 3. Answer (정답)

**정답: True (참)**

* **이유:** 링킹(Linking) 단계에서 링커(Linker)가 오브젝트 파일(`.obj`)에 필요한 링크 라이브러리(`.lib`) 코드를 결합한 뒤, 그 최종 결과물로 실행 파일(`.exe`)을 만들어내기 때문에 참입니다.


---

### 25. Problem (문제)

**Q. Which data directive creates a 32-bit signed integer variable?**
(32비트 부호 있는 정수(Signed integer) 변수를 생성하는 데이터 지시어는 무엇인가요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **어셈블리(MASM) 정수 데이터 타입 지시어:**
    * `BYTE` / `SBYTE`: 8비트 정수 (Unsigned / Signed)
    * `WORD` / `SWORD`: 16비트 정수 (Unsigned / Signed)
    * **`DWORD` / `SDWORD`**: 32비트 정수 (Unsigned / Signed)
    * `QWORD` / `SQWORD`: 64비트 정수 (Unsigned / Signed)
* **부호 있는(Signed) 32비트 정수:**
  * **`SDWORD`** (Signed Doubleword) 지시어가 32비트 부호 있는 정수 변수를 명시적으로 선언할 때 사용됩니다.

---

### 3. Answer (정답)

**정답: SDWORD**

* **설명:** **`SDWORD`** (Signed Doubleword) 지시어가 32비트 크기의 부호 있는 정수(Signed Integer) 변수를 정의하는 데 사용됩니다. (참고: 일반 `DWORD`도 32비트 메모리를 할당하지만, '부호 있음'을 명시적으로 나타낼 때는 `SDWORD`를 사용합니다.)

---

**💡 예시 코드:**
```assembly
.data
val1 SDWORD -123456    ; 32비트 부호 있는 정수 변수 선언
```


---

### 26. Problem (문제)

**Q. Which data directive creates a 16-bit signed integer variable?**
(16비트 부호 있는 정수(Signed integer) 변수를 생성하는 데이터 지시어는 무엇인가요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **어셈블리(MASM) 정수 데이터 타입 지시어:**
    * `BYTE` / `SBYTE`: 8비트 정수 (Unsigned / Signed)
    * **`WORD` / `SWORD`**: 16비트 정수 (Unsigned / Signed)
    * `DWORD` / `SDWORD`: 32비트 정수 (Unsigned / Signed)
* **부호 있는(Signed) 16비트 정수:**
  * **`SWORD`** (Signed Word) 지시어가 16비트 부호 있는 정수 변수를 명시적으로 선언할 때 사용됩니다.

---

### 3. Answer (정답)

**정답: SWORD**

* **설명:** **`SWORD`** (Signed Word) 지시어가 16비트 크기의 부호 있는 정수(Signed Integer) 변수를 정의하는 데 사용됩니다.

---

**💡 예시 코드:**
```assembly
.data
var1 SWORD -32700    ; 16비트 부호 있는 정수 변수 선언
```


---

### 27. Problem (문제)

**Q. Which data directive creates a 64-bit unsigned integer variable?**
(64비트 부호 없는 정수(Unsigned integer) 변수를 생성하는 데이터 지시어는 무엇인가요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **어셈블리(MASM) 데이터 크기 구분:**
    * `BYTE`: 8비트 (1 바이트)
    * `WORD`: 16비트 (2 바이트)
    * `DWORD` (Doubleword): 32비트 (4 바이트)
    * **`QWORD`** (Quadword): 64비트 (8 바이트)
* **부호 없는(Unsigned) 64비트 정수:**
  * **`QWORD`** 지시어가 64비트 크기의 부호 없는 정수 변수를 선언할 때 사용됩니다. (부호 있는 64비트 정수는 `SQWORD` 사용)

---

### 3. Answer (정답)

**정답: QWORD**

* **설명:** **`QWORD`** (Quadword) 지시어가 64비트(8바이트) 크기의 부호 없는 정수(Unsigned Integer) 변수를 정의하는 데 사용됩니다.

---

**💡 예시 코드:**
```assembly
.data
val1 QWORD 1234567890ABCDEFh    ; 64비트 부호 없는 정수 변수 선언
```


---

### 28. Problem (문제)

**Q. Which data directive creates an 8-bit signed integer variable?**
(8비트 부호 있는 정수(Signed integer) 변수를 생성하는 데이터 지시어는 무엇인가요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **어셈블리(MASM) 정수 데이터 타입 지시어:**
    * **`BYTE` / `SBYTE`**: 8비트 정수 (Unsigned / Signed)
    * `WORD` / `SWORD`: 16비트 정수 (Unsigned / Signed)
    * `DWORD` / `SDWORD`: 32비트 정수 (Unsigned / Signed)
* **부호 있는(Signed) 8비트 정수:**
  * **`SBYTE`** (Signed Byte) 지시어가 8비트 부호 있는 정수 변수를 명시적으로 선언할 때 사용됩니다.

---

### 3. Answer (정답)

**정답: SBYTE**

* **설명:** **`SBYTE`** (Signed Byte) 지시어가 8비트(1바이트) 크기의 부호 있는 정수(Signed Integer) 변수를 정의하는 데 사용됩니다.

---

**💡 예시 코드:**
```assembly
.data
val1 SBYTE -128    ; 8비트 부호 있는 정수 변수 선언 (-128 ~ 127 범위)
```


---

### 29. Problem (문제)

**Q. Which data directive creates a 10-byte packed BCD variable?**
(10바이트 압축 BCD(Packed BCD) 변수를 생성하는 데이터 지시어는 무엇인가요?)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **BCD (Binary Coded Decimal, 2진화 십진법):** 10진수 숫자 하나를 4비트로 표현하는 방식입니다.
  * **10바이트 데이터 크기:** 80비트(10바이트) 메모리 공간을 할당합니다.
  * **데이터 지시어:**
    * **`TBYTE`** (Ten Bytes) 지시어는 10바이트(80비트) 정수 또는 **압축 BCD(Packed BCD)** 변수를 정의할 때 사용합니다. (구버전 MASM 표현식인 **`DT`** 도 동일한 역할을 합니다.)

---

### 3. Answer (정답)

**정답: TBYTE (또는 DT)**

* **설명:** **`TBYTE`** (Ten Bytes) 지시어가 10바이트(80비트) 크기의 압축 BCD(Packed BCD) 데이터 변수를 생성하는 데 사용됩니다.

---

**💡 예시 코드:**
```assembly
.data
bcdVal TBYTE 12345678901234567890h    ; 10바이트 압축 BCD 변수 선언
```

---

### 1. Problem (문제)

**Q. Define four symbolic constants that represent integer 25 in decimal, binary, octal, and hexadecimal formats.**
(10진수, 2진수, 8진수, 16진수 형식으로 정수 25를 나타내는 4개의 기호 상수(Symbolic constants)를 정의하세요.)

---

### 2. Problem Solving (문제 풀이)

* **숫자 25의 진법별 표현:**
  * **10진수 (Decimal):** `25` (접미사 없음 또는 `d`)
  * **2진수 (Binary):** $16 + 8 + 1 = 11001_2 \rightarrow$ `11001b` (또는 `00011001b`)
  * **8진수 (Octal):** $25 = 3 \times 8 + 1 \rightarrow$ `31o` (또는 `31q`)
  * **16진수 (Hexadecimal):** $25 = 1 \times 16 + 9 \rightarrow$ `19h`

* **기호 상수 정의 기호:** 어셈블리에서는 `=` 또는 `EQU` 지시어를 사용하여 상수를 정의합니다.

---

### 3. Answer (정답)

**정답:**

```assembly
VAL_DEC = 25        ; 10진수 (Decimal)
VAL_BIN = 11001b    ; 2진수 (Binary)
VAL_OCT = 31o       ; 8진수 (Octal, 'q'도 가능)
VAL_HEX = 19h       ; 16진수 (Hexadecimal)
```

---

### 2. Problem (문제)

**Q. Find out, by trial and error, if a program can have multiple code and data segments.**
(시행착오를 통해 하나의 프로그램이 여러 개의 코드 세그먼트와 데이터 세그먼트를 가질 수 있는지 알아내시오.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **어셈블리(MASM) 세그먼트 구조:** 어셈블리 소스 코드 내에서 `.data`나 `.code` 지시어를 여러 번 선언하여 코드를 작성할 수 있는지에 대한 문제입니다.
  * **어셈블러의 동작 방식:**
    1. 어셈블러는 소스 코드 내에서 `.data`나 `.code` 지시어가 여러 번 등장하는 것을 **허용**합니다.
    2. 어셈블러가 번역(Assemble)할 때, 흩어져 있는 `.data` 영역들은 **하나의 데이터 세그먼트로 병합(Combine)**하고, `.code` 영역들은 **하나의 코드 세그먼트로 병합**하여 최종 오브젝트 파일(`.obj`)을 생성합니다.
    3. 또한, 세그먼트 이름을 다르게 정의하는 대형 메모리 모델(Real mode 등)에서는 물리적으로 구별되는 **진짜 여러 개의 세그먼트**를 정의하는 것도 가능합니다.

---

### 3. Answer (정답)

**정답: Yes (가능합니다)**

* **설명:** 어셈블리 프로그램은 **여러 개의 데이터 세그먼트(`.data`)와 코드 세그먼트(`.code`)를 가질 수 있습니다.** 어셈블러는 동일한 이름의 세그먼트 지시어가 여러 번 나타나면 이들을 하나로 병합하여 처리합니다.

---

**💡 예시 코드 (컴파일 가능):**
```assembly
.data
    val1 DWORD 10

.code
main PROC
    mov eax, val1
    ret
main ENDP

.data               ; 두 번째 데이터 세그먼트 선언 (정상 작동)
    val2 DWORD 20

.code               ; 두 번째 코드 세그먼트 선언 (정상 작동)
subRoutine PROC
    mov ebx, val2
    ret
subRoutine ENDP
```


---

### 3. Problem (문제)

**Q. Create a data definition for a doubleword that stored it in memory in big endian format.**
(빅 엔디안(Big-endian) 방식으로 메모리에 저장되는 더블워드(32비트) 데이터 정의를 작성하세요.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **x86 시스템의 기본 엔디안:** x86 프로세서는 기본적으로 **리틀 엔디안(Little-endian)** 방식을 사용하여 하위 바이트(LSB)를 낮은 메모리 주소에 저장합니다.
  * **빅 엔디안(Big-endian):** 상위 바이트(MSB)를 가장 낮은 메모리 주소에, 하위 바이트(LSB)를 가장 높은 메모리 주소에 순서대로 저장합니다.
  * **해결 방법:** `DWORD` 지시어를 사용하면 어셈블러가 자동으로 리틀 엔디안으로 배치를 바꾸므로, 빅 엔디안으로 저장하려면 **4개의 `BYTE` 지시어**를 사용하여 가장 큰 값의 바이트(MSB)부터 순서대로 나열해야 합니다.

* **예시 데이터 (16진수 `12345678h` 기준):**
  * MSB (가장 높은 바이트): `12h`
  * 중간 바이트들: `34h`, `56h`
  * LSB (가장 낮은 바이트): `78h`
  * **빅 엔디안 메모리 배치 (낮은 주소 $\rightarrow$ 높은 주소):** `12h, 34h, 56h, 78h`

---

### 3. Answer (정답)

**정답:**

```assembly
bigEndianVal BYTE 12h, 34h, 56h, 78h
```


---

### 4. Problem (문제)

**Q. Find out if you can declare a variable of type DWORD and assign it a negative value. What does this tell you about the assembler’s type checking?**
(DWORD 타입 변수를 선언하고 음수 값을 할당할 수 있는지 알아내시오. 이것은 어셈블러의 타입 검사(Type checking)에 대해 무엇을 말해줍니까?)

---

### 2. Problem Solving (문제 풀이)

* **질문 1: DWORD 타입에 음수 할당이 가능한가?**
  * **네, 가능합니다.** 
  * 예를 들어, `val DWORD -10`과 같이 선언하면 어셈블러는 오류 없이 이를 컴파일하며, 음수 `-10`을 32비트 2의 보수(2's complement) 형태(`FFFFFFF6h`)로 변환하여 메모리에 저장합니다.

* **질문 2: 이것이 어셈블러의 타입 검사에 대해 의미하는 바는?**
  * `DWORD`는 이론적으로 **부호 없는(Unsigned)** 32비트 정수 타입이고, 부호 있는 타입은 `SDWORD`입니다.
  * 그럼에도 불과하고 음수 할당이 허용되는 것은, 어셈블러의 타입 검사가 데이터의 **부호 유무(Signedness)**보다 **데이터의 크기(Size, 32비트 범위 내인지 여부)**에만 집중한다는 것을 보여줍니다.
  * 즉, 어셈블러의 타입 검사는 **매우 느슨하고 엄격하지 않음(Loose / Weak)**을 의미합니다. 어셈블러는 메모리 크기만 맞으면 비트 패턴으로 자동 변환해 주며, 부호의 해석은 프로그래머가 작성하는 명령어에 맡깁니다.

---

### 3. Answer (정답)

**정답:**

1. **가능 여부:** **네, 가능합니다.** (예: `val1 DWORD -5`)
2. **타입 검사의 의미:** 어셈블러의 타입 검사는 **매우 느슨(Loose)하며 엄격하지 않습니다.** 어셈블러는 부호 유무(Signed/Unsigned)를 엄격하게 구별하여 제약하기보다는, 할당되는 값이 **32비트 메모리 크기(Size)**에 들어가는지 여부만 확인합니다.

---

**💡 예시 코드:**
```assembly
.data
val1 DWORD -10    ; 오류 없이 정상 컴파일됨 (메모리에는 FFFFFFF6h로 저장됨)
```

---

### 5. Problem (문제)

**Q. Write a program that contains two instructions: (1) add the number 5 to the EAX register, and (2) add 5 to the EDX register. Generate a listing file and examine the machine code generated by the assembler. What differences, if any, did you find between the two instructions?**
((1) EAX 레지스터에 숫자 5를 더하고, (2) EDX 레지스터에 5를 더하는 두 개의 명령어를 포함하는 프로그램을 작성하세요. 리스팅 파일(`.lst`)을 생성하여 어셈블러가 생성한 기계어(Machine code)를 조사하고, 두 명령어 사이에 어떤 차이점이 있는지 서술하세요.)

---

### 2. Problem Solving (문제 풀이)

* **소스 코드 작성 및 기계어 비교:**
  * `add eax, 5`
  * `add edx, 5`

* **리스팅 파일(`.lst`)에서 확인되는 기계어 바이트:**
  * `add eax, 5` $\rightarrow$ **`05 00000005`** (총 5바이트)
  * `add edx, 5` $\rightarrow$ **`81 C2 00000005`** (총 6바이트)

* **차이점 분석:**
  1. **EAX 특화 명령어 (누산기 최적화):** x86 아키텍처에서 `EAX` 레지스터는 누산기(Accumulator)로 특수 취급되어, `EAX`에 즉시값(Immediate)을 더하는 명령어는 **단일 바이트 옥코드 `05`**로 시작하는 더 짧고 최적화된 기계어가 제공됩니다.
  2. **일반 레지스터 명령어 (`EDX` 등):** `EDX`와 같은 일반 목적 레지스터는 범용 명령어 옥코드(`81`)에 더해 어떤 레지스터인지를 지정하는 **ModR/M 바이트(`C2`)**가 추가로 붙기 때문에 길이 가 1바이트 더 깁니다.

---

### 3. Answer (정답)

**정답:**

1. **기계어 바이트 크기 차이:**
   * `add eax, 5` 명령어의 기계어는 **5바이트**입니다 (`05 00000005h`).
   * `add edx, 5` 명령어의 기계어는 **6바이트**입니다 (`81 C2 00000005h`).

2. **이유:** 
   * x86 아키텍처는 `EAX` 레지스터(누산기)에 대한 연산을 최적화하여 더 짧은 전용 옥코드(`05`)를 제공합니다.
   * 반면 `EDX` 레지스터 연산은 범용 옥코드(`81`) 뒤에 레지스터를 지정하기 위한 **ModR/M 바이트(`C2`)**가 추가로 필요하므로 1바이트가 더 깁니다.

---

**💡 예시 리스팅 파일 내용:**
```assembly
00000000  05 00000005         add eax, 5
00000005  81 C2 00000005      add edx, 5
```


---

### 6. Problem (문제)

** Q. Given the number 456789ABh, list out its byte values in little-endian order. **
(16진수 숫자 456789ABh가 주어졌을 때, 리틀 엔디안(Little-endian) 순서대로 바이트 값들을 나열하세요.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **리틀 엔디안(Little-endian):** 최하위 바이트(LSB, Least Significant Byte)를 가장 낮은 메모리 주소에 먼저 저장하는 방식입니다.

* **바이트 분해보기 (16진수 `456789ABh`):**
  * `45h` : 최상위 바이트 (MSB)
  * `67h` : 세 번째 바이트
  * `89h` : 두 번째 바이트
  * `ABh` : 최하위 바이트 (LSB)

* **리틀 엔디안 배치 (낮은 주소 $\rightarrow$ 높은 주소 순서):**
  * LSB부터 순서대로 나열합니다: **`ABh`, `89h`, `67h`, `45h`**

---

### 3. Answer (정답)

**정답: ABh, 89h, 67h, 45h**

* **설명:** 리틀 엔디안 방식에서는 가장 작은 단위의 최하위 바이트인 `AB`가 첫 번째 메모리 위치에 저장되고, 이어서 `89`, `67`, 최상위 바이트인 `45` 순서로 저장됩니다.


---

### 7. Problem (문제)

**Q. Declare an array of 120 uninitialized unsigned doubleword values.**
(초기화되지 않은 120개의 부호 없는 더블워드(DWORD) 값을 갖는 배열을 선언하세요.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **더블워드 타입:** 부호 없는 32비트 정수는 **`DWORD`** 지시어를 사용합니다.
  * **초기화되지 않은 값:** 어셈블리에서 변수나 배열을 초기화하지 않을 때는 물음표(**`?`**) 기호를 사용합니다.
  * **반복 선언 지시어:** 같은 크기의 값을 여러 개 반복하여 선언할 때는 **`DUP`** 연산자를 사용합니다.

* **구문 형식:**
  `변수이름 데이터타입 개수 DUP(?)`

---

### 3. Answer (정답)

**정답:**

```assembly
myArray DWORD 120 DUP(?)
```


---

### 8. Problem (문제)

**Q. Declare an array of byte and initialize it to the first 5 letters of the alphabet.**
(알파벳의 처음 5개 문자('A', 'B', 'C', 'D', 'E')로 초기화된 바이트(BYTE) 배열을 선언하세요.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **바이트 타입:** 문자 데이터는 1바이트(8비트) 크기를 가지므로 **`BYTE`** 지시어를 사용합니다.
  * **문자 배열 선언:** 
    1. 각 문자를 쉼표(`,`)로 구분하여 홑따옴표(`'`)로 감싸서 선언할 수 있습니다.
    2. 문자열 형태로 따옴표 안에 연이어 작성해도 동일한 바이트 배열이 됩니다.

---

### 3. Answer (정답)

**정답:**

```assembly
myArray BYTE 'A', 'B', 'C', 'D', 'E'
```

---

### 9. Problem (문제)

**Q. Declare a 32-bit signed integer variable and initialize it with the smallest possible negative decimal value.**
(32비트 부호 있는 정수 변수를 선언하고 표현 가능한 가장 작은 음수 10진수 값으로 초기화하세요.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **32비트 부호 있는 정수(Signed Integer) 범위:**
    * 2의 보수(2's complement) 표현식을 사용하므로 범위는 $-2^{31}$부터 $2^{31}-1$까지입니다.
    * 범위: **$-2,147,483,648$ ~ $2,147,483,647$**
  * **가장 작은 음수 값:** **$-2,147,483,648$** ($ -2^{31} $)
  * **데이터 지시어:** 32비트 부호 있는 정수 선언 시 **`SDWORD`** 지시어를 사용합니다.

---

### 3. Answer (정답)

**정답:**

```assembly
val SDWORD -2147483648
```


---

### 10. Problem (문제)

**Q. Declare an unsigned 16-bit integer variable named wArray that uses three initializers.**
(3개의 초기값을 사용하는 `wArray`라는 이름의 부호 없는 16비트 정수 변수(배열)를 선언하세요.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **변수 이름:** `wArray`
  * **부호 없는 16비트 정수 타입:** **`WORD`** 지시어를 사용합니다.
  * **3개의 초기값(Initializers):** 16비트 범위 내의 아무 정수 3개를 쉼표(`,`)로 구분하여 나열합니다. (예: `10, 20, 30` 또는 `1, 2, 3`)

---

### 3. Answer (정답)

**정답:**

```assembly
wArray WORD 10, 20, 30
```


---

### 11. Problem (문제)

**Q. Declare a string variable containing the name of your favorite color. Initialize it as a null-terminated string.**
(가장 좋아하는 색상의 이름을 포함하는 문자열 변수를 선언하고, 널 종료 문자열(Null-terminated string)로 초기화하세요.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **문자열 변수 타입:** 어셈블리에서 문자열은 바이트의 배열이므로 **`BYTE`** 지시어를 사용합니다.
  * **널 종료 문자열(Null-terminated string):** 문자열의 끝을 나타내기 위해 마지막에 **`0`** (널 바이트, Null byte)을 추가해야 합니다.
  * **좋아하는 색상 예시:** `"Blue"`, `"Red"`, `"Green"` 등 

---

### 3. Answer (정답)

**정답:**

```assembly
favoriteColor BYTE "Blue", 0
```


---

### 12. Problem (문제)

**Q. Declare an uninitialized array of 50 signed doublewords named dArray.**
(초기화되지 않은 50개의 부호 있는 더블워드(SDWORD)를 갖는 `dArray`라는 이름의 배열을 선언하세요.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **변수 이름:** `dArray`
  * **부호 있는 더블워드 타입:** **`SDWORD`** 지시어를 사용합니다. (32비트 부호 있는 정수)
  * **초기화되지 않은 값:** 물음표(**`?`**) 기호를 사용합니다.
  * **반복 선언 연산자:** **`DUP`** 연산자를 사용하여 50번 반복합니다.

---

### 3. Answer (정답)

**정답:**

```assembly
dArray SDWORD 50 DUP(?)
```


---

### 13. Problem (문제)

**Q. Declare a string variable containing the word “TEST” repeated 500 times.**
("TEST"라는 단어가 500번 반복되어 들어가는 문자열 변수를 선언하세요.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **문자열 데이터 타입:** 문자열 데이터는 1바이트 단위 문자들의 연속이므로 **`BYTE`** 지시어를 사용합니다.
  * **반복 선언 연산자:** 특정 패턴이나 문자열을 여러 번 반복할 때는 **`DUP`** 연산자를 사용합니다.
  * **구문:** `500 DUP("TEST")` 구문을 작성하면 `"TEST"`라는 4바이트 문자열이 500번 연속으로 생성되어 총 2000바이트 크기의 문자열 배열이 됩니다.

---

### 3. Answer (정답)

**정답:**

```assembly
myString BYTE 500 DUP("TEST")
```


---

### 14. Problem (문제)

**Q. Declare an array of 20 unsigned bytes named bArray and initialize all elements to zero.**
(모든 요소가 0으로 초기화된 20개의 부호 없는 바이트를 갖는 `bArray`라는 이름의 배열을 선언하세요.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **변수 이름:** `bArray`
  * **부호 없는 바이트 타입:** **`BYTE`** 지시어를 사용합니다.
  * **요소 개수 및 초기값:** 20개의 요소를 모두 `0`으로 초기화해야 하므로 **`20 DUP(0)`**을 사용합니다.

---

### 3. Answer (정답)

**정답:**

```assembly
bArray BYTE 20 DUP(0)
```


---

### 15. Problem (문제)

**Q. Show the order of individual bytes in memory (lowest to highest) for the following double word variable:**
`val1 DWORD 87654321h`
(다음 더블워드 변수 `val1 DWORD 87654321h`에 대해 낮은 메모리 주소부터 높은 메모리 주소 순서대로 바이트 배치 순서를 제시하세요.)

---

### 2. Problem Solving (문제 풀이)

* **핵심 개념:**
  * **x86 시스템의 엔디안 방식:** x86 프로세서는 **리틀 엔디안(Little-endian)** 방식을 사용하므로, 가장 작은 바이트(최하위 바이트, LSB)가 가장 낮은 메모리 주소에 저장됩니다.

* **바이트 분해 (16진수 `87654321h`):**
  * `87h` : 최상위 바이트 (MSB - Most Significant Byte)
  * `65h` : 세 번째 바이트
  * `43h` : 두 번째 바이트
  * `21h` : 최하위 바이트 (LSB - Least Significant Byte)

* **메모리 주소별 배치 (낮은 주소 $\rightarrow$ 높은 주소):**
  1. 가장 낮은 주소: `21h` (LSB)
  2. 다음 주소: `43h`
  3. 다음 주소: `65h`
  4. 가장 높은 주소: `87h` (MSB)

---

### 3. Answer (정답)

**정답:**

```text
21h, 43h, 65h, 87h
```

---


## 6. Problem (문제)

Modify the AddVariables program so it uses 64-bit variables. Describe the syntax errors generated by the assembler and what steps you took to resolve the errors.

 *(AddVariables 프로그램이 64비트 변수를 사용하도록 수정하시오. 어셈블러에 의해 발생한 구문 오류를 설명하고, 이 오류들을 해결하기 위해 취한 조치 단계를 작성하시오.)*

---

## 2. 개념

### (1) 어셈블러 구문 오류(Syntax Errors) 분석

* **`error A2022: instruction operands must agree in size`**
  * **설명:** 32비트 레지스터인 `EAX`에 64비트 크기인 `QWORD` 변수를 직접 대입하려고 할 때 발생합니다. x86 어셈블리에서는 두 피연산자(Operand)의 데이터 크기가 반드시 일치해야 합니다.
* **`error A2008: syntax error : rax`**
  * **설명:** 코드 상단의 `.386` 지시어로 설정된 32비트 보호 모드(Protected Mode)에서는 64비트 전용 레지스터인 `RAX`를 사용할 수 없어 구문 오류가 발생합니다.

---

### (2) 32비트 환경에서의 64비트 덧셈 연산 원리

32비트 CPU 환경에서는 한 번에 처리할 수 있는 데이터 크기가 $32\text{-bit}$ (4바이트)로 제한되므로, 64비트 연산을 수행하기 위해 **데이터 분할 접근**과 **올림수(Carry) 처리**를 이용합니다.

1. **`DWORD PTR` 타입 재지정 연산자**
   * 64비트(`QWORD`) 변수를 32비트(`DWORD`) 2개로 나누어 접근합니다.
   * `DWORD PTR val1`: `val1` 변수의 하위 4바이트 (0~3바이트)
   * `DWORD PTR val1 + 4`: `val1` 변수의 상위 4바이트 (4~7바이트)

2. **`ADD` 및 `ADC` 명령어의 조합**
   * **`ADD` (Add):** 하위 32비트끼리 더합니다. 연산 결과에서 올림수가 발생하면 CPU의 캐리 플래그($CF$)가 $1$로 설정됩니다.
   * **`ADC` (Add with Carry):** 상위 32비트끼리 더할 때, 하위 연산에서 발생한 캐리 플래그($CF$) 값까지 포함하여 더합니다.
     $$\text{상위 덧셈 결과} = \text{val1 상위 4바이트} + \text{val2 상위 4바이트} + CF$$

---

## 3. 풀이 및 소스 코드

### (1) 문제 해결 과정

1. `.data` 영역에 64비트 변수 `val1`, `val2`, `sum`을 `QWORD` 타입으로 선언합니다.
2. `DWORD PTR` 연산자를 활용하여 `val1`과 `val2`의 하위 4바이트를 `EAX` 레지스터로 로드한 후 `ADD` 명령어로 더하고, 결과를 `sum`의 하위 4바이트 영역에 저장합니다.
3. 메모리 주소 오프셋 `+ 4`를 이용해 상위 4바이트 영역에 접근한 뒤, 올림수를 반영하는 `ADC` 명령어로 상위 32비트 덧셈을 수행하고 결과를 `sum`의 상위 4바이트 영역에 저장합니다.

---

### (2) 최종 소스 코드 (`report6.asm`)

```assembly
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    ; 64비트(8바이트) 변수 선언
    val1 QWORD 100000000000h
    val2 QWORD 200000000000h
    sum  QWORD 0

.code
main PROC
    ; [1단계] 하위 32비트 덧셈 수행
    mov eax, DWORD PTR val1          ; val1의 하위 4바이트를 EAX에 로드
    add eax, DWORD PTR val2          ; val2의 하위 4바이트를 더함 (올림수 발생 시 Carry Flag 설정)
    mov DWORD PTR sum, eax           ; 연산 결과를 sum의 하위 4바이트에 저장

    ; [2단계] 상위 32비트 덧셈 수행 (올림수 포함)
    mov eax, DWORD PTR val1 + 4      ; val1의 상위 4바이트를 EAX에 로드
    adc eax, DWORD PTR val2 + 4      ; val2의 상위 4바이트 + Carry Flag(CF)를 더함
    mov DWORD PTR sum + 4, eax       ; 연산 결과를 sum의 상위 4바이트에 저장

    ; 프로그램 정상 종료
    INVOKE ExitProcess, 0
main ENDP
END main
```
