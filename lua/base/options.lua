local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

cmd [[
set mousemodel=extend
set updatetime=1000
set nu nornu ru ls=2
set et sts=0 ts=4 sw=4
set signcolumn=number
set bri wrap
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮
set cinoptions=j1,(0,ws,Ws,g0,:0,=0,l1
set cinwords=if,else,switch,case,for,while,do
set showbreak=↪
set list
set switchbuf=useopen
set exrc
set foldtext='+--'
set wrap
]]

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = true
opt.linebreak = true

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")


-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"

-- encoding
opt.encoding = "UTF-8"
opt.fileencoding = "UTF-8"

-- Colors are applied automatically based on user-defined highlight groups.
-- There is no default value.
cmd.highlight('IndentLine guifg=#123456')
-- Current indent line highlight
cmd.highlight('IndentLineCurrent guifg=#123456')

-- diable support node.js
-- g.loaded_node_provicer = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.node_host_prog = '~/app/node/node20/bin/neovim-node-host'
-- g.python3_host_prog = '/bin/python3'

vim.paste = (function(lines, phase)
  vim.api.nvim_put(lines, 'c', true, true)
end)
cmd [[
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': {lines, regtype -> extend(g:, {'foo': [lines, regtype]}) },
      \      '*': {lines, regtype -> extend(g:, {'foo': [lines, regtype]}) },
      \    },
      \   'paste': {
      \      '+': {-> get(g:, 'foo', [])},
      \      '*': {-> get(g:, 'foo', [])},
      \   },
      \ }
]]
