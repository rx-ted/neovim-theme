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

dapui.setup({
})
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
  debug = true,
  dapui_rtt = true,

})


require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp' } })


vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
