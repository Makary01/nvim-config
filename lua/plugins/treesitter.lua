return { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local filetypes = {
            'bash',
            'c',
            'diff',
            'html',
            'lua',
            'luadoc',
            'markdown',
            'markdown_inline',
            'query',
            'vim',
            'vimdoc',
            'go',
            'apex',
            'sflog',
            'soql',
            'sosl',
        }
        require('nvim-treesitter').install(filetypes)
        vim.api.nvim_create_autocmd('FileType', {
            pattern = filetypes,
            callback = function() vim.treesitter.start() end,
        })
    end,
}
