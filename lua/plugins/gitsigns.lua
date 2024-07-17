local icons = require("base.icons")

require('gitsigns').setup {
  signs                        = {
    add       = { text = icons.git.Add },
    change    = { text = icons.git.Mod },
    delete    = { text = icons.git.Remove },
    topdelete = { text = icons.git.Diff },
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  preview_config               = {

    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  signcolumn                   = true,
  numhl                        = false,
  linehl                       = false,
  word_diff                    = false,
  watch_gitdir                 = {
    follow_files = true
  },
  auto_attach                  = true,
  attach_to_untracked          = false,
  current_line_blame           = false,
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil,
  max_file_length              = 40000,
}
