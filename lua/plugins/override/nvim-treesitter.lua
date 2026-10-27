---@type NvPluginSpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {},
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup {
        install_dir = vim.fn.stdpath("data") .. "/site",
      }

      local parsers = {
        "astro",
        "bash",
        "c",
        "css",
        "gleam",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "html",
        "http",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "rust",
        "scheme",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "zig",
      }

      require("nvim-treesitter").install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      pcall(require("gale.treesitter_compat").setup)
    end,
  },
  { -- Sticky scroll
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },
}
