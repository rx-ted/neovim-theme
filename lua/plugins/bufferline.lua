vim.opt.termguicolors = true
local _, bufferline = pcall(require, "bufferline")
if not _ then
  vim.notify("Not found bufferline module!")
  return
end

bufferline.setup {
  options = {
    -- mode = "buffers", -- set to "tabs" to only show tabpages instead
    indicator = {
      style = "icon",
      icon = " ",
    },
    close_command = "bdelete %d",
    right_mouse_command = "bdelete! %d",
    buffer_close_icon = '󰅖',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    -- diagnostics = "nvim_lsp",
    -- diagnostics_indicator = function(count, level)
    --   local icon = level:match("error") and " " or ""
    --   return icon .. ' ' .. count
    -- end,
    show_close_icon = false,
    show_tab_indicators = true,

    offsets = {
      {
        filetype = "NeoTree",
        text = "EXPLORER",
        text_align = "center",
        separator = true,
      }
    },

    sort_by = 'insert_after_current',
  },
  highlights = {
    fill = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "StatusLineNC" },
    },
    background = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    buffer_visible = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    buffer_selected = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    separator = {
      fg = { attribute = "bg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    separator_selected = {
      fg = { attribute = "fg", highlight = "Special" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    separator_visible = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "StatusLineNC" },
    },
    close_button = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "StatusLine" },
    },
    close_button_selected = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    close_button_visible = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
  },
}
