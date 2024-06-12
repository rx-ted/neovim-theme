local _, nvim_treesitter = pcall(require, 'nvim-treesitter')
if not _ then
  vim.notify("Not found nvim-treesitter module!")
  return
end
nvim_treesitter.setup({})

require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "cpp",
    "cmake",
    "lua",
    "python",
    "html",
    "javascript",
    "css",
    "json",
    "bash",
    "regex",
    "markdown",
    "diff",
    "glsl",
    "vimdoc" },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '+',
      node_incremental = '+',
      node_decremental = '-',
      -- scope_incremental = '+',
    }
  },
}
