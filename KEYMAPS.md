# Neovim 全快捷键参考 / Complete Keymaps Reference

> 本文件汇总本配置**所有已启用插件**的键位：自定义键位 + 配置中显式改写的键位，
> 并按插件分组、中英对照。插件自带但未在本配置改写的键位仅作简注（以插件文档为准）。
>
> This file lists every keymap in this config: custom mappings **plus** any
> mappings explicitly overridden in the config, grouped by plugin with bilingual
> descriptions. Plugin-internal defaults that were **not** touched are only
> briefly noted (see the plugin docs for the full list).

## 图例 / Legend

- `<leader>` = `Space`（NvChad 默认）· `<A-x>` = Option · `<C-x>` = Ctrl · `;` 已被映射为 `:`
- Modes：`n` normal · `v` visual · `x` operator-pending / visual · `i` insert · `s` select · `t` terminal · `o` operator
- `禁用` = 该插件在配置中 `enabled = false`，键位不会生效

---

## 1. 核心通用键位 / Core (`lua/mappings.lua`)

| Key 按键 | Mode | Command / Callback | Function 功能 | Description 描述 |
|---------|------|--------------------|---------------|-----------------|
| `z-` | n | `z^` | Jump to first non-blank of line | 跳到行首非空字符（重映射） |
| `g-` | n | `g;` | Go to last change position | 跳到上次修改位置（重映射） |
| `;` | n | `:` | Enter command-line mode | 进入命令行模式 |
| `jk` | i | `<ESC>` | Exit insert mode | 退出插入模式 |
| `<C-c>` | n | `%y+` | Copy the whole file | 复制整个文件内容 |
| `<C-s>` | n, i | `w` | Save file | 保存文件 |
| `<Esc>` | n | `noh` | Clear search highlights | 清除搜索高亮 |
| `<leader>cs` | n | `<cmd><CR>` | Clear statusline (*no-op*) | 清空状态栏（实际为空命令） |
| `<leader><F4>` | n | `stop` | Interrupt / freeze Neovim | 中断（挂起）Neovim |
| `<leader>cm` | n | `mes clear` | Clear message area | 清空消息区 |
| `<A-BS>` | i | `<C-w>` | Delete the word before cursor | 向后删除一个单词 |
| `<leader>ol` | n | `vim.ui.open` | Open file's folder in explorer | 在系统资源管理器中打开当前文件所在目录 |
| `j` / `k` | n | expr | Smart movement over wrapped lines (keeps count) | 折行时智能移动（保留计数） |
| `<Up>` / `<Down>` | n | expr | Smart movement over wrapped lines | 折行时智能上下移动 |
| `<C-b>` | i | `<ESC>^i` | Go to beginning of line | 光标移到行首 |
| `<C-e>` | i | `<End>` | Go to end of line | 光标移到行尾 |
| `<C-A-h>` / `<C-A-l>` | i | `<Left>` / `<Right>` | Move left / right | 光标左/右移 |
| `<C-A-j>` / `<C-A-k>` | i | `<Down>` / `<Up>` | Move down / up | 光标下/上移 |
| `<leader>gm` | n | `exe line('$')/2 G` | Go to the middle of the file | 跳到文件中间行 |
| `<A-Down>` / `<A-j>` | n | `m .+1` | Move line down | 当前行下移 |
| `<A-Up>` / `<A-k>` | n | `m .-2` | Move line up | 当前行上移 |
| `<A-Down>` / `<A-j>` | i | `<Esc>:m .+1<CR>==gi` | Move line down (stay in insert) | 下移当前行并保持插入模式 |
| `<A-Up>` / `<A-k>` | i | `<Esc>:m .-2<CR>==gi` | Move line up (stay in insert) | 上移当前行并保持插入模式 |
| `<A-Down>` / `<A-j>` | v | `m '>+1` + reselect | Move selected lines down | 下移选中行 |
| `<A-Up>` / `<A-k>` | v | `m '<-2` + reselect | Move selected lines up | 上移选中行 |
| `<C-h>` / `<C-l>` | n | `<C-w>h` / `<C-w>l` | Switch window left / right | 切到左/右窗口 |
| `<C-j>` / `<C-k>` | n | `<C-w>j` / `<C-w>k` | Switch window down / up | 切到下/上窗口 |
| `<C-A-h>` | n | `5<C-w>>` | Widen window by 5 | 窗口加宽 5 列 |
| `<C-A-l>` | n | `5<C-w><` | Narrow window by 5 | 窗口收窄 5 列 |
| `<C-A-k>` | n | `5<C-w>+` | Increase window height by 5 | 窗口加高 5 行 |
| `<C-A-j>` | n | `5<C-w>-` | Decrease window height by 5 | 窗口压低 5 行 |
| `<leader>n` | n | `set nu!` | Toggle line numbers | 切换行号 |
| `<leader>rn` | n | `set rnu!` | Toggle relative line numbers | 切换相对行号 |
| `<leader>ih` | n | `ToggleInlayHints` | Toggle inlay hints | 切换 inlay hints |
| `<leader>ch` | n | `NvCheatsheet` | Toggle NvChad cheatsheet | 切换 NvChad 速查表 |
| `<leader>ds` | n | `vim.diagnostic.setloclist` | Send diagnostics to loclist | 诊断结果写入位置列表 |
| `<leader>cp` | n | `minty.huefy` | Open color picker | 打开颜色选择器 |
| `<leader>ui` | n | `nvchad.themes` | Open theme picker | 打开主题选择器 |
| `<leader>mn` | n, v | `menu.open` | Open the NvChad right-click menu | 打开 NvChad 菜单 |
| `<RightMouse>` | n, v | `menu.open(mouse)` | Open menu at mouse position | 在鼠标位置打开菜单 |
| `<C-x>` | t | `<C-\><C-N>` | Return to normal mode from terminal | 终端退出到普通模式 |
| `<A-v>` | n, t | `term.toggle vsp` | Toggle vertical terminal | 切换垂直终端 |
| `<A-h>` | n, t | `term.toggle sp` | Toggle horizontal terminal | 切换水平终端 |
| `<C-A-l>` | n, t | `term.toggle sp (loc)` | Horizontal terminal in buffer dir | 在缓冲区目录打开水平终端 |
| `<C-A-h>` | n, t | `term.new sp (loc)` | New horizontal terminal in buffer dir | 在缓冲区目录新建水平终端 |
| `<A-i>` | n, t | `term.toggle float` | Toggle floating terminal | 切换浮动终端 |
| `<A-S-i>` | n, t | `term.toggle float (loc)` | Floating terminal in buffer dir | 在缓冲区目录打开浮动终端 |
| `<leader>it` | n, v | `toggle_inspect_tree` | Toggle TreeSitter inspect tree | 切换 treesitter 检查树 |
| `<leader>ii` | n | `Inspect` | Inspect syntax under cursor | 检查光标处语法 |
| `<Tab>` | n | `tabufline.next` | Go to next buffer | 切换到下一个缓冲区 |
| `<S-Tab>` | n | `tabufline.prev` | Go to previous buffer | 切换到上一个缓冲区 |
| `<leader>bn` | n | `enew` | New empty buffer | 新建空缓冲区 |
| `<leader>bh` | n | `split \| enew` | New buffer in horizontal split | 水平分屏新建缓冲区 |
| `<leader>bv` | n | `vsplit \| enew` | New buffer in vertical split | 垂直分屏新建缓冲区 |
| `<leader>x` | n | `tabufline.close_buffer` | Close current buffer | 关闭当前缓冲区 |
| `<A-Left>` | n | `move_buf(-1)` | Move buffer left in tabline | 在标签栏左移缓冲区 |
| `<A-Right>` | n | `move_buf(1)` | Move buffer right in tabline | 在标签栏右移缓冲区 |
| `<A-|>` | n | `TabuflineToggle` | Toggle tabline visibility | 切换标签栏显隐 |
| `<A-1>` … `<A-9>` | n | `i gt` | Go to tab **i** | 跳到第 i 个标签页 |
| `gh` | n | `go_to_github_link` | Open GitHub repo link under cursor | 打开光标处的 GitHub 链接 |
| `<leader>rl` | n | ROT13 | ROT13-encode the current line | 当前行 ROT13 加密 |
| `<leader>rf` | n | ROT13 (whole file) | ROT13-encode the whole file | 整个文件 ROT13 加密 |
| `<leader>wq` | n | `:wq` | Write and quit | 保存并退出 |
| `<leader>q` | n | `:q!` | Quit window (see Notes §冲突) | 关闭当前窗口（见冲突说明） |
| `<leader><leader>q` | n | `:qa!` | Quit all windows | 退出所有窗口 |
| `<leader>lz` | n | `Lazy` | Open lazy.nvim UI | 打开 lazy.nvim 管理界面 |

