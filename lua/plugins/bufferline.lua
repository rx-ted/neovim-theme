vim.opt.termguicolors = true


local _, bufferline = pcall(require, "bufferline")
if not _ then
  vim.notify("Not found bufferline module!")
  return
end



bufferline.setup {
  options = {
    mode = "buffers",                               -- set to "tabs" to only show tabpages instead
    style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
    themable = true,                                -- allows highlight groups to be overriden i.e. sets highlights as default
    numbers = "none",
    -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon'
      -- 'icon' | 'underline' | 'none',
    },
    buffer_close_icon = '󰅖',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true,  -- whether or not tab names should be truncated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or ""
      -- return " " .. icon .. count
      return icon .. ' ' .. count
    end,

    offsets = {
      {
        filetype = "NeoTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
    color_icons = true, -- whether or not to add the filetype icon highlights
    get_element_icon = function(element)
      local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
      return icon, hl
      -- or
      -- local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
      -- return custom_map[element.filetype]
    end,
    show_buffer_icons = true,  -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    show_duplicate_prefix = true,    -- whether to show duplicate buffer prefix
    duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
    persist_buffer_sort = true,      -- whether or not custom sorted buffers should persist
    move_wraps_at_ends = false,      -- whether or not the move command "wraps" at the first or last position
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "slant",       -- | "slope" | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    auto_toggle_bufferline = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' }
    },
    sort_by = 'insert_after_current',
    --   |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(
    --     buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  }
}
