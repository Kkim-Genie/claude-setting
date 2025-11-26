---
name: project-brainstorm
description: 프로젝트 브레인스토밍 스킬. AI와 대화하면서 아이디어를 구체화하고 자동으로 기록한다. /brainstorm 커맨드로 시작하며, 대화 내용을 옵시디언 projects/{ProjectName}/brainstorms/에 저장한다.
---

# Project Brainstorm

프로젝트 아이디어를 브레인스토밍하고 기록하는 스킬.

## 의존성

이 스킬은 `obsidian` 스킬과 함께 사용한다. vault 경로와 projects 폴더 구조는 obsidian 스킬을 참조.

## 워크플로우

### 1. 세션 시작

`/brainstorm start [ProjectName]` 실행 시:

1. obsidian 스킬의 `.vault-path`에서 vault 경로 읽기
2. `projects/index.yaml`에서 프로젝트 존재 여부 확인
3. 없으면 새 프로젝트 생성 (폴더 + index.yaml 업데이트)
4. `brainstorms/YYYY-MM-DD-session-N.md` 파일 생성
5. 세션 시작 시간 기록

### 2. 대화 중

- 사용자와 대화하면서 아이디어 발전
- 중요한 결정이나 인사이트가 나오면 brainstorms 파일에 기록
- 구체화된 기획은 docs/ 폴더에 별도 문서로 정리

### 3. 세션 종료

`/brainstorm stop` 실행 시:

1. 세션 종료 시간 기록
2. 대화 요약 추가

## 파일 형식

### brainstorms/YYYY-MM-DD-session-N.md

```markdown
# 브레인스토밍 세션

- 시작: 2025-11-26 14:30
- 종료: 2025-11-26 16:00

## 주요 논의

### 주제 1
내용...

### 주제 2
내용...

## 결론 및 다음 단계

- 결론 1
- 다음 단계 1
```

### docs/ 문서

브레인스토밍 중 구체화된 내용은 docs/에 별도 문서로 정리:
- `overview.md` - 프로젝트 개요
- `architecture.md` - 아키텍처 설계
- 기타 필요한 기획 문서

## 규칙

- 모든 문서는 한글로 작성
- 마크다운 형식 사용
- 세션 파일명: `YYYY-MM-DD-session-N.md` (N은 당일 세션 번호)
