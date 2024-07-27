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
require("plugins.barbar")
require("plugins.gitsigns")
require("plugins.indent-blankline")
require("plugins.lsp")
-- require("plugins.lspsaga")
require("plugins.luasnip")
-- require("plugins.neo-tree")
require("plugins.noice")
require("plugins.nougat")
require("plugins.nvim-cmp")
require("plugins.nvim-dap")
require("plugins.nvim-lspconfig")
require("plugins.nvim-tree")
require("plugins.nvim-treesitter")
require("plugins.telescope")
require("plugins.todo-comments")
