local status, nvim_tree  = pcall(require,"nvim-tree")
if not status then
  vim.notify("Not found nvim-tree module.")
  return
end


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  -- show git status 
  git = {
    enable = true,
  },
  view = {
    width = 30,
    side="left",
    signcolumn = "yes",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false, -- hidden dotfiles 
    custom = {
      'node_modeules',
      '.git',

    }
  },
})