---

## 2. LSP（`lua/gale/lsp.lua`，缓冲区生效 buffer-local）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `gd` | n | `v:lsp.buf.definition` | Go to definition | 跳到定义 |
| `gi` | n | `v:lsp.buf.implementation` | Go to implementation | 跳到实现 |
| `<leader>gd` | n | `v:lsp.buf.declaration` | Go to declaration | 跳到声明 |
| `<leader>sh` | n | `v:lsp.buf.signature_help` | Show signature help | 显示函数签名帮助 |
| `<leader>wa` | n | `add_workspace_folder` | Add workspace folder | 添加工作区文件夹 |
| `<leader>wr` | n | `remove_workspace_folder` | Remove workspace folder | 移除工作区文件夹 |
| `<leader>wl` | n | list folders | List workspace folders | 列出工作区文件夹 |
| `<leader>gr` | n | `v:lsp.buf.references` | Show references | 查找引用（见冲突说明） |
| `<leader>gt` | n | `v:lsp.buf.type_definition` | Go to type definition | 跳到类型定义 |
| `<leader>ra` | n | `nvchad.lsp.renamer` | Rename symbol | 重命名符号 |

---

## 3. 补全 / 代码片段 (Completion & Snippets)

### nvim-cmp（`override/cmp.lua` 及 NvChad 默认）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<C-p>` | i | `select_prev_item` | Select previous item | 选择上一个补全项 |
| `<C-n>` | i | `select_next_item` | Select next item | 选择下一个补全项 |
| `<C-d>` | i | `scroll_docs(-4)` | Scroll docs up | 向上滚动文档 |
| `<C-f>` | i | `scroll_docs(4)` | Scroll docs down | 向下滚动文档 |
| `<C-Space>` | i | `complete` | Manually trigger completion | 手动触发补全 |
| `<C-e>` | i | `close` | Close completion menu | 关闭补全菜单 |
| `<CR>` | i | `confirm(select=true)` | Confirm selection (insert) | 确认并插入补全项 |
| `<Tab>` | i, s | `fallback()` | Plain Tab *(supersedes NvChad default)* | 普通 Tab（覆盖了 NvChad 的组合逻辑） |
| `<S-Tab>` | i, s | `fallback()` | Plain Shift-Tab | 普通 Shift-Tab |

