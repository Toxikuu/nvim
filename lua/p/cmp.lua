return {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        -- for snippets:
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
        local cmp = require("cmp")
        local defaults = require("cmp.config.default")()
        local auto_select = true

        return {
            completion = {
                completeopt = "menu,menuone" .. (auto_select and "" or ",noselect"),
            },
            preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = auto_select }),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
                ["<C-CR>"] = function(fallback)
                    cmp.abort()
                    fallback()
                end,
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
            }),
            sorting = defaults.sorting,
        }
    end,
}
