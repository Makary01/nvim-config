return {
    "neovim/nvim-lspconfig",
    dependencies = {
        'mason-org/mason.nvim',
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        vim.lsp.config('lua_ls', {
            capabilities = capabilities,

            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath('config')
                        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                    then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most
                        -- likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                        -- Tell the language server how to find Lua modules same way as Neovim
                        -- (see `:h lua-module-load`)
                        path = {
                            'lua/?.lua',
                            'lua/?/init.lua',
                        },
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            -- Depending on the usage, you might want to add additional paths
                            -- here.
                            -- '${3rd}/luv/library',
                            -- '${3rd}/busted/library',
                        },
                        -- Or pull in all of 'runtimepath'.
                        -- NOTE: this is a lot slower and will cause issues when working on
                        -- your own configuration.
                        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                        -- library = vim.api.nvim_get_runtime_file('', true),
                    },
                })
            end,
        })
        vim.lsp.enable('lua_ls')

        vim.lsp.enable('gopls', {
            capabilities = capabilities
        })

        vim.lsp.enable('ts_ls', {
            capabilities = capabilities,
        })

        vim.lsp.config("eslint", {
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                if not base_on_attach then return end

                base_on_attach(client, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "LspEslintFixAll",
                })
            end,
        })

        vim.lsp.config('html', {
            capabilities = capabilities,
        })

        vim.lsp.config('apex_ls', {
            capabilities = capabilities,
            apex_jar_path = vim.fn.stdpath('data') .. '/mason/share/apex-language-server/apex-jorje-lsp.jar',
        })

        vim.filetype.add({
            pattern = {
                ['.*/*.cls'] = 'apex',
            },
        })
        vim.lsp.enable('apex_ls')

        -- Filter function to strip invalid diagnostics
        local function filter_lwc_diagnostics(err, result, ctx, config)
            if result and result.diagnostics then
                local valid_diagnostics = {}
                for _, d in ipairs(result.diagnostics) do
                    if d.range 
                        and d.range.start and d.range.start.line 
                        and d.range['end'] and d.range['end'].line then
                        table.insert(valid_diagnostics, d)
                    else
                        -- print to :messages so you know it's happening
                        vim.notify("Ignored malformed LWC diagnostic", vim.log.levels.WARN)
                    end
                end
                result.diagnostics = valid_diagnostics
            end

            -- Call the default Neovim handler with the sanitized data
            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
        end

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/lwc-language-server"

        vim.lsp.config('lwc_ls', {
            capabilities = capabilities,
            cmd = { mason_bin, '--stdio' },
            filetypes = { 'html', 'javascript' },
            init_options = { embeddedLanguages = { javascript = true } },
            handlers = {
                ["textDocument/publishDiagnostics"] = filter_lwc_diagnostics
            },
        })
        vim.lsp.enable('lwc_ls')

    end
}
