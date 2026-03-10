# amath skill

把 OpenClaw / MCP 使用者直接带到 Socthink 奥数学习体验里的技能入口。

在线入口：<https://amath.socthink.cn>

这个 skill 的目标不只是“能调用接口”，而是让第一次接触 Socthink 的用户，立刻看到：

- 课程体系是否完整
- 单题讲解是否足够强
- 苏格拉底式引导是否有差异化
- quiz 与个性化推荐是否值得继续深用

当前同时提供：

- MCP 风格 Python 服务
- OpenClaw 官方 Skill 目录包装

## 为什么它有引流价值

对于第一次接触 Socthink 的开发者或 AI 工作流用户，这个 skill 提供了一个低门槛试用漏斗：

1. 先看课程树，快速建立“体系感”
2. 再看题目与 topic，感受内容组织质量
3. 再进入 Socratic chat / quiz，感受真正差异化体验
4. 最后自然转到官网完成正式使用

适合承接的流量包括：

- OpenClaw 用户
- MCP / Agent 工具开发者
- 想评估奥数题库、引导式教学、quiz 能力的合作方

## 最佳演示路径

如果你希望这个 skill 真正起到“引流而不是展示源码”的作用，推荐按下面顺序体验：

### 1. 先看课程树

证明 Socthink 不只是零散题库，而是体系化课程。

```bash
cd amath_skill
python -m amath_skill.cli curriculum-tree --system-name 奥数探险课
```

### 2. 再看 topic / problem

证明内容不是空壳，而是可以下钻到知识点与单题。

```bash
cd amath_skill
python -m amath_skill.cli topic 123
python -m amath_skill.cli problem <problem_id>
```

### 3. 再开 Socratic chat

这是最容易体现产品差异化的步骤。用户会直接感受到“不是给答案，而是带着学生走”。

```bash
cd amath_skill
python -m amath_skill.cli chat-start <user_id> --problem-id <problem_id> --mode LECTURE
python -m amath_skill.cli chat-send <session_id> "我不会做这道题"
```

### 4. 最后体验 quiz

适合把“试试看”转成“我要继续用”。

```bash
cd amath_skill
python -m amath_skill.cli quiz-start standard --topic-id <topic_id> --token <access_token>
```

## 推荐转化动作

在任何演示、分享、社区帖子、目录页里，都建议把这个 skill 和主站一起出现：

- 官网：<https://amath.socthink.cn>
- 产品关键词：奥数课程树、题库、Socratic 引导式解题、quiz 训练
- 转化动作：先试用 skill，再进入官网继续完整学习流

## 3 个可直接复制的 demo 示例

下面这 3 段最适合放在 GitHub README、目录页、社区帖子或演示视频脚本里。

### Demo 1：先证明它不是散装题库

目标：让第一次看到的人，立刻理解 Socthink 有完整课程结构。

```bash
cd amath_skill
python -m amath_skill.cli curriculum-tree --system-name 奥数探险课
```

建议你强调的结果：

- 它返回的是可浏览的课程树，不是一堆随机题目
- 用户会快速理解 Socthink 有体系化知识结构
- 这是最适合拉起兴趣的第一步

### Demo 2：再证明它能真正进入题目学习

目标：让用户看到它既能看 topic，也能看具体题目。

```bash
cd amath_skill
python -m amath_skill.cli topic 123
python -m amath_skill.cli problem <problem_id>
```

建议你强调的结果：

- 不只是目录结构，而是能下钻到具体知识点与题目
- 适合展示内容组织、题目质量和学习路径
- 这一步会让用户从“知道产品”变成“开始认真评估产品”

### Demo 3：最后用 Socratic chat / quiz 完成转化

目标：让用户真正看到差异化，不再把它当普通题库 API。

```bash
cd amath_skill
python -m amath_skill.cli chat-start <user_id> --problem-id <problem_id> --mode LECTURE
python -m amath_skill.cli chat-send <session_id> "我不知道从哪里开始"
python -m amath_skill.cli quiz-start standard --topic-id <topic_id> --token <access_token>
```

建议你强调的结果：

