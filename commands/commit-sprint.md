---
description: git 커밋 + 스프린트 기록 (프로젝트명 필요)
---

# Commit Sprint 커맨드

인자: $ARGUMENTS (프로젝트명)

`obsidian` 스킬과 `sprint-tracker` 스킬을 사용해서 다음을 수행한다.

## 워크플로우

### 1. 프로젝트 확인
- 인자로 받은 프로젝트명 확인
- 인자 없으면 AskUserQuestion으로 프로젝트명 질문

### 2. git 상태 분석
```bash
git status
git diff
git diff --staged
```

### 3. 커밋 메시지 생성
- 변경 내용 분석
- 한글로 커밋 메시지 초안 작성

### 4. 사용자 확인
AskUserQuestion으로 커밋 메시지 확인:
- 옵션 1: 생성된 메시지 사용
- 옵션 2: 직접 수정

### 5. 커밋 실행
```bash
git add .
git commit -m "확정된 메시지"
```

### 6. 스프린트 기록
1. obsidian 스킬의 `.vault-path`에서 vault 경로 읽기
2. `{vault}/projects/{ProjectName}/sprints/` 폴더 확인/생성
3. `YYYY-MM-DD_HH:mm:ss.md` 파일 생성
4. 커밋 해시, 메시지, 변경 사항 기록
