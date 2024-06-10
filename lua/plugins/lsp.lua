local _, mason = pcall(require, "mason")
if not _ then
  vim.notify("Not found mason modlue")
  return
end

local _, mason_config = pcall(require, "mason-lspconfig")
if not _ then
  vim.notify("Not found mason-lspconfig modlue")
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})


mason_config.setup({
  automatic_installation = true,

  ensure_installed = {
    "lua_ls",
    "markdown_oxide",
    "clangd",
    "cmake",
    -- "dockerls",
    -- "eslint",
    -- "html",
    "jsonls",
    "biome",
    "pyright",
    -- "gopls",
    -- "volar",
    "yamlls",

  },

})
