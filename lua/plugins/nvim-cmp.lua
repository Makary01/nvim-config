return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
            build = 'make install_jsregexp',
            dependencies = {
                'rafamadriz/friendly-snippets',
                config = function()
                    require('luasnip.loaders.from_vscode').lazy_load()
                end,
            },
        },
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = function()
                require('nvim-autopairs').setup({})
            end
        },
    },

    config = function()
        local cmp = require('cmp')
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local luasnip = require('luasnip')

        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = {
                ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' })
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            sources = {
                { name = 'nvim_lsp', label = 'LSP' },
                { name = 'luasnip',  label = 'Snip' },
                { name = 'buffer',   label = 'Buf' },
                { name = 'path',     label = 'Path' },
            },

            formatting = {
                fields = { 'abbr', 'menu' },
                format = function(entry, item)
                    item.menu = ({
                        nvim_lsp = '[LSP]',
                        luasnip  = '[Snip]',
                        buffer   = '[Buf]',
                        path     = '[Path]',
                    })[entry.source.name]
                    return item
                end,
            },
        })
    end,
}
