local _, navigator = pcall(require, "Navigator")
if not _ then
    vim.notify("Not found Navigator module!")
    return
end

navigator.setup()
