local cmp = require "cmp"
local luasnip = require "luasnip"

-- Set up LuaSnip (snippets)
luasnip.config.setup {}

-- Set up nvim-cmp
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- Expanding snippets
        end,
    },
    completion = {
        completeopt = "menu,menuone,noinsert", -- Settings for completion behavior
    },
    mapping = cmp.mapping.preset.insert {
        ["<C-n>"] = cmp.mapping.select_next_item(), -- Select next item
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- Select previous item
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll docs backward
        ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll docs forward
        ["<C-y>"] = cmp.mapping.confirm { select = true }, -- Confirm selection

        -- More advanced snippet navigation with LuaSnip
        ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { "i", "s" }),

        -- Trigger completion manually
        ["<C-Space>"] = cmp.mapping.complete {},
    },
    sources = {
        { name = "lazydev", group_index = 0 }, -- LazyDev completion
        { name = "nvim_lsp" }, -- LSP completions
        { name = "luasnip" }, -- LuaSnip completions
        { name = "path" }, -- Path completions
    },
}
