---
name: sprint-tracker
description: 스프린트 트래커 스킬. /commit-sprint 커맨드로 git 커밋과 함께 개발 기록을 옵시디언에 저장한다. git diff 분석 → 커밋 메시지 확인 → 커밋 → sprints/ 기록 순서로 진행한다.
---

# Sprint Tracker

커밋과 함께 개발 기록을 옵시디언에 저장하는 스킬.

## 의존성

이 스킬은 `obsidian` 스킬과 함께 사용한다. vault 경로와 projects 폴더 구조는 obsidian 스킬을 참조.

## 워크플로우

`/commit-sprint` 실행 시:

### 1. git diff 분석

```bash
git status
git diff
git diff --staged
```

변경 사항 파악.

### 2. 커밋 메시지 생성

변경 내용을 분석해서 커밋 메시지 초안 작성.

### 3. 사용자 확인

AskUserQuestion으로 커밋 메시지 확인/수정 요청:
- 자동 생성된 메시지 제시
- 수정 옵션 제공

### 4. 커밋 실행

```bash
git add .
git commit -m "확정된 메시지"
```

### 5. 스프린트 기록

옵시디언 `projects/{ProjectName}/sprints/`에 기록 파일 생성.

## 파일 형식

### sprints/YYYY-MM-DD_HH:mm:ss.md

```markdown
# {커밋 해시 앞 7자리}

{커밋 메시지}

## 변경 사항

- 변경 내용 1
- 변경 내용 2
- 변경 내용 3
```

## 규칙

- 커밋 메시지는 한글로 작성
- 파일명: `YYYY-MM-DD_HH:mm:ss.md` (커밋 시간 기준)
- 커밋 전 반드시 사용자 확인 필요
- 자동 푸시하지 않음 (사용자 요청 시에만)
