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
                        }
                    },
                },
                lualine_x = { 'diagnostics' },
                lualine_y = { 'encoding', 'fileformat', },
                lualine_z = { 'progress', 'location' }
            },
        }
    end
}
