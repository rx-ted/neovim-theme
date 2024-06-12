local _, lspconfig = pcall(require, "lspconfig")
if not _ then
  vim.notify("Not found nvim-lspconfig module!")
  return
end

local _, lsp_format = pcall(require, "lsp-format")
if not _ then
  vim.notify("Not found lsp-format modlue")
  return
end


lspconfig.clangd.setup {
  on_attach = lsp_format.on_attach,
}

lspconfig.pyright.setup {
  on_attach = lsp_format.on_attach
}


lspconfig.lua_ls.setup {
  on_attach = lsp_format.on_attach
}
lspconfig.cmake.setup {
  on_attach = lsp_format.on_attach
}
-- lspconfig.tsserver.setup{}
-- lspconfig.clangd.setup{}
lspconfig.bashls.setup {
  on_attach = lsp_format.on_attach
}
