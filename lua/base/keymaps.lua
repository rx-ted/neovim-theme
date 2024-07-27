vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
-- keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- close window
keymap.set("n", "<leader>so", "<C-w>o") -- close other windows

-- exit
keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<leader>qq", ":q!<CR>")
keymap.set("n", "<leader>w", ":w<CR>")

-- switch spaces
-- keymap.set("n", "<C-w>", "<C-w><C-w>")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer


-- switch buffer
keymap.set("n", "<leader><Tab>", ":bnext<CR>")
keymap.set("n", "<leader><leader><Tab>", ":bprevious<CR>")

-- lspsaga config
keymap.set({'n','t'},'<A-d>', '<Cmd>Lspsaga term_toggle<CR>')
keymap.set('n','<A-u>', '<Cmd>Lspsaga outline<CR>')
keymap.set('n','<A-k>', '<Cmd>Lspsaga hover_doc<CR>')
keymap.set("n", "<A-e>", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)



