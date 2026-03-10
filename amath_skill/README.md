# amath skill

一个可直接连接 `amath.socthink.cn` 后端的技能实现，当前同时提供：

- MCP 风格 Python 服务
- OpenClaw 官方 Skill 目录包装

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
