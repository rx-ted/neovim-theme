# NvChad 分析与适配报告

当前仓库是 NvChad v2.5 的超集式个人定制，目标平台已由 Arch 调整为 **macOS + Homebrew**。

## 保留的 NvChad 核心
- 懒加载框架（`lua/bootstrap.lua`）
- base46 主题（`lua/chadrc.lua` + `lua/themes/`）
- ui/statusline/tabufline（`lua/gale/chadrc_aux.lua`）
- NvChad 本体 v2.5（`bootstrap.lua` 导入）

## 已修改
- `lua/configs/lazy.lua`：dev path 由失效的 `/home/gale/workspace/neovim/` 改为平台无关 `${stdpath config}/../dev/plugins/`
- `lua/options.lua`：移除失效的 `python3_host_prog = "/opt/homebrew/bin/python3"`
- `lua/plugins/init.lua`：停用并删除 10 个插件 spec

## 已删除的插件（10 个）
codesnap, crates, gleam, mylorem, precognition, rustaceanvim, screenkey, showkeys, vim-astro, vim-visual-multi

> 保留：`scrolleof`、`ts-autotag`（与已删插件相邻但功能不同，未删）

## 待办
- [ ] 启用 Python provider：安装 `pynvim` 并设置正确的 `python3_host_prog`
- [ ] 重启后 `:Lazy sync` + `:Lazy clean` 移除已删插件的本地文件
- [ ] 按实际语言栈进一步裁剪插件
