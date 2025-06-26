return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = vim.fn.has("nvim-0.10"),
    },
  },
}
