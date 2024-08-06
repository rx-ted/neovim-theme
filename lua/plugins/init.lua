if vim.fn.has("nvim-0.9.0") == 0 then
    vim.api.nvim_echo({{"LazyVim requires Neovim >= 0.9.0\n", "ErrorMsg"}, {"Press any key to exit", "MoreMsg"}}, true,
        {})
    vim.fn.getchar()
    vim.cmd([[quit]])
    return {}
end



require("config.utils").init()


-- return {{
--     "folke/lazy.nvim",
--     version = "*"
-- } -- { "LazyVim/LazyVim", priority = 10000, lazy = false, opts = {}, cond = true, version = "*" },
-- }