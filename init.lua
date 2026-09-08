vim.g.mapleader = " "

-- Must be set before any python provider is probed by plugins/autoload
vim.g.python3_host_prog = "/opt/homebrew/bin/python3.10"

if vim.g.vscode then
  require "gale.vscode"
else
  require "gale.globals"
  require "bootstrap"
  require "gale.filetypes"
  require "gale.usercmds"
  require "gale.autocmds"
  require "gale.aliases"
  require "gale.clipboard"
  require "gale.vim"
  require "options"
  require "mappings"
end