> 命令行补全（`/`、`?`、`:`）沿用 `cmp.mapping.preset.cmdline()` 默认键位。

### LuaSnip（`override/luasnip.lua` + `nvchad.configs.luasnip`）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<C-y>` | i, s | `ls.expand` | Expand snippet | 展开代码片段 |
| `<C-k>` | i, s | `ls.jump(1)` | Jump to next tabstop | 跳到下一个跳转点 |
| `<C-j>` | i, s | `ls.jump(-1)` | Jump to previous tabstop | 跳到上一个跳转点 |
| `<C-e>` | i, s | `ls.change_choice(1)` | Cycle snippet choice | 切换片段选项 |

---

## 4. CodeCompanion（opencode / ACP 后端，`spec/codecompanion.lua`）

### 自定义键位 / Custom

| Key 按键 | Mode | Command | Function 功能 | Description 描述 |
|---------|------|---------|---------------|-----------------|
| `<leader>aa` | n | `CodeCompanionActions` | Open the action palette | 打开操作面板（动作、提示词库） |
| `<leader>ac` | n | `CodeCompanionChat Toggle` | Toggle the chat buffer | 切换聊天窗口 |
| `<leader>an` | n | `CodeCompanionChat` | Open a new chat | 新建聊天窗口 |
| `<leader>ai` | n | `CodeCompanion` | Open the inline assistant | 打开内联助手 |
| `ga` | v | `CodeCompanionChat Add` | Add selection to chat | 把选区追加到当前聊天 |

