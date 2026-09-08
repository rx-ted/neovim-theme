# NvChad 分析与适配报告

当前仓库是 NvChad v2.5 的超集式个人定制，目标平台已由 Arch 调整为 **macOS + Homebrew**。

## 保留的 NvChad 核心
- 懒加载框架（`lua/bootstrap.lua`）
- base46 主题（`lua/chadrc.lua` + `lua/themes/`）
- ui/statusline/tabufline（`lua/gale/chadrc_aux.lua`）
- NvChad 本体 v2.5（`bootstrap.lua` 导入）

## 已修改
- `lua/configs/lazy.lua`：dev path 由失效的 `/home/gale/workspace/neovim/` 改为平台无关 `${stdpath config}/../dev/plugins/`
- `lua/options.lua`：移除失效的 `python3_host_prog = "/opt/homebrew/bin/python3"`；并在 `nvchad.options` 之后重新启用 python/node provider
- `lua/plugins/init.lua`：停用并删除 10 个插件 spec
- `init.lua`：在启动最早期设置 `python3_host_prog = "/opt/homebrew/bin/python3.10"`
- `lua/bootstrap.lua`：移除无效的 "Re-activate providers" 循环（`runtime python3_provider` 无此文件），改由 `options.lua` 处理

## 已删除的插件（10 个）
codesnap, crates, gleam, mylorem, precognition, rustaceanvim, screenkey, showkeys, vim-astro, vim-visual-multi

> 保留：`scrolleof`、`ts-autotag`（与已删插件相邻但功能不同，未删）

## 待办
- [x] 启用 Python provider：已安装 pynvim 0.6.0 到 Homebrew python3.10，`has('python3')` = 1
- [x] node provider：已 `npm install -g neovim`，`has('node')` = 1
- [x] 清理：已删插件在 lazy 目录与 lazy-lock.json 中均无残留（原本未安装），无需 `:Lazy clean`
- [ ] 按实际语言栈进一步裁剪插件
