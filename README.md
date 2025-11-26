# Claude Code 설정

Claude Code CLI의 사용자 정의 commands와 skills를 관리하는 저장소.

## 구조

```
.claude/
├── commands/       # 슬래시 커맨드 정의
├── skills/         # 스킬 정의
└── agents/         # 에이전트 정의 (예정)
```

## Commands

`/커맨드명` 형태로 실행하는 사용자 정의 명령어. 각 `.md` 파일이 하나의 커맨드가 된다.

| 커맨드 | 설명 |
|--------|------|
| `/brainstorm` | 프로젝트 브레인스토밍 (list, start, stop) |
| `/commit-sprint` | git 커밋 + 옵시디언 스프린트 기록 |

### 커맨드 파일 형식

```markdown
---
description: 커맨드 설명 (필수)
---

# 커맨드 내용
인자: $ARGUMENTS
...
```

## Skills

Claude의 기능을 확장하는 모듈. 각 폴더가 하나의 스킬이며, `SKILL.md` 파일이 필수.

| 스킬 | 설명 |
|------|------|
| `obsidian` | Obsidian vault 관리 (경로, git 규칙, projects 구조) |
| `project-brainstorm` | 브레인스토밍 세션 기록 |
| `sprint-tracker` | 커밋 기반 개발 기록 |
| `frontend-design` | 고품질 프론트엔드 UI 생성 |
| `skill-creator` | 새 스킬 생성 가이드 |

### 스킬 폴더 구조

```
skill-name/
├── SKILL.md          # 스킬 정의 (필수)
├── scripts/          # 실행 스크립트
├── references/       # 참조 문서
└── assets/           # 템플릿, 에셋 파일
```

### SKILL.md 형식

```markdown
---
name: skill-name
description: 스킬 설명 및 사용 조건
---

# 스킬 내용
...
```

## Git 관리

`.gitignore`에서 `commands/`, `skills/`, `agents/` 폴더만 추적하도록 설정됨.