### 聊天窗口内置键 / Chat buffer defaults（`filetype=codecompanion`）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<C-s>` | n, i | `keymaps.send` | Send message *(replaces default `<CR>`)* | 发送消息（替代默认的 `<CR>`） |
| `<C-c>` | n, i | `keymaps.close` | Close the chat buffer | 关闭聊天窗口 |
| `?` | n | `keymaps.options` | Show available keymaps | 查看可用按键 |
| `<C-_>` | i | `keymaps.completion` | Open completion menu | 打开补全菜单 |
| `q` | n | `keymaps.stop` | Stop current request | 停止当前请求 |
| `gr` | n | `keymaps.regenerate` | Regenerate the last response | 重新生成上一条回复 |
| `gx` | n | `keymaps.clear` | Clear all messages | 清空聊天记录 |
| `gc` | n | `keymaps.codeblock` | Insert an empty codeblock | 插入空代码块 |
| `gy` | n | `keymaps.yank_code` | Yank code from last codeblock | 复制最后一个代码块 |
| `gba` | n | `buffer_sync_all` | Toggle live-sync of pinned buffers | 切换固定缓冲区实时同步 |
| `gbd` | n | `buffer_sync_diff` | Toggle diff-only sync | 切换仅 diff 同步 |
| `{` / `}` | n | `keymaps.previous/next_chat` | Switch chat history | 切换上/下一个聊天 |
| `[[` / `]]` | n | `previous/next_header` | Jump to previous/next header | 跳到上/下一个标题 |
| `ga` | n | `keymaps.change_adapter` | Change adapter / model | 切换模型与适配器 |
| `gf` | n | `keymaps.fold_code` | Fold all codeblocks | 折叠所有代码块 |
| `gd` | n | `keymaps.debug` | Show debug info | 显示聊天调试信息 |
| `gs` | n | `toggle_system_prompt` | Toggle system prompt | 显示/隐藏系统提示词 |
| `gM` | n | `keymaps.clear_rules` | Remove rules from chat | 移除聊天规则 |
| `gtx` | n | `clear_approvals` | Reset cached tool approvals | 重置工具授权缓存 |
| `gty` | n | `keymaps.yolo_mode` | Toggle YOLO auto-approve | 切换 YOLO 自动授权 |
| `gR` | n | `goto_file_under_cursor` | Open file under cursor | 打开光标处文件路径 |
| `gm` | n | `keymaps.btw` | Follow-up while streaming *(remote only)* | 流式期间补充追问 |

### 输入触发前缀 / Input triggers

| Trigger | Function | Description 描述 | Example 示例 |
|---------|----------|-----------------|-------------|
| `/` | Slash commands | 斜杠命令（提示词库） | `/help` |
| `#` | Editor context | 附加上下文 | `#buffer`、`#chat`、`#clipboard` |
| `@` | Tools | 调用工具 | `@Buffer`、`@ReadFile` |
| `\` | ACP slash commands | ACP（opencode）侧斜杠命令 | `\plan` |

### 相关命令 / Commands

`:CodeCompanion [prompt]` · `:CodeCompanionChat [adapter=.. model=..] [Add|Toggle|Changes|RefreshCache]` ·
`:CodeCompanionCLI [prompt]` · `:CodeCompanionCmd` · `:CodeCompanionActions` · `:CodeCompanionCodeReview [Comment]`

---

## 5. Harpoon（`spec/harpoon.lua`，harpoon2）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<A-q>` | n | `list:select(1)` | Go to 1st listed buffer | 跳到第 1 个标记缓冲区 |
| `<A-w>` | n | `list:select(2)` | Go to 2nd listed buffer | 跳到第 2 个标记缓冲区 |
| `<A-e>` | n | `list:select(3)` | Go to 3rd listed buffer | 跳到第 3 个标记缓冲区 |
| `<A-r>` | n | `list:select(4)` | Go to 4th listed buffer | 跳到第 4 个标记缓冲区 |
| `<A-t>` | n | `list:select(5)` | Go to 5th listed buffer | 跳到第 5 个标记缓冲区 |
| `<A-y>` | n | `list:select(6)` | Go to 6th listed buffer | 跳到第 6 个标记缓冲区 |
| `<A-a>` | n | `list:add()` | Add current buffer to list | 把当前缓冲区加入列表 |
| `<A-d>` | n | `list:remove()` | Remove current buffer from list | 从列表移除当前缓冲区 |
| `<A-m>` | n | `gale.utils.harpoon_menu` | Open the harpoon menu | 打开 harpoon 菜单 |
| `<A-,>` | n | `list:prev()` | Go to previous listed buffer | 跳到上一个标记缓冲区 |
| `<A-.>` | n | `list:next()` | Go to next listed buffer | 跳到下一个标记缓冲区 |
| `:RunHarpoon` | cmd | `harpoon_menu` | Open the harpoon menu | 打开 harpoon 菜单 |

