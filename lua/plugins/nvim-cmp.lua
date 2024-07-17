local _, luasnip = pcall(require, "luasnip")
if not _ then
  vim.notify("Not found luasnip module!")
  return
end

local _, lspkind = pcall(require, 'lspkind')
if not _ then
  vim.notify("Not found lspkind module!")
  return
end

local _, cmp = pcall(require, 'cmp')
if not _ then
  vim.notify("Not found cmp module!")
  return
end

local function has_words_before()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = cursor[1]
  local col = cursor[2]
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


cmp.setup({
  -- view = 'custom',
  preselect = 'none',
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
    -- completeopt = 'menu,menuone'
  },
  snippet = {
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  -- 快捷键
  mapping = {
    -- 上一个
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    -- 下一个
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    -- 出现补全
    ['<C-j>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- 取消
    ['<C-k>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),

    ['<CR>'] = cmp.mapping.confirm({
      select = false,
      behavior = cmp.ConfirmBehavior.Insert,
    }),

    ['<Space>'] = cmp.mapping.confirm({
      select = false,
      behavior = cmp.ConfirmBehavior.Insert,
    }),
    -- ['<C-Space>'] = cmp.mapping.disable,
    -- ['<CR>'] = cmp.mapping({
    --     i = cmp.mapping.abort(),
    --     c = cmp.mapping.close(),
    -- }),

    -- ['1'] = cmp.mapping(function(fallback)
    --     if cmp.visible() then
    --         cmp.mapping.confirm({
    --             select = true,
    --             behavior = cmp.ConfirmBehavior.Replace,
    --         })
    --     else
    --         fallback()
    --     end
    -- end),
    -- ['2'] = cmp.mapping(function(fallback)
    --     if cmp.visible() then
    --         cmp.select_next_item()
    --     else
    --         fallback()
    --     end
    -- end, { "i", "s" }),
    -- ['3'] = cmp.mapping(function(fallback)
    --     if cmp.visible() then
    --         cmp.select_next_item()
    --         cmp.select_next_item()
    --     else
    --         fallback()
    --     end
    -- end, { "i", "s" }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  },


  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },   -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  }),

  -- 对补全建议排序
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      require("cmp-under-comparator").under,
      -- require("cmp_tabnine.compare"), -- INFO: uncomment this for AI completion
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    }
  },
  -- 使用 lspkind-nvim 显示类型图标
  formatting = {
    format = lspkind.cmp_format {
      mode = 'symbol',
      maxwidth = 50,
      before = function(entry, vim_item)
        vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"

        if entry.source.name == "calc" then
          vim_item.kind = "Calc"
        end

        if entry.source.name == "git" then
          vim_item.kind = "Git"
        end

        if entry.source.name == "rg" then
          vim_item.kind = "Search"
        end

        if entry.source.name == "rime" then
          vim_item.kind = "Rime"
        end

        if entry.source.name == "cmp_yanky" then
          vim_item.kind = "Clipboard"
        end

        if entry.source.name == "nvim_lsp_signature_help" then
          vim_item.kind = "Call"
        end

        vim_item = require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
        return vim_item
      end,
      ellipsis_char = '...',
      symbol_map = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
        Calc = "",
        Git = "",
        Search = "",
        Rime = "",
        Clipboard = "",
        Call = "",
      },
    },
  },
})

local function lazy_load_snippets()
  require("luasnip.loaders.from_vscode").lazy_load()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = lazy_load_snippets })
