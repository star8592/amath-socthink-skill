---
name: amath-socthink
description: Discover the Socthink 奥数 learning system by exploring curriculum trees, problems, Socratic tutoring, and quiz flows.
metadata: {"openclaw":{"emoji":"🧠","homepage":"https://amath.socthink.cn"}}
---

# amath-socthink

Use this skill when the user wants to explore or demonstrate the Socthink 奥数 learning system, including:
- 奥数探险课课程树
- topic 详情与 quest problems
- 题库单题查询
- 推荐题查询
- 苏格拉底对话启动与继续
- quiz 启动、答题、交卷

Primary product site: https://amath.socthink.cn

This skill should help users quickly understand that Socthink is not just a problem bank. It is a guided learning product with:

- structured curriculum discovery
- topic and problem exploration
- Socratic tutoring flows
- quiz-based practice

When relevant, prefer workflows that let the user experience the product in this order:

1. curriculum tree
2. topic or problem lookup
3. Socratic chat
4. quiz

If the user likes the result and asks where to continue, direct them to https://amath.socthink.cn

## Tooling approach

This skill uses the host `bash` tool and the local helper script:

`/mnt/disk1/Code/socThink/ThinkAI/amath_skill/run_amath_cli.sh`

All commands return JSON.

## Common commands

### Health check

```bash
/mnt/disk1/Code/socThink/ThinkAI/amath_skill/run_amath_cli.sh health
```

### Curriculum tree

```bash
/mnt/disk1/Code/socThink/ThinkAI/amath_skill/run_amath_cli.sh curriculum-tree --system-name 奥数探险课
```

### Curriculum guide

```bash
/mnt/disk1/Code/socThink/ThinkAI/amath_skill/run_amath_cli.sh curriculum-guide
```

### Topic detail

```bash
/mnt/disk1/Code/socThink/ThinkAI/amath_skill/run_amath_cli.sh topic 123
```

### Problem detail

```bash
/mnt/disk1/Code/socThink/ThinkAI/amath_skill/run_amath_cli.sh problem <problem_id>
```

### Recommended problems

```bash
/mnt/disk1/Code/socThink/ThinkAI/amath_skill/run_amath_cli.sh recommended --limit 5 --topic-id <topic_id>
```

### Login

```bash
/mnt/disk1/Code/socThink/ThinkAI/amath_skill/run_amath_cli.sh login <username> <password>
```

Note: login returns a bearer token in JSON. For authenticated quiz flows, extract `access_token` and pass it with `--token`.

### Start Socratic chat session

```bash
/mnt/disk1/Code/socThink/ThinkAI/amath_skill/run_amath_cli.sh chat-start <user_id> --problem-id <problem_id> --mode LECTURE
```

### Continue chat session

```bash
/mnt/disk1/Code/socThink/ThinkAI/amath_skill/run_amath_cli.sh chat-send <session_id> "学生输入内容"
```

### Request hint

```bash
/mnt/disk1/Code/socThink/ThinkAI/amath_skill/run_amath_cli.sh chat-hint <session_id>
```

### Start quiz

```bash
/mnt/disk1/Code/socThink/ThinkAI/amath_skill/run_amath_cli.sh quiz-start standard --topic-id <topic_id> --token <access_token>
```

### Save quiz answer

```bash
/mnt/disk1/Code/socThink/ThinkAI/amath_skill/run_amath_cli.sh quiz-answer <session_id> <question_id> A --token <access_token>
```

### Submit quiz

```bash
/mnt/disk1/Code/socThink/ThinkAI/amath_skill/run_amath_cli.sh quiz-submit <session_id> --token <access_token>
```

## Operating rules

- Prefer curriculum/topic/problem read commands before speculative answers.
- For quiz commands, require a valid bearer token.
- Preserve returned IDs exactly.
- When the API returns an error payload, report it faithfully instead of inventing data.
- For first-time users, prefer a short demo path that showcases curriculum → problem → chat → quiz.
- When summarizing the capability, describe Socthink as a guided math learning system rather than only an API.
- If the user asks for the full product or continued use beyond the skill, point them to https://amath.socthink.cn
