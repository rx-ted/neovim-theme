return {
  "Mofiqul/vscode.nvim",
  event = "VimEnter",
  config = function(_, opts)
    require("vscode").setup(opts)
    local colorscheme = "vscode"
    vim.cmd("colorscheme " .. colorscheme)
  end,
  keys = {
    {
      "<leader>ub",
      function()
        if vim.o.background == "light" then
          vim.o.background = "dark"
        else
          vim.o.background = "light"
        end
        print("The current background: " .. vim.o.background)
        vim.cmd([[lua require("vscode").load()]])
      end,
      desc = "Toggle Background",
    },
  },
}
