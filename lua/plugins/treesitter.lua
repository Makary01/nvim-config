return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'master',
    config = function()
        --require('nvim-treesitter').install{ 'lua', 'javascript', 'sflog', 'apex', 'soql', 'sosl', 'markdown', }
        require'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            ensure_installed = { 'lua', 'javascript', 'sflog', 'apex', 'soql', 'sosl', 'markdown', },
        }
    end
}
