local _, lspsaga = pcall(require, "lspsaga")
if not _ then
  vim.notify("Not found lspsaga module!")
  return
end


vim.keymap.set({ 'n', 't' }, '<C-t>', '<CMD>Lspsaga term_toggle<CR>')
vim.keymap.set({ 'n' }, 'K', '<CMD>Lspsaga hover_doc<CR>')
