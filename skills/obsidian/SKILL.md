---
name: obsidian
description: Obsidian vault 관리 스킬. vault 경로, 커밋/푸시 규칙, projects 폴더 구조를 제공한다. 브레인스토밍, 스프린트 기록 등 옵시디언 vault에 문서를 작성하거나 관리할 때 사용한다.
---

# Obsidian

Obsidian vault 파일 관리를 위한 스킬.

## Vault 경로

### 경로 파일 위치
`~/.claude/skills/obsidian/vault-path.txt` 파일에서 vault 경로를 읽는다.

### 초기 설정 (파일이 없을 때)

**스킬 실행 시 `vault-path.txt` 파일이 없으면 반드시 다음 절차를 따른다:**

1. **시스템에서 Obsidian vault 후보 검색**
   ```bash
   # .obsidian 폴더가 있는 디렉토리 = Obsidian vault
   find ~ -name ".obsidian" -type d 2>/dev/null | head -5 | sed 's/\/.obsidian$//'
   ```
   - `.obsidian` 폴더가 있는 곳이 실제 vault
   - 검색 결과가 없으면 "Obsidian" 이름이 포함된 폴더 검색

2. **AskUserQuestion으로 검색 결과 제안**
   - 검색된 경로들을 옵션으로 제시
   - 사용자가 "기타"로 직접 입력도 가능
   ```
   질문: "Obsidian vault 경로를 선택해주세요"
   옵션: [검색된 경로들을 동적으로 추가]
   ```

3. **사용자 응답 후 파일 생성**
   - 선택된 경로를 `vault-path.txt` 파일에 저장
   - `~`로 시작하는 형태로 저장 (홈 디렉토리 치환)

### 경로 읽기

```bash
cat ~/.claude/skills/obsidian/vault-path.txt
# 예: ~/Documents/Obsidian
```

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
