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

local _, coq = pcall(require, 'coq')
if not _ then
  vim.notify("Not found coq module!")
  return
end

local _, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not _ then
  vim.notify("Not found cmp_nvim_lsp module!")
  return
end

vim.g.coq_settings = { auto_start = 'shut-up' }
local capabilities = cmp_nvim_lsp.default_capabilities()
local servers = {
  'clangd',
  'lua_ls',
  'pyright',
  'tsserver',
  'bashls',
  'cmake',
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(
    coq.lsp_ensure_capabilities(
      {
        on_attach = lsp_format.on_attach,
        capabilities = capabilities,

      }
    )
  )
end
