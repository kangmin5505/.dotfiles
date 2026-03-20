---
description: Generate Jira Description by ticket type (bug/feature/task).
agent: sisyphus
---

`$ARGUMENTS`로 전달된 티켓 유형과 추가 설명에 따라 Jira Description을 **한국어**로 작성해줘.

**인자 파싱:**
- `$ARGUMENTS`의 첫 번째 단어를 티켓 유형으로, 나머지 텍스트를 추가 설명으로 해석할 것.
- 예: `/jira-desc bug 로그인 시 세그폴트 발생` → 유형=`bug`, 추가 설명="로그인 시 세그폴트 발생"
- 예: `/jira-desc feature` → 유형=`feature`, 추가 설명 없음
- 추가 설명이 있으면 Description 섹션 작성 시 해당 맥락을 반영하고, 코드 분석과 결합하여 더 정확한 내용을 작성할 것.

**유형 판별:**
- `bug` → Correct Error 템플릿
- `feature` → Improve Function/Performance, Development Subject, Refactoring 템플릿
- `task` → Task, Internal Management 템플릿
- 인자가 없거나 위 3개에 해당하지 않으면 → 사용자에게 유형을 질문할 것

**베이스 브랜치 결정 (최우선 수행):**
1. `git log --oneline --merges` 에서 가장 최근 머지 커밋의 소스 브랜치를 추론하여 베이스로 사용해줘.
2. 추론이 불가능하면, 사용자에게 베이스 브랜치를 질문해줘.

**커밋 비교 방법:**
- `git merge-base HEAD <베이스 브랜치>` 로 분기점을 찾고,
- `git log --oneline --no-merges <분기점>..HEAD` 로 이 브랜치의 고유 커밋만 추출해줘.
- `git diff <분기점>..HEAD` 로 실제 코드 변경분을 분석해줘.

**정보 수집:**
- 위에서 추출한 고유 커밋과 diff만 대상으로 분석할 것. 베이스 브랜치에 이미 있는 내용은 절대 포함하지 마.
- 부족한 정보(재현 절차, 빌드 버전 등)는 빈칸으로 두지 말고, `[TODO: ...]` 플레이스홀더를 넣어줘.

**출력 형식 — Jira wiki markup:**
- 반드시 **Jira wiki markup** 형식으로 작성할 것. 마크다운(##, ```, - 등)을 사용하지 마.
- 첫 줄에 Jira 타이틀 추천을 `*Title:* 제목 텍스트` 형태로 넣어줘.
- **결과물은 반드시 `/tmp/jira-desc.txt` 파일로 저장할 것.** 채팅에는 파일 경로만 안내하고 본문을 직접 출력하지 마. 채팅 UI에서 복사하면 빈 줄이 사라지므로 파일 출력만이 개행을 보존한다.
- 헤딩: `h2.`, 볼드: `*텍스트*`, 불렛: `*`, 표: `||헤더||` / `|셀|`, 코드 블록: `{noformat}`
- **인라인 코드 금지**: Jira wiki의 `{{코드}}` 문법을 절대 사용하지 마. 중괄호가 Jira 매크로 파서와 충돌하여 깨진다. 코드/식별자는 그냥 일반 텍스트로 쓸 것.
- `h2.` 헤딩 위에 빈 줄 1개, 불렛/표 블록 전후에 빈 줄 1개씩 넣을 것.

**분석 및 작성 원칙:**
1. **고유 변경분만 분석**: 베이스 브랜치에 이미 있는 내용은 절대 포함하지 마.
2. **기술적 의도 파악**: 단순히 "무엇을 수정함"이 아니라, 변경된 코드의 맥락을 통해 이 작업이 지향하는 **기술적 핵심 설계와 의도**를 스스로 도출해줘.
3. **간결하고 명료하게**: 서술식 문장을 지양하고, 핵심만 추린 짧은 불렛 포인트로 작성해줘. 한 불렛이 2줄을 넘기지 마.
4. **표 적극 활용**: 함수 스펙, 파일별 변경 내용 등 구조화할 수 있는 정보는 Jira 표(`||헤더||` / `|셀|`)로 정리할 것.
5. **내부 참조 우선**: 동작을 설명할 때 외부 시스템에 비유하지 말고, CUBRID 내부에 동일/유사한 기능이 있으면 그것을 참조할 것.
6. **핵심 설계 변경만 기재**: Implementation에서 사소한 방어 코드(에러 전파 보강, null 체크 추가, assert 추가 등)는 별도 불렛으로 올리지 말 것. 아키텍처나 데이터 흐름에 영향을 주는 변경만 기술할 것.
7. **빈 섹션 생략**: 템플릿의 각 헤더에 해당하는 마땅한 내용이 없으면 해당 섹션 자체를 출력하지 말 것.
8. **섹션 간 내용 중복 금지**: Description은 배경/목적 개요, Specification Changes는 사용자 관점 스펙 변경(입출력, 동작 규칙), Implementation은 내부 구현 구조에 집중할 것.

---

### 템플릿: `bug`

{noformat}
*Title:* (Jira 타이틀 추천)

h2. Description
(버그 현상 요약)

h2. Test Build
(버그가 발생하는 빌드 버전. commit hash 포함. 예: CUBRID-11.0.0.0248-b53ae4a)
[TODO: OS 버전]

h2. Repro
(복사-붙여넣기로 재현 가능한 전체 절차. 설명이 아닌 실행 가능한 스크립트/명령어 형태로 작성)

h2. Expected Result
(고쳐져야 할 예상 결과)

h2. Actual Result
(현재 문제가 있는 결과)

h2. Additional Information
(분석에 도움이 되는 추가 자료. 없으면 섹션 자체를 생략)
{noformat}

---

### 템플릿: `feature`

{noformat}
*Title:* (Jira 타이틀 추천)

h2. Description
(이슈 설명 — 배경과 목적의 개요만. 세부 스펙이나 구현 상세는 여기에 쓰지 말 것)

h2. Specification Changes
(사용자/QA 관점의 스펙 변경. 함수 시그니처, 동작 규칙, 엣지 케이스 등. 표 활용 권장. Description과 내용을 중복하지 말 것)

h2. Implementation
(내부 구현 구조. 레이어별 변경 사항을 표로 정리 권장. Specification Changes와 내용을 중복하지 말 것)

h2. Acceptance Criteria
(범위 내에서 만족해야 하는 동작/결과를 정의)

h2. Definition of Done
(검증 방법. 예: Acceptance Criteria를 만족시킨다. QA 테스트를 통과한다.)
{noformat}

---

### 템플릿: `task`

{noformat}
*Title:* (Jira 타이틀 추천)

h2. Description
(작업 내용에 대한 목적과 설명)
{noformat}
