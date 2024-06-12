local cmd = vim.cmd
local function run_command(cmd)
  local handle = io.popen(cmd .. " 2>&1")
  local output = handle:read("*all")
  local status = handle:close()
  -- print(output,status)
  return status, output
end

local _, output = run_command("nvim --version")
if not _ then
  vim.notify("NeoVim is not installed or cannot be run.")
  return
end

-- base
require('base.keymaps')
require('base.options')
require('base.plugin')
-- theme
-- require('theme.tokyonight')
require('theme.vscode')

-- plugins
require("plugins.autopairs")
require("plugins.bufferline")
require("plugins.indent-blankline")
require("plugins.lsp")
require("plugins.lsp-signature")
require("plugins.lualine")
require("plugins.luasnip")
require("plugins.neo-tree")
require("plugins.noice")
require("plugins.nvim-cmp")
require("plugins.nvim-lspconfig")
require("plugins.nvim-treesitter")
require("plugins.todo-comments")
require("plugins.telescope")
