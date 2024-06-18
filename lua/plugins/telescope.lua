local _, telescope = pcall(require, "telescope")
if not _ then
  vim.notify("Not found telescope module!")
  return
end

telescope.load_extension("yank_history")

local builtin = require('telescope.builtin')

telescope.setup {
  defaults = {
    initial_mode = 'normal',
  },
  mappings = {
    n = {
      ["<esc>"] = require('telescope.actions').close,
    },
  },
}

-- 查找文件
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files initial_mode=insert<CR>")
-- 查找文件（仅包含 CMake 目标所直接包含的源和头文件）
-- vim.keymap.set("n", "<leader>ffc", "<cmd>Telescope cmake_tools sources initial_mode=insert<CR>")
-- 查找文件（仅包含 CMakeLists.txt 和 *.cmake 类文件）
-- vim.keymap.set("n", "<leader>O", "<cmd>Telescope cmake_tools cmake_files initial_mode=insert<CR>")
-- 查找 git 仓库中的文件
-- vim.keymap.set("n", "<leader>i", "<cmd>Telescope git_files initial_mode=insert<CR>")
-- 查找最近打开过的文件
vim.keymap.set("n", "<leader>o", "<cmd>Telescope oldfiles initial_mode=insert<CR>")
-- 查找 git status 中的文件
vim.keymap.set("n", "<leader>p", "<cmd>Telescope git_status initial_mode=insert<CR>")
-- 查找当前项目文件中的文字
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope live_grep initial_mode=insert<CR>")
-- 模糊查找当前文件中的文字
vim.keymap.set("n", "<leader><leader>fc", "<cmd>Telescope current_buffer_fuzzy_find initial_mode=insert<CR>")
-- 查找所有已打开文件
vim.keymap.set("n", "<leader>h", "<cmd>Telescope buffers<CR>")
-- 查找 vim 的跳转记录
vim.keymap.set("n", "<leader>j", "<cmd>Telescope jumplist initial_mode=insert<CR>")
-- 查找 vim 的标记
vim.keymap.set("n", "<leader>m", "<cmd>Telescope marks initial_mode=insert<CR>")
-- 查找 / 的搜索记录
vim.keymap.set("n", "<leader>/", "<cmd>Telescope search_history initial_mode=insert<CR>")
-- 查找 vim 命令历史记录
vim.keymap.set("n", "<leader>:", "<cmd>Telescope command_history initial_mode=insert<CR>")
-- 查找所有 vim 命令
vim.keymap.set("n", "<leader>;", "<cmd>Telescope commands initial_mode=insert<CR>")
-- 查找帮助文档
vim.keymap.set("n", "<leader>?", "<cmd>Telescope help_tags initial_mode=insert<CR>")
if pcall(require, "todo-comments") then
  -- 查找 todo 等事项
  vim.keymap.set("n", "<leader>t", "<cmd>TodoTelescope initial_mode=insert<CR>")
end
-- 查找本文件中所有文本对象
vim.keymap.set("n", "<leader>cd", "<cmd>Telescope treesitter initial_mode=insert<CR>")
-- 查找 git 仓库的 commit 历史
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>")
-- 查找 git 仓库的所有分支
-- vim.keymap.set("n", "<leader>gC", "<cmd>Telescope git_branches<CR>")
-- 查找本文件中所有静态分析报错
vim.keymap.set("n", "<leader>na", "<cmd>Telescope diagnostics<CR>")
-- 查找本文件中所有动态编译报错
vim.keymap.set("n", "<leader>nq", "<cmd>Telescope quickfix<CR>")
-- 查看所有 Vim 通知
vim.keymap.set("n", "<leader>n", "<cmd>Telescope notify<CR>")

-- 查找符号定义（LSP）
vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>")
-- 查找类型定义（LSP）
vim.keymap.set("n", "<leader>gg", "<cmd>Telescope lsp_type_definitions<CR>")
-- 查找所有引用（LSP）
vim.keymap.set("n", "<leader>g", "<cmd>Telescope lsp_references<CR>")
-- 查找函数实现（LSP）
vim.keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>")
