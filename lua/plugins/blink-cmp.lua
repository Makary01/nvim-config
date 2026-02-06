return {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
            'rafamadriz/friendly-snippets',
            config = function()
                require('luasnip.loaders.from_vscode').lazy_load()
            end,
        },
    },
    opts = {
        keymap = {
            preset = 'default',
        },

        appearance = {
            nerd_font_variant = 'normal',
        },

        completion = {
            -- By default, you may press `<c-space>` to show the documentation.
            -- Optionally, set `auto_show = true` to show the documentation after a delay.
            documentation = { auto_show = true, auto_show_delay_ms = 800 },

            menu = {
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label",      "label_description", gap = 1 },
                        { "source_name" },
                    }
                }
            }
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        snippets = { preset = 'luasnip' },

        -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
        -- which automatically downloads a prebuilt binary when enabled.
        --
        -- By default, we use the Lua implementation instead, but you may enable
        -- the rust implementation via `'prefer_rust_with_warning'`
        --
        -- See :h blink-cmp-config-fuzzy for more information
        fuzzy = { implementation = 'lua' },

        signature = { enabled = true },
    },
}