---

## 6. 文件管理器 / File Explorers

### oil.nvim（`spec/oil.lua`）— 全局

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<C-n>` | n | `toggle_oil` | Toggle oil explorer | 开关 oil 文件管理器 |
| `<C-n>` | n | `<nop>` | *(disabled inside Telescope buffers)* | 在 telescope 缓冲区内禁用 |

### oil 窗口内键位 / Inside the oil buffer

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<CR>` / `<Tab>` | n | `actions.select` | Open entry | 打开所选条目 |
| `<C-v>` | n | `actions.select` (vertical) | Open in vertical split | 垂直分屏打开 |
| `<C-h>` | n | `actions.select` (horizontal) | Open in horizontal split | 水平分屏打开 |
| `<C-t>` | n | `actions.select` (tab) | Open in new tab | 新标签页打开 |
| `<C-p>` | n | `actions.preview` | Preview entry | 预览所选条目 |
| `<C-l>` | n | `actions.refresh` | Refresh listing | 刷新目录列表 |
| `<S-Tab>` / `-` | n | `actions.parent` | Go to parent directory | 进入上级目录 |
| `_` | n | `actions.open_cwd` | Open cwd listing | 打开工作目录列表 |
| `` ` `` | n | `actions.cd` | Switch cwd to this dir | 把当前目录设为 cwd |
| `~` | n | `actions.cd` (tab scope) | `:tcd` to this dir | 以标签页为单位 `:tcd` |
| `gs` | n | `actions.change_sort` | Change sort order | 切换排序方式 |
| `g?` | n | `actions.show_help` | Show oil help | 显示 oil 帮助 |
| `gx` | n | `actions.open_external` | Open with system app | 用系统程序打开 |
| `I` | n | `actions.toggle_hidden` | Toggle hidden files | 切换显示隐藏文件 |
| `g\` | n | `actions.toggle_trash` | Toggle trash view | 切换回收站视图 |
| `<leader>de` | n | toggle columns | Toggle file detail view | 切换文件详情列（权限/大小/时间） |
| `q` | n | `actions.close` | Close oil | 关闭 oil |

> `oil-vcs-status`：仅改变图标/高亮，无键位。

### nvim-tree（`override/nvim-tree.lua`）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<leader>e` | n | `NvimTreeToggle` | Toggle the tree | 开关文件树 |
| `+` | n | `change_root_to_node` | CD into the node | 把节点设为根目录 |
| `?` | n | `toggle_help` | Toggle nvim-tree help | 开关文件树帮助 |
| `<ESC>` | n | `tree.close` | Close the tree | 关闭文件树 |

> 其余键位沿用 nvim-tree 自带默认（`api.config.mappings.default_on_attach`）。

---

## 7. Git 插件 / Git Tools

### gitsigns（`spec/gitsigns.lua`，缓冲区生效）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<leader>hs` | n | `stage_hunk` | Stage hunk | 暂存当前差异块 |
| `<leader>hu` | n | `undo_stage_hunk` | Unstage hunk | 取消暂存差异块 |
| `<leader>hS` | n | `stage_buffer` | Stage whole buffer | 暂存整个文件 |
| `<leader>hR` | n | `reset_buffer` | Reset buffer to HEAD | 重置整个文件 |
| `<leader>hr` | n | `reset_hunk` | Reset hunk | 撤销当前差异块 |
| `<leader>hh` | n | `preview_hunk` | Preview hunk | 预览差异块 |
| `<leader>hn` | n | `nav_hunk(next)` | Go to next hunk | 跳到下一个差异块 |
| `<leader>hb` | n | `nav_hunk(prev)` | Go to previous hunk | 跳到上一个差异块 |
| `<leader>td` | n | `toggle_deleted` | Toggle deleted-line signs | 切换删除行标记 |
| `<leader>bl` | n | `blame_line` | Blame current line | 查看当前行 blame |
| `ih` | o, x | `select_hunk` | Select the hunk as textobject | 把差异块作为文本对象选中 |

### Neogit（`spec/neogit.lua`）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<leader>gg` | n | `:Neogit` | Open Neogit | 打开 Neogit 界面 |

