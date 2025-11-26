---
name: obsidian
description: Obsidian vault 관리 스킬. vault 경로, 커밋/푸시 규칙, projects 폴더 구조를 제공한다. 브레인스토밍, 스프린트 기록 등 옵시디언 vault에 문서를 작성하거나 관리할 때 사용한다.
---

# Obsidian

Obsidian vault 파일 관리를 위한 스킬.

## Vault 경로

`.vault-path` 파일에서 vault 경로를 읽는다.

## Git 규칙

### 커밋
- 문서 변경 시 자동 커밋하지 않음
- 사용자가 명시적으로 요청할 때만 커밋
- 커밋 메시지는 한글로 작성

### 푸시
- 커밋 후 자동 푸시하지 않음
- 사용자가 명시적으로 요청할 때만 푸시

## Projects 폴더 구조

```
projects/
├── index.yaml              # 전체 프로젝트 메타데이터
├── README.md
└── {ProjectName}/
    ├── brainstorms/        # AI 대화 세션 기록
    │   └── YYYY-MM-DD-session-N.md
    ├── docs/               # 정제된 기획 문서
    └── sprints/            # 커밋 기반 개발 기록
        └── YYYY-MM-DD_HH:mm:ss.md
```

### index.yaml

```yaml
projects:
  - name: project-name
    description: 프로젝트 설명
```

### brainstorms/
- 파일명: `YYYY-MM-DD-session-N.md`
- AI 대화 세션 기록
- 세션 시작 시간 기록

### docs/
- 정제된 기획 문서
- 예: overview.md, architecture.md

### sprints/
- 파일명: `YYYY-MM-DD_HH:mm:ss.md`
- 커밋마다 하나의 파일 생성
- 커밋 해시, 개발 내용 요약

## 문서 작성 규칙

- 모든 문서는 한글로 작성
- 마크다운 형식 사용
