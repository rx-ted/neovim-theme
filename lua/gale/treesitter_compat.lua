--[[
  Compatibility shim for nvim-treesitter (master branch) on Neovim 0.12+.

  Neovim 0.12 changed the contract of query predicates/directives: the
  `captures` table passed to a handler is now `table<integer, TSNode[]>`
  (a list of nodes per capture id) instead of `table<integer, TSNode>`.

  nvim-treesitter's `query_predicates` module (master) still treats
  `captures[id]` as a single node, so `vim.treesitter.get_node_text`
  receives a list and fails with:

    attempt to call method 'range' (a nil value)

  This is triggered while parsing injections (e.g. markdown fenced code
  blocks), which breaks treesitter highlighting and anything that relies
  on it (markview preview, treesitter-context, decoration providers).

  We re-register the affected handlers with versions that unwrap the
  capture list, keeping every other feature of the plugin intact.

  Remove this file once nvim-treesitter is migrated to its `main` branch.
]]

local M = {}

local function node_of(captures, id)
  local capture = captures[id]
  if type(capture) == "table" then
    return capture[1]
  end
  return capture
end

local opts = { force = true, all = false }

local mime_types = {
  importmap = "json",
  module = "javascript",
  ["application/ecmascript"] = "javascript",
  ["text/ecmascript"] = "javascript",
}

local lang_aliases = {
  ex = "elixir",
  pl = "perl",
  sh = "bash",
  uxn = "uxntal",
  ts = "typescript",
}

local function parser_from_info_string(alias)
  return vim.filetype.match { filename = "a." .. alias } or lang_aliases[alias] or alias
end

function M.setup()
  local query = require "vim.treesitter.query"

  query.add_directive("set-lang-from-mimetype!", function(captures, _, bufnr, pred, metadata)
    local node = node_of(captures, pred[2])
    if not node then
      return
    end

    local value = vim.treesitter.get_node_text(node, bufnr)
    local configured = mime_types[value]
    if configured then
      metadata["injection.language"] = configured
    else
      local parts = vim.split(value, "/", {})
      metadata["injection.language"] = parts[#parts]
    end
  end, opts)

  query.add_directive("set-lang-from-info-string!", function(captures, _, bufnr, pred, metadata)
    local node = node_of(captures, pred[2])
    if not node then
      return
    end

    local alias = vim.treesitter.get_node_text(node, bufnr):lower()
    metadata["injection.language"] = parser_from_info_string(alias)
  end, opts)

  query.add_directive("downcase!", function(captures, _, bufnr, pred, metadata)
    local id = pred[2]
    local node = node_of(captures, id)
    if not node then
      return
    end

    local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[id] }) or ""
    if not metadata[id] then
      metadata[id] = {}
    end
    metadata[id].text = text:lower()
  end, opts)

  query.add_predicate("nth?", function(captures, _, _, pred)
    local node = node_of(captures, pred[2])
    local n = tonumber(pred[3])
    if node and node:parent() and node:parent():named_child_count() > n then
      return node:parent():named_child(n) == node
    end

    return false
  end, opts)

  query.add_predicate("is?", function(captures, _, bufnr, pred)
    local locals = require "nvim-treesitter.locals"
    local node = node_of(captures, pred[2])
    local types = { unpack(pred, 3) }

    if not node then
      return true
    end

    local _, _, kind = locals.find_definition(node, bufnr)

    return vim.tbl_contains(types, kind)
  end, opts)

  query.add_predicate("kind-eq?", function(captures, _, _, pred)
    local node = node_of(captures, pred[2])
    local types = { unpack(pred, 3) }

    if not node then
      return true
    end

    return vim.tbl_contains(types, node:type())
  end, opts)
end

return M
