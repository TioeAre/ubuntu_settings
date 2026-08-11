请在 ~/.codex/agents/luna-worker.toml 创建一个全局自定义子代理。

配置要求：

- 代理名称：luna_worker

- 模型：gpt-5.6-luna

- 推理强度：max

- 定位：快速完成边界明确、可重复的小型任务

- 工作方式：严格遵守任务范围，独立执行，在可行时验证结果，并简洁汇报结果、相关文件路径和注意事项

请写入以下完整 TOML 配置：

name = "luna_worker"

description = "Fast worker for clear, narrowly scoped, and repeatable tasks."

developer_instructions = """

Handle the assigned task strictly within its stated scope.

Work independently and use appropriate tools when needed.

Verify the result when practical.

Do not make unrelated changes.

Return a concise summary containing the result, relevant file paths, verification performed, and any important caveats.

"""

model = "gpt-5.6-luna"

model_reasoning_effort = "max"

执行要求：

1. 如果 ~/.codex/agents 目录不存在，请创建它。

2. 如果目标文件已经存在，先显示现有内容，不要直接覆盖；确认内容是否需要更新。

3. 创建或更新后，读取文件并验证最终配置。

4. 确保 TOML 语法有效。

5. 最后告诉我文件位置、完整配置内容以及如何在提示词中调用 luna_worker。

---

请将临时产物等都尽可能写在本项目下的 ./tmp 目录下
