-- scrollbar for Neovim
return {
  "dstein64/nvim-scrollview",
  event = "BufReadPre",
  opts = {
    excluded_filetypes = { "alpha", "dashboard", "neo-tree" },
    current_only = true,
    winblend = 75,
  },
}
