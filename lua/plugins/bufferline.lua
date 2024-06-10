vim.opt.termguicolors = true


local _, bufferline = pcall(require, "bufferline")
if not _ then
    vim.notify("Not found bufferline module!")
    return
end


bufferline.setup {

}