### Fugitive（`spec/fugitive.lua`，未改写，简注）

- 打开 `:Git` / `:G` 后，缓冲区内置键位（`<leader>` + 命令、`=`、`-`、`cc` 等）见 `:help fugitive-maps`。
- 也随插件启用 `rhubarb` / `obsession` / `unimpaired`（unimpaired 提供 `]a / [a` 等）。

### Diffview（`spec/diffview.lua`）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<leader>dv` | n | `:DiffviewOpen` | Open diff view | 打开 diff 视图 |
| `<leader>dc` | n | `:DiffviewClose` | Close diff view | 关闭 diff 视图 |

> diff 面板内键位（`tab` 切换文件、`]x/[x` 跳差异块、`q` 关闭等）见 `:help diffview-maps`。

### grug-far.nvim（`spec/grug-far.lua`）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<leader>gr` | n | toggle `GrugFar` | Toggle search & replace | 开关全局搜索替换（见冲突说明） |

---

## 8. 编辑增强 / Editing

### Comment.nvim（`spec/comment.lua` + `ts-context-commentstring`）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<leader>/` | n | `toggle.linewise.current` | Toggle line comment | 行注释开/关 |
| `<leader>_` | n | `toggle.blockwise.current` | Toggle (block) comment on line | 块注释开/关（单行内） |
| `<leader>/` | x | `operatorfunc` | Comment selection (context-aware) | 按上下文注释选区 |

### Treesitter 文本对象 / Incremental selection（`override/nvim-treesitter.lua`）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<leader>is` | n | Incremental selection init | Start incremental selection | 开启逐步选择 |
| `<Tab>` | n | node_incremental | Expand to next node | 扩展到更大节点 |
| `<S-Tab>` | n | node_decremental | Shrink to previous node | 收缩到更小节点 |
| `<S-s>` | n | scope_incremental | Select whole scope | 选择整个作用域 |
| `af` / `if` | x | function.outer / inner | Select around / inner function | 选择整个/内部函数 |
| `ac` / `ic` | x | class.outer / inner | Select around / inner class | 选择整个/内部类 |
| `as` | x | language scope | Select language scope | 选择语言作用域 |
| `<leader>wn` | n | swap next `@parameter.inner` | Swap with next parameter | 与下一个参数交换 |
| `<leader>wp` | n | swap previous `@parameter.inner` | Swap with previous parameter | 与上一个参数交换 |

### 其余编辑插件（未改写键位，简注）

- **autopairs**（windwp/nvim-autopairs）：自动补全括号/引号，无自定义键位。
- **matchup**：增强 `%` 匹配，扩展 `d%`、`[%`、`z%` 等，见 `:help matchup`.
- **better-escape**：插入模式 `jj` / `jk` 退出（默认配置）。
- **rainbow-delimiters（禁用）**：仅着色，无键位。
- **vim-illuminate（禁用）**：高亮引用，无键位。
- **ts-autotag**：html/tsx 自动改标签，无键位。
- **ts-context-commentstring**：配合 Comment 自动选择注释风格，无键位。
- **zen-mode**：`:ZenMode` 命令（简注：作者常用 `:ZenMode` + 自配按键）。

---

## 9. 查找 / 导航 / 界面

### Telescope（`override/telescope.lua`）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<leader>fa` | n | find_files (all, hidden) | Find all files (incl. hidden/ignored) | 查找所有文件（含隐藏/忽略） |
| `<leader>ff` | n | find_files | Find files | 查找文件 |
| `<leader>fo` | n | oldfiles | Find recent files | 查找最近文件 |
| `<leader>fw` | n | live_grep | Live grep search | 全文正则搜索 |
| `<leader>fb` | n | buffers | Find opened buffers | 查找已打开缓冲区 |
| `<leader>fc` | n | current_buffer_fuzzy_find | Fuzzy find in current buffer | 当前文件内模糊搜索 |
| `<leader>ft` | n | terms | Pick hidden terminals | 选择隐藏终端 |
| `<leader>fr` | n | lsp_references | LSP references picker | LSP 引用 |
| `<leader>ma` | n | marks | Find marks | 查找标记 |
| `<leader>fh` | n | highlights | Find highlights | 查找高亮组 |
| `<leader>fd` | n | diagnostics | LSP diagnostics picker | LSP 诊断 |
| `<leader>ts` | n | treesitter | Treesitter picker | Treesitter 节点 |
| `<leader>fp` | n | builtin | All builtin pickers | 所有内置 picker |
| `<leader>gc` | n | git_commits | Git commit history | Git 提交历史 |
| `<leader>gs` | n | git_status | Git status | Git 状态 |
| `<leader>f?` | n | help_tags | Find help tags | 查找帮助标签 |

