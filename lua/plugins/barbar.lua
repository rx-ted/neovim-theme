vim.g.barbar_auto_setup = false

require 'barbar'.setup {
  -- Set to any value >=0 to enable.
  auto_hide = true,
  hide = { extensions = false, inactive = false },
  icons = {
    buffer_index = true,
    button = '',
  },
  sidebar_filetypes = {
      -- Use the default values: {event = 'BufWinLeave', text = nil}
      NvimTree = true,
      -- Or, specify the text used for the offset:
      undotree = {text = 'undotree'},
      -- Or, specify the event which the sidebar executes when leaving:
      ['nvim-tree'] = {event = 'BufWipeout'},
      -- ['neo-tree'] = {event = 'BufWipeout'},
      -- Or, specify both
      Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
    }
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
