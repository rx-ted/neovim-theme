local g = vim.g
-- 1.自动对齐
g.neoformat_basic_format_align = 1
-- - 2.自动删除行尾空格
g.neoformat_basic_format_trim = 1
-- 3.将制表符替换为空格
g.neoformat_basic_format_retab = 1
-- 只提示错误消息
g.neoformat_only_msg_on_error = 1

vim.cmd [[
augroup fmt
  autocmd!
  autocmd BufWritePre * if index(['c', 'cpp'], &filetype) != -1 && filereadable(".clang-format") | undojoin | Neoformat | endif
augroup END
]]
