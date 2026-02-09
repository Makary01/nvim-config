return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- default config with changes
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff' },
                lualine_c = {
                    {
                        'filetype',
                        icon_only = true
                    },
                    {
                        'filename',
                        path = 1,
                        symbols = {
                            modified = '[Modified]',
                            readonly = '[Read-Only]',
                            unnamed = '[No Name]',
                            newfile = '[New]',
                        },
                        fmt = function(res)
                            -- If it starts with oil://, strip it and make it look like a real path
                            if res:match("^oil://") then
                                local path = res:gsub("oil://", "")
                                return vim.fn.fnamemodify(path, ":~")
                            end
                            return res
                        end
                    },
                },
                lualine_x = {
                    'diagnostics',
                    {
                        function()
                            return require('sf').get_target_org()
                        end,
                        -- icon = '☁️',
                        icon = '󱘖',
                        color = { fg = '#00a1e0' },
                    }
                },
                lualine_y = { 'encoding', 'fileformat', },
                lualine_z = { 'progress', 'location' }
            },
        }
    end
}
