return {
    'xixiaofinland/sf.nvim',

    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'ibhagwan/fzf-lua',
    },

    config = function()
        require('sf').setup({
            enable_hotkeys = true,
        }) -- Important to call setup() to initialize the plugin!
    end
}
