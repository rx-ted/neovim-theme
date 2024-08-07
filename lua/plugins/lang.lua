return {
  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = vim.fn.has("nvim-0.10") },
      ---@type lspconfig.options
    },
  },

  -- uncomment and add tools to ensure_installed below
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "lua-language-server", "marksman" })
      opts.ui = {
        icons = {
          package_installed = "✓",
          package_pending = "",
          package_uninstalled = "✗",
        },
      }
    end,
  },

  -- disable the fancy UI for the debugger
  { "rcarriga/nvim-dap-ui", enabled = true },

  -- which key integration
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>dw", group = "widgets" },
      },
    },
  },

  -- dap integration
  {
    "mfussenegger/nvim-dap",
    optional = true,
    keys = {
      {
        "<leader>de",
        function()
          require("dap.ui.widgets").centered_float(require("dap.ui.widgets").expression, { border = "none" })
        end,
        desc = "Eval",
        mode = { "n", "v" },
      },
      {
        "<leader>dwf",
        function()
          require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames, { border = "none" })
        end,
        desc = "Frames",
      },
      {
        "<leader>dws",
        function()
          require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes, { border = "none" })
        end,
        desc = "Scopes",
      },
      {
        "<leader>dwt",
        function()
          require("dap.ui.widgets").centered_float(require("dap.ui.widgets").threads, { border = "none" })
        end,
        desc = "Threads",
      },
    },
    opts = function(_, opts)
      require("dap").defaults.fallback.terminal_win_cmd = "enew | set filetype=dap-terminal"
    end,
  },
  -- lang  setup
  -- { import = "lazyvim.plugins.extras.lang.go" },
  -- { import = "lazyvim.plugins.extras.lang.ruby" },
  { import = "lazyvim.plugins.extras.lang.clangd" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.vue" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  { import = "lazyvim.plugins.extras.lang.toml" },
  { import = "lazyvim.plugins.extras.lang.markdown" },
  { import = "lazyvim.plugins.extras.lang.git" },
  -- { import = "lazyvim.plugins.extras.lang.cmake" },

  { import = "lazyvim.plugins.extras.vscode" },
}
