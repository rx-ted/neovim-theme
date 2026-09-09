vim.cmd [[
  function! LspHealthCheck(...)
    LspInfo
  endfunction
]]

vim.cmd [[
  function! RunNeogit(...)
    lua require("neogit").open()
  endfunction
]]

vim.cmd [[
  function! RunHarpoon(...)
    lua require("gale.utils").harpoon_menu()
  endfunction
]]

vim.cmd [[
  function! OilDirCWD(...)
    Oil ./
  endfunction
]]