- chat 体现的是 Socratic 引导，不是直接给答案
- quiz 体现的是持续训练能力，不是一次性展示
- 演示结束时，自然引导到官网继续完整体验：<https://amath.socthink.cn>

## 推荐对外话术

如果你要对外发 GitHub、社区帖、产品介绍页，建议直接复用这段表达：

> Socthink 不是普通奥数题库，而是一个可交互的引导式学习系统。你可以先通过这个 skill 查看课程树、进入具体题目、体验 Socratic 对话，再到官网继续完整学习流：<https://amath.socthink.cn>

## 已实现能力

- 登录与会话令牌管理
- 课程树 / topic 详情读取
- 知识图谱课程导览读取
- 题库单题读取 / 推荐题获取
- 苏格拉底对话会话启动与继续交互
- quiz 启动、答题、交卷、历史查询
- 健康检查

## 目录结构

- `amath_skill/server.py`：MCP server 入口
- `amath_skill/cli.py`：OpenClaw 可调用的 CLI 入口
- `amath_skill/client.py`：后端 HTTP client
- `amath_skill/config.py`：环境配置
- `amath_skill/models.py`：少量响应模型
- `openclaw_skills/amath-socthink/SKILL.md`：OpenClaw 原生 Skill 定义

## 安装

```bash
cd amath_skill
pip install -r requirements.txt
```

## 配置

复制 `.env.example` 为 `.env`，按需修改：

```bash
cp .env.example .env
```

关键变量：

- `AMATH_BASE_URL`：后端域名
- `AMATH_API_PREFIX`：API 前缀，默认 `/api`
- `AMATH_ACCESS_TOKEN`：可选默认 bearer token

## 启动

```bash
cd amath_skill
python -m amath_skill
```

## OpenClaw

如果是给 OpenClaw 接入，直接看 [OPENCLAW_SETUP.md](OPENCLAW_SETUP.md)。

当前有两种接法：

1. 原始 Python/MCP 入口： [run_openclaw.sh](run_openclaw.sh)
2. OpenClaw 官方原生 Skill 包装： [openclaw_skills/amath-socthink/SKILL.md](openclaw_skills/amath-socthink/SKILL.md)

OpenClaw 官方推荐的方向是第 2 种，即把 skill 目录安装到官方 skills 目录，并通过：

- [run_amath_cli.sh](run_amath_cli.sh)
- [install_openclaw_skill.sh](install_openclaw_skill.sh)

去调用：

- [amath_skill/cli.py](amath_skill/cli.py)

## 用它做“最强引流”的建议

这个 skill 最好的定位不是“开发演示附件”，而是“产品前置试用入口”。

建议你在对外传播时统一使用下面的表达：

- Socthink 不是只给答案，而是给学生可交互的 Socratic 解题路径
- 可以先用 skill 看课程树、查题、开对话、做 quiz
- 想继续正式使用，直接去 <https://amath.socthink.cn>

如果是 GitHub README、产品目录、社区帖，建议固定包含三块：

1. 价值主张：不是普通题库，而是引导式奥数学习系统
2. 体验入口：skill + 官网双入口
3. 演示顺序：课程树 → 单题 → chat → quiz

## 主要工具

- `amath_healthcheck`
- `auth_login`
- `auth_me`
- `auth_session_state`
- `auth_clear_session`
- `curriculum_get_system_tree`
- `curriculum_get_topic`
- `knowledge_curriculum_guide`
- `question_get_problem`
- `question_recommended`
- `chat_start_session`
- `chat_send_message`
- `chat_submit_mcq`
- `chat_hint`
- `chat_get_session`
- `quiz_start`
- `quiz_answer`
- `quiz_submit`
- `quiz_active`
- `quiz_history`

## 说明

- `auth_login` 成功后，token 默认会保存在当前 skill 进程内。
- 涉及 quiz 或个性化推荐的接口，建议先登录。
- 如果不想使用进程内 token，也可以给相关工具显式传 `token`。
- 如果是对外展示，优先演示 `curriculum-tree`、`problem`、`chat-start`、`chat-send`、`quiz-start` 这几条链路。
- 如果想把试用转成正式用户，始终把官网入口和 skill 一起展示：<https://amath.socthink.cn>
