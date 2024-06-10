local _, nofity = pcall(require, "notify")

if not _ then
    vim.notify("Not found nvim-notify module", error)
    return
end


vim.notify = nofity

vim.notify("Hello")

vim.notify.setup {
    background_colour = "#000000",
    -- [default, minimal, simple, compact, wrapped-compact ]
    render = 'minimal',

    minimum_width = 20,
    max_width = 50,
    timeout = 3000,
}

local old_notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end
    if msg:match("clipboard: error: Error: target STRING not available") then
        return
    end

    old_notify(msg, ...)
end
