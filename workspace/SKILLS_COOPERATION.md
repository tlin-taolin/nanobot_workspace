# Proactive-Agent & Self-Improving 协同作战手册 🦞🧠

本文档说明了 `proactive-agent`（主动性架构）与 `self-improving`（经验学习）在当前工作空间中的配合逻辑。

## 1. 核心架构：指挥中心与经验工厂

我们采用 **“分层记忆”** 架构，将记忆分为“正式指令”与“原始经验”：

*   **指挥中心 (Command Center)**: `USER.md` (偏好) 和 `SOUL.md` (准则)。
    *   这里存放经过验证的、长期生效的规则。
    *   它是我的“最高行动纲领”。
*   **经验工厂 (Experience Factory)**: `./skills/self-improving/data/`。
    *   这里存放琐碎的纠错 (`corrections.md`)、初步观察到的模式 (`memory.md`) 和项目特定细节。
    *   它是我的“原始数据处理厂”。

## 2. 核心协议：WAL + 晋升机制

### WAL (Write-Ahead Log) 协议
在回复你的任何“修正”或“决策”之前，我会优先执行写入：
1.  **临时修正**：写入 `self-improving/data/corrections.md`。
2.  **当前任务状态**：写入 `SESSION-STATE.md`。

### 晋升流水线 (Promotion Pipeline)
经验不是杂乱无章增长的，而是有生命周期的：
1.  **捕获 (Capture)**: 记录所有新出现的纠错或偏好。
2.  **识别 (Identify)**: 追踪重复。如果一个规则在工厂中被确认了 **3次**。
3.  **晋升 (Promote)**: 我会在 `HEARTBEAT.md` 检查中提议将该规则从“工厂”移动到“指挥中心”（`USER.md` 或 `SOUL.md`）。
4.  **清理 (Clean)**: 晋升后，原始记录将被归档，保持工厂整洁。

## 3. 通知策略：高价值过滤

为了避免在飞书/Telegram 中产生无意义的消息（如“已完成自检”），我们执行 **“静默执行 + 关键点推送”**：

*   **静默模式 (Silent)**: 日常维护、心跳检查、日志清理等。使用 `isolated agentTurn` 在后台悄悄完成。
*   **通知模式 (Notified)**: 只有当 `./skills/self-improving/check_conversation.sh` 返回“高价值行为”时才发送消息。
    *   *触发点*：记忆晋升建议、重大 Bug 修复、核心配置（`SOUL.md` 等）变更。

## 4. 执行逻辑：百折不挠 (Relentless Resourcefulness)

当遇到错误或任务失败时：
1.  **不准立刻求助**：在向你报告“不行”之前，我必须尝试至少 **10种** 不同的路径（换工具、换语法、换子代理）。
2.  **自动修复**：如果我修复了一个导致多次失败的问题，该修复逻辑会自动进入“经验工厂”进行学习。

## 5. 保护层：Git 版本控制

所有的修改都受到 Git 的保护：
*   **原子提交**：每次修改核心配置后都会生成提交记录。
*   **一键回滚**：如果我不小心学坏了，你可以随时通过 `git checkout` 让我回到昨天的状态。

## 6. 技术实现对齐 (Technical Alignment)

当前的记忆架构已通过 `/Users/tlin/Dropbox/mytools/nanobot` 源码验证，确保了与核心引擎的深度集成：

*   **Bootstrap 机制对齐**：根据 `nanobot/agent/context.py` 的 `BOOTSTRAP_FILES` 定义，系统启动时会自动加载 `USER.md` 和 `SOUL.md`。因此，我们将“指挥中心”设立在这两个文件中，确保所有核心偏好和准则在会话开始时即被注入 System Prompt。
*   **Memory 分离策略**：
    *   `memory/MEMORY.md` & `HISTORY.md`：由核心引擎的 `MemoryStore.py` 自动维护，主要用于存储“事实性历史”和 LLM 自动归并的长文本。
    *   `skills/self-improving/data/`：由本协同手册定义，用于存储“执行质量经验”和“动态工作模式”。
*   **读取优先级**：在处理非琐碎任务前，我必须优先执行 `find ./skills/self-improving/data/` 操作，这符合 `SOUL.md` 中注入的 `Self-Improving Steering` 逻辑。

---

*“Proactive 让现在的我更有用，Self-Improving 让未来的我更聪明。”*
