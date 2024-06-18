local _, lspsaga = pcall(require, "lspsaga")
if not _ then
  vim.notify("Not found lspsaga module!")
  return
end


-- float terminal
vim.keymap.set({ 'n', 't' }, '<C-t>', '<CMD>Lspsaga term_toggle<CR>')
vim.keymap.set({ 'n' }, 'K', '<CMD>Lspsaga hover_doc<CR>')


-- loop or previous error loading module 'lspsaga.symbol.winbar'
-- stack traceback:
