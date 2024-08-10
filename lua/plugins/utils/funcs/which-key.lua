-- which key integration
return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      { "<leader>dw", group = "widgets" },
      { "<BS>", desc = "Decrement Selection", mode = "x" },
      { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
    },
  },
}
