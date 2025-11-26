---
description: 프로젝트 브레인스토밍 관리 (list, start [ProjectName], stop)
---

# Brainstorm 커맨드

인자: $ARGUMENTS

`obsidian` 스킬과 `project-brainstorm` 스킬을 사용해서 다음을 수행한다.

## 명령어 분기

### `list` 또는 인자 없음
1. obsidian 스킬의 `.vault-path`에서 vault 경로 읽기
2. `{vault}/projects/index.yaml` 읽기
3. 프로젝트 목록을 테이블 형태로 출력

### `start [ProjectName]`
1. obsidian 스킬의 `.vault-path`에서 vault 경로 읽기
2. `{vault}/projects/index.yaml`에서 프로젝트 확인
3. 프로젝트가 없으면:
   - 비슷한 이름 있는지 확인 → 오타 여부 질문
   - 새 프로젝트면 폴더 생성 + index.yaml 업데이트
4. `{vault}/projects/{ProjectName}/brainstorms/` 폴더 확인/생성
5. 오늘 날짜 세션 파일 생성: `YYYY-MM-DD-session-N.md`
6. 세션 시작 시간 기록
7. 브레인스토밍 모드 시작 안내

### `stop`
1. 현재 세션 파일에 종료 시간 기록
2. 대화 요약 추가
3. 브레인스토밍 모드 종료 안내
