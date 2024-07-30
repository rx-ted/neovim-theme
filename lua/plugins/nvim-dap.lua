local _, dap = pcall(require, "dap")
if not _ then
  vim.notify("Not found nvim-dap module!")
  return
end
local _, dapui = pcall(require, "dapui")
if not _ then
  vim.notify("Not found nvim-dapui module!")
  return
end

local _, dap_cortex_debug = pcall(require, 'dap-cortex-debug')
if not _ then
  vim.notify("Not found dap-cortex-debug module!")
  return
end


local _,neodev =  pcall(require,"neodev")
if not _ then
  vim.notify("Not found neodev module!")
  return
end


neodev.setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})




dapui.setup(
{

}
)


vim.keymap.set({'n'}, '<leader>0', ':lua require("dapui").toggle()<CR>')


-- automatically open debugger
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

vim.fn.sign_define(
  'DapBreakpoint',
  {
    text = ' ',
    texthl = 'DapBreakpoint',
    linehl = '',
    numhl = ''
  })
vim.fn.sign_define(
  'DapBreakpointCondition',

  {
    text = ' ',
    texthl = 'DapBreakpointCondition',
    linehl = '',
    numhl = ''
  })
vim.fn.sign_define(
  'DapLogPoint',
  {
    text = ' ',
    texthl = 'DapLogPoint',
    linehl = '',
    numhl = ''
  }
)


dap_cortex_debug.setup({

})


require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp' } })


vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<S-F5>', function() require('dap').close() end)

-- keymap is used to other platform or APP.
-- vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
-- vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
-- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)

vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
