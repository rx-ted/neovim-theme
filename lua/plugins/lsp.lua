require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

local servers = {
    "html",
    "cssls",
    "tsserver",
    "clangd",
    "pyright",
    "gopls"
}
require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    -- "lua_ls",
    -- "markdown_oxide",
    -- "clangd",
    -- "cmake",
    -- "dockerls",
    -- "eslint",
    -- "html",
    -- "jsonls",
    -- "biome",
    -- "basedpyright",
    -- "volar",
    -- "yamlls",
  },
  -- automatic_installation = true,

})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

require'lspconfig'.ansiblels.setup{}


