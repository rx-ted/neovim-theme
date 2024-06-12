local _, lualine = pcall(require, "lualine")
if not _ then
  vim.notify("Not found nvim-lualine module!", error)
  return
end

local icons = require("base.icons")

local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local branch = {
  'branch',
  icon = icons.git.Branch,
  color = { fg = colors.violet, gui = 'bold' },
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd [[Neogit]]
      end
    end
  end,
}

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = icons.diagnostics,
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

local diff = {
  'diff',
  symbols = {
    added = icons.git.Add,
    modified = icons.git.Mod,
    removed = icons.git.Remove,
    renamed = icons.git.Rename,
  },

  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
}

local cdate = {
  'cdate',
  cond = function()
    return vim.fn.winwidth(0) > 80
  end,
}
local ctime = {
  'ctime',
  cond = function()
    return vim.fn.winwidth(0) > 80
  end,
}

local filesize = {
  'filesize',
}

local filename = {
  'filename',
  color = { fg = colors.magenta, gui = 'bold' },
}


local fileencoding = {
  'o:encoding',       -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  color = { fg = colors.green, gui = 'bold' },
}

local fileformat = {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = 'bold' },
}

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local filetype = {
  'filetype',
  color = {
    fg = colors.green,
    gui = bold
  }
}


local config = {
  options = {
    component_separators = '',
    section_separators = '',
    theme = 'vscode',
    -- theme = 'auto',

  },

  -- +-------------------------------------------------+
  -- | A | B | C                             X | Y | Z |
  -- +-------------------------------------------------+
  sections = {
    -- these are to remove the defaults
    lualine_a = { 'mode', },
    lualine_b = { filename, fileencoding, fileformat, filesize },
    lualine_c = { branch, diff, diagnostics },
    lualine_x = {},
    lualine_y = { search_result },
    lualine_z = { '%l:%c', '%p%%/%L', filetype },
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = { cdate, ctime },
    lualine_c = {},
    lualine_x = {},
  },
}

lualine.setup(config)
