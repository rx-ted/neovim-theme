local _, ls = pcall(require, "luasnip")
if not _ then
  vim.notify("Not found luasnip module!")
  return
end



-- vim.keymap.set({ "i" }, "<A-K>", function() ls.expand() end, { silent = true })
-- vim.keymap.set({ "i", "s" }, "<A-]>", function() ls.jump(1) end, { silent = true })
-- vim.keymap.set({ "i", "s" }, "<A-[>", function() ls.jump(-1) end, { silent = true })
--
-- vim.keymap.set({ "i", "s" }, "<A-E>", function()
--   if ls.choice_active() then
--     ls.change_choice(1)
--   end
-- end, { silent = true })
