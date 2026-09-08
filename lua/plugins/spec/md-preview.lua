---@type NvPluginSpec
return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    require("lazy").load { plugins = { "markdown-preview.nvim" } }
    vim.fn["mkdp#util#install"]()
  end,
  init = function()
    -- Remote-friendly: listen on all interfaces (reachable via Tailscale IP).
    -- Tailscale is an encrypted private network, safe to expose this port.
    vim.g.mkdp_open_to_the_world = 1
    local env = require("gale.env").load()
    vim.g.mkdp_port = env.MARKDOWN_PREVIEW_PORT
    vim.g.mkdp_open_ip = env.REMOTE_IP
    vim.g.mkdp_echo_preview_url = 1
    -- Don't auto-open a browser (useless on a remote host);
    -- copy the preview URL to the LOCAL clipboard via OSC52 instead.
    vim.cmd [[
function! MkdpCopyUrl(url) abort
  call luaeval("require('gale.clipboard.osc52').copy(_A)", a:url)
  echomsg '  Preview URL copied to clipboard:' a:url
endfunction
]]
    vim.g.mkdp_browserfunc = "MkdpCopyUrl"
    vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })
  end,
}