> 选择器内部：`<C-j>` 下一项 · `<C-k>` 上一项 · `<C-h>` / `<F1>` 开关预览（i/n 模式，覆盖默认）。

### Hop（`spec/hop.lua`）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<leader><leader>w` | n | `:HopWord` | Hint all words | 跳转到任意单词 |
| `<leader><leader>t` | n | `:HopNodes` | Hint treesitter nodes | 跳转到 treesitter 节点 |
| `<leader><leader>c` | n | `:HopLineStart` | Hint line starts | 跳转到任意行首 |
| `<leader><leader>l` | n | `:HopWordCurrentLine` | Hint word on current line | 跳转到当前行内单词 |

### dropbar（`spec/dropbar.lua`）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<leader>;` | n | `dropbar.pick` | Pick a symbol in the winbar | 在 winbar 中选择符号 |
| `[;` | n | `goto_context_start` | Go to start of current context | 跳到当前上下文起点 |
| `];` | n | `select_next_context` | Select next context | 选择下一个上下文 |

### Trouble（`spec/trouble.lua`）

| Key 按键 | Mode | Callback | Function 功能 | Description 描述 |
|---------|------|----------|---------------|-----------------|
| `<leader>tt` | n | `Trouble diagnostics toggle` | Toggle diagnostics list | 开关诊断列表 |
| `<leader>tb` | n | `Trouble buffer diagnostics` | Diagnostics of current buffer | 当前缓冲区诊断 |
| `<leader>to` | n | `Trouble symbols` | Document symbols | 文档符号列表 |
| `<leader>tL` | n | `Trouble lsp` (right) | LSP locations | LSP 位置列表 |
| `<leader>tl` | n | `Trouble loclist` | Location list | 位置列表 |
| `<leader>tq` | n | `Trouble qflist` | Quickfix list | 快速修复列表 |

### 其余界面插件（简注）

- **which-key**（`override/whichkey.lua`）：`<leader>wK` 显示所有键位 · `<leader>wk` 查询指定前缀。
- **outline**：`<leader>oo` 开关符号大纲（`spec/outline.lua`）。
- **indent-blankline**：`<leader>cc` 跳到当前代码块作用域起点（`override/blankline.lua`）。
- **cloak**：`<leader><F10>` 切换 `.env` 等敏感内容遮蔽（`spec/cloak.lua`）。
- **markdown-preview**：`<leader>mp` 开关浏览器预览（`spec/md-preview.lua`）。
- **goto-preview**：`<leader>q` 关闭定义预览；插件默认 `default_mappings=true` 提供 `gpd`（预览定义）、`gP`（预览声明）、`gpi`、`gpD` 等，见 `:help goto-preview`。
- **ccc**：`cc` 转换颜色格式 · `ch` 开关颜色高亮（`spec/ccc.lua`；注意 `cc` 覆盖了 Vim 内建"修改整行"）。
- **undo-tree**：`<leader>ut` 开关撤销树（`spec/undo-tree.lua`）。
- **todo-comments / markview / helpview / statuscol / edgy / noice / notify / dressing / scrolleof**：均为显示/无键位插件（todo-comments 如需要 `<leader>st`/`<leader>sH` 可自行开启）。
- **fugitive** 见第 7 节。

---

## 10. 调试 DAP

| Key 按键 | Mode | 来源 Source | Callback | Function 功能 | Description 描述 |
|---------|------|------------|----------|---------------|-----------------|
| `<leader>db` | n | dap-ui | `DapToggleBreakpoint` | Toggle breakpoint | 开关断点 |
| `<leader>dt` | n | dap-ui | `sidebar.toggle` | Toggle dap-ui sidebar | 开关调试侧边栏 |
| `<leader>pdr` | n | dap-python | `dap_py.test_method` | Debug Python test method | 调试当前 Python 测试方法 |

> `nvim-dap-virtual-text`：仅虚拟文本显示，无键位。
> DAP 会话中常用内建命令：`:DapContinue`、`:DapStepOver`、`:DapStepInto`、`:DapStepOut`、`:DapTerminate`（可用 `:DapUIToggle`）。

