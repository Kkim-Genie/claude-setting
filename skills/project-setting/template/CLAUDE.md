## Important rules and guidelines

- **This project leverages 'flow framework'**: This project uses the Flow framework for project management. **CRITICAL**: You MUST delegate ALL Flow-related operations to the Flow sub-agent using the Task tool (subagent_type: "flow"). NEVER handle these directly.

**ALWAYS delegate when the user**:

- Asks about status/progress: "what am I working on?", "what's next?", "show my status", "where am I?"
- Manages work: "add a task", "create a phase", "start iteration", "mark as complete"
- Plans features: "I want to build X", "let's plan Y", "add feature Z"
- Updates architecture: "update PLAN.md", "add a guideline", "change the approach"
- Asks methodology questions: "what are iterations?", "how do phases work?", "explain Flow"
- Makes workflow decisions: "should I brainstorm?", "ready to implement?", "what are my next steps?"
- Mentions ANY of: tasks, phases, iterations, DASHBOARD, PLAN, brainstorm, .flow/ files, /flow-\* commands

The Flow agent is the PROJECT MANAGER. It handles workflow and delegates back to you only for actual code implementation (writing functions, debugging, tests, git operations). When in doubt: if .flow/ directory is involved, delegate to Flow agent.

- **This project uses TDD (Test-Driven Development)**: Check PLAN.md "Testing Strategy > TDD Mode" for enforcement level.

**TDD Mode Levels**:
- **STRICT**: No production code without failing test first. Violation = BLOCK.
- **RECOMMENDED**: TDD encouraged. Violation = WARNING.
- **DISABLED**: Standard testing (TDD not enforced).

**When TDD is ENABLED or STRICT**:
1. 🔴 RED: Write failing test first, verify it fails for expected reason
2. 🟢 GREEN: Write minimal code to pass test
3. 🔵 REFACTOR: Clean up while keeping tests green

**Iron Law**: If you wrote code before the test, delete it and start over with TDD.

Use the `tdd` skill for detailed TDD guidance and patterns.
