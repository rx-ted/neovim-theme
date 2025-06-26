local treesitter_languages = {
  "comment",
  "diff",
  "dockerfile",
  "dot",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "http",
  "make",
  "cpp",
  "python",
  "c",
  "typescript",
  "vue",
  "bash",
  "html",
  "javascript",
  "json",
  "jsonc",
  "lua",
  "luadoc",
  "luap",
  "markdown",
  "markdown_inline",
  "printf",
  "python",
  "query",
  "regex",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, treesitter_languages)
    end
  end,
}
