---@type NvPluginSpec
return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  cmd = {
    "CodeCompanion",
    "CodeCompanionChat",
    "CodeCompanionActions",
    "CodeCompanionCLI",
    "CodeCompanionCmd",
    "CodeCompanionCodeReview",
  },
  keys = {
    {
      "<leader>aa",
      "<Cmd>CodeCompanionActions<CR>",
      desc = "CodeCompanion Actions",
    },
    {
      "<leader>ac",
      "<Cmd>CodeCompanionChat Toggle<CR>",
      desc = "CodeCompanion Chat",
    },
    {
      "<leader>an",
      "<Cmd>CodeCompanionChat<CR>",
      desc = "CodeCompanion New Chat",
    },
    {
      "<leader>ai",
      "<Cmd>CodeCompanion<CR>",
      desc = "CodeCompanion Inline",
    },
    {
      "ga",
      "<Cmd>CodeCompanionChat Add<CR>",
      desc = "CodeCompanion Add to Chat",
      mode = "v",
    },
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)
  end,
  opts = {
    opts = {
      language = "English",
      log_level = "ERROR",
    },
    adapters = {
      acp = {
        opts = {
          show_presets = true,
        },
      },
    },
    interactions = {
      chat = {
        adapter = "opencode",
        keymaps = {
          send = {
            modes = { n = "<C-s>", i = "<C-s>" },
          },
          close = {
            modes = { n = "<C-c>", i = "<C-c>" },
          },
        },
      },
    },
    display = {
      chat = {
        auto_scroll = true,
        show_token_count = true,
        start_in_insert_mode = true,
      },
      diff = {
        enabled = true,
        word_highlights = {
          additions = true,
          deletions = true,
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
