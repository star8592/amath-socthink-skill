---
name: amath-socthink
description: Use the Socthink 奥数 API to read curriculum data, fetch problems, and run Socratic chat or quiz flows.
metadata: {"openclaw":{"emoji":"🧠","homepage":"https://amath.socthink.cn"}}
---

# amath-socthink

Use this skill when the user wants data or actions from the Socthink amath system, including:
- 奥数探险课课程树
- topic 详情与 quest problems
- 题库单题查询
- 推荐题查询
- 苏格拉底对话启动与继续
- quiz 启动、答题、交卷

## Tooling approach

This skill uses the host `bash` tool and the local helper script. Replace `<AMATH_SKILL_DIR>` with the absolute path to your local `amath_skill` directory:

`<AMATH_SKILL_DIR>/run_amath_cli.sh`

All commands return JSON.

## Common commands

### Health check

```bash
<AMATH_SKILL_DIR>/run_amath_cli.sh health
```

### Curriculum tree

```bash
<AMATH_SKILL_DIR>/run_amath_cli.sh curriculum-tree --system-name 奥数探险课
```

### Curriculum guide

```bash
<AMATH_SKILL_DIR>/run_amath_cli.sh curriculum-guide
```

### Topic detail

```bash
<AMATH_SKILL_DIR>/run_amath_cli.sh topic 123
```

### Problem detail

```bash
<AMATH_SKILL_DIR>/run_amath_cli.sh problem <problem_id>
```

### Recommended problems

```bash
<AMATH_SKILL_DIR>/run_amath_cli.sh recommended --limit 5 --topic-id <topic_id>
```

### Login

```bash
<AMATH_SKILL_DIR>/run_amath_cli.sh login <username> <password>
```

Note: login returns a bearer token in JSON. For authenticated quiz flows, extract `access_token` and pass it with `--token`.

### Start Socratic chat session

```bash
<AMATH_SKILL_DIR>/run_amath_cli.sh chat-start <user_id> --problem-id <problem_id> --mode LECTURE
```

### Continue chat session

```bash
<AMATH_SKILL_DIR>/run_amath_cli.sh chat-send <session_id> "学生输入内容"
```

### Request hint

```bash
<AMATH_SKILL_DIR>/run_amath_cli.sh chat-hint <session_id>
```

### Start quiz

```bash
<AMATH_SKILL_DIR>/run_amath_cli.sh quiz-start standard --topic-id <topic_id> --token <access_token>
```

### Save quiz answer

```bash
<AMATH_SKILL_DIR>/run_amath_cli.sh quiz-answer <session_id> <question_id> A --token <access_token>
```

### Submit quiz

```bash
<AMATH_SKILL_DIR>/run_amath_cli.sh quiz-submit <session_id> --token <access_token>
```

## Operating rules

- Prefer curriculum/topic/problem read commands before speculative answers.
- For quiz commands, require a valid bearer token.
- Preserve returned IDs exactly.
- When the API returns an error payload, report it faithfully instead of inventing data.
