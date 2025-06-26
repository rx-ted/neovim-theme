local server_languages = {
  -- "clangd",
  -- "html-lsp",
  -- "json-lsp",
  "lua-language-server",
  -- "marksman",
  -- "pyright",
  "black",
  "vue-language-server",
  "yaml-language-server",
}

return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, server_languages)
    opts.ui = {
      icons = {
        package_installed = "✓",
        package_pending = "",
        package_uninstalled = "✗",
      },
    }
  end,
}
