#!/bin/bash

# Project Setting Script
# Usage: ./setting.sh <target_project_path>

set -e

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 스크립트 위치 기준으로 스킬 루트 경로 설정
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_ROOT="$(dirname "$SCRIPT_DIR")"
TEMPLATE_DIR="$SKILL_ROOT/template"
PLUGINS_DIR="$SKILL_ROOT/plugins"

# 사용법 출력
usage() {
    echo "Usage: $0 <target_project_path>"
    echo ""
    echo "Arguments:"
    echo "  target_project_path  설정을 적용할 프로젝트의 루트 경로"
    echo ""
    echo "Example:"
    echo "  $0 /path/to/my-project"
    exit 1
}

# 인자 검증
if [ -z "$1" ]; then
    echo -e "${RED}Error: 프로젝트 경로가 필요합니다.${NC}"
    usage
fi

TARGET_DIR="$1"

# 타겟 디렉토리 존재 확인
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${RED}Error: 디렉토리가 존재하지 않습니다: $TARGET_DIR${NC}"
    exit 1
fi

# 절대 경로로 변환
TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"

echo -e "${GREEN}=== Project Setting 시작 ===${NC}"
echo "Target: $TARGET_DIR"
echo ""

# 1. template 내용을 타겟 프로젝트 루트에 복사
echo -e "${YELLOW}[1/3] Template 파일 복사 중...${NC}"
if [ -d "$TEMPLATE_DIR" ]; then
    # .DS_Store 제외하고 복사
    rsync -av --exclude='.DS_Store' "$TEMPLATE_DIR/" "$TARGET_DIR/"
    echo -e "${GREEN}  ✓ Template 복사 완료${NC}"
else
    echo -e "${RED}  ✗ Template 디렉토리가 없습니다: $TEMPLATE_DIR${NC}"
    exit 1
fi

# 2. .claude 폴더 및 하위 폴더 생성
echo -e "${YELLOW}[2/3] .claude 폴더 구조 생성 중...${NC}"
CLAUDE_DIR="$TARGET_DIR/.claude"
mkdir -p "$CLAUDE_DIR/agents"
mkdir -p "$CLAUDE_DIR/commands"
mkdir -p "$CLAUDE_DIR/skills"
echo -e "${GREEN}  ✓ .claude 폴더 구조 생성 완료${NC}"

# 3. plugins 폴더 순회하며 내용물 복사
echo -e "${YELLOW}[3/3] Plugins 복사 중...${NC}"
if [ -d "$PLUGINS_DIR" ]; then
    for plugin in "$PLUGINS_DIR"/*/; do
        plugin_name=$(basename "$plugin")
        echo "  - Plugin: $plugin_name"

        # agents 복사
        if [ -d "$plugin/agents" ]; then
            cp -r "$plugin/agents"/* "$CLAUDE_DIR/agents/" 2>/dev/null || true
            echo "    ✓ agents 복사됨"
        fi

        # commands 복사
        if [ -d "$plugin/commands" ]; then
            cp -r "$plugin/commands"/* "$CLAUDE_DIR/commands/" 2>/dev/null || true
            echo "    ✓ commands 복사됨"
        fi

        # skills 복사
        if [ -d "$plugin/skills" ]; then
            cp -r "$plugin/skills"/* "$CLAUDE_DIR/skills/" 2>/dev/null || true
            echo "    ✓ skills 복사됨"
        fi
    done
    echo -e "${GREEN}  ✓ Plugins 복사 완료${NC}"
else
    echo -e "${YELLOW}  ! Plugins 디렉토리가 없습니다 (건너뜀)${NC}"
fi

echo ""
echo -e "${GREEN}=== Project Setting 완료 ===${NC}"
echo ""
echo "생성된 구조:"
echo "  $TARGET_DIR/"
echo "  ├── CLAUDE.md"
echo "  ├── .flow/"
echo "  └── .claude/"
echo "      ├── agents/"
echo "      ├── commands/"
echo "      └── skills/"
