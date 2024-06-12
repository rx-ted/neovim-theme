local _, barbecue = pcall(require, "barbecue")
if not _ then
  print("Not found barbecue module!")
  return
end

vim.opt.updatetime = 200

barbecue.setup({
  create_autocmd = true,
})

vim.api.nvim_create_autocmd({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",
  "BufModifiedSet",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})
require("barbecue.ui").toggle(true)