---

## 11. 本地插件 / Local plugins（`plugins/local/`）

| Key 按键 | Mode | 来源 Source | Callback | Function 功能 | Description 描述 |
|---------|------|------------|----------|---------------|-----------------|
| `<leader>yb` | n | yerbreak | `:Yerbreak` | Toggle realistic code typewriter | 切换打字机效果 |
| `<leader>jp` | n | js-playground | `:JSPlayground` | Run JS playground | 运行 JS 演练场 |
| `<leader>jx` | n | js-playground | `:JSPlayground stop` | Stop JS playground | 停止 JS 演练场 |
| `<leader>bs` | n | binary-peek（禁用） | `:BinaryPeek` | Start binary peek | 开始二进制查看 |
| `<leader>bx` | n | binary-peek（禁用） | `:BinaryPeek abort` | Abort binary peek | 中止二进制查看 |
| `<leader>pp` | n | popurri（禁用） | `:Popurri` | Toggle pop-up helper | 开关 popurri |

---

## 12. 已禁用插件 / Disabled plugins（键位不生效）

- **multicursor.nvim**（`enabled = false`）：若启用，可用 `<up>/<down>` 上下加光标、`<leader>n/s/N/S/A/x`、`<c-q>`、可视模式 `<leader>a`(对齐)、`S/I/A/M`、`<leader>t/T` 等（定义见 `spec/multicursor.lua`）。
- **vim-illuminate**、**rainbow-delimiters**、**lsp-signature**、**nvim-colorizer**、**binary-peek**、**popurri**：均 `enabled = false`，未提供生效键位。
- `gale/vscode.lua`：仅在使用 `vscode-neovim`（VS Code 内）时生效——`<leader>/`（注释）、`<leader>ff`（QuickOpen）、`<leader>fw`（QuickTextSearch）。

---

## 13. 自动命令绑定的键位 / Autocmd-driven keymaps（`gale/autocmds.lua`）

| 场景 Context | Key 按键 | Mode | Action | Description 描述 |
|-------------|---------|------|--------|-----------------|
| `empty/help/startuptime/qf/query/lspinfo/man/checkhealth/nvcheatsheet` 等临时缓冲区 | `q` | n | `:close` | 用 `q` 关闭这类窗口 |
| `lazy/mason/Neogit*/qf` 缓冲区 | `<Tab>` / `<S-Tab>` | n | `<nop>` | 禁止用 Tab 切换缓冲区 |
| 终端缓冲区 | `<LeftMouse>` 等 | t | `<nop>` | 禁止点击退出插入模式 |

---

## 冲突与注意事项 / Notes & Conflicts

1. **`<leader>q`**：`mappings.lua` 定义为"退出窗口"（`:q!`），但 `goto-preview` 在 LSP 附加后全局覆盖为"关闭定义预览"。想要退出窗口时请用 `:q` 或 `<leader><leader>q`（退出全部）。
2. **`<leader>gr`**：`gale/lsp.lua`（缓冲区级，LSP 引用）会覆盖 `grug-far` 的全局"搜索替换"——在有 LSP 的文件里 `<leader>gr` 是"查看引用"。
3. **`cc`**（ccc.nvim）覆盖了 Vim 内建"修改整行"命令，如需改行请用 `C` 或 `S`。
4. **`<C-s>`**：全局为"保存文件"；在 CodeCompanion 聊天窗口内被局部映射为"发送消息"（预期行为）。
5. **`ga`**：普通模式仍是 Vim 内建"显示字符编码"；可视模式（本配置）为 CodeCompanion"追加到聊天"；聊天窗口内（普通模式）为"切换模型"——作用域不同，互不冲突。
6. **`;`** 已被映射为 `:`，Vim 内建 `;`（重复上次 `f/t` 搜索）不再可用。
7. **`jk`**：`mappings.lua` 与 `better-escape` 同时提供，功能一致。
8. **`<leader>n`**：多光标插件（已禁用）曾占用，当前生效的是"切换行号"。
9. disabled 插件（第 12 节）的键位在重启后不会注册，若需启用请修改对应 spec。

---

*Generated from `lua/mappings.lua`, `lua/gale/*.lua`, `lua/plugins/{spec,override,local}/*.lua`.*