return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<C-p>', function()
            builtin.oldfiles({ only_cwd = true })
        end, { desc = 'Telescope old files' })
        vim.keymap.set('n', '<leader>ff', builtin.live_grep, { desc = 'Telescope live grep' })

        vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = 'Telescope go to [d]efinition' })
        vim.keymap.set("n", "gr", builtin.lsp_references, { desc = 'Telescope go to [r]eferences' })
        vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = 'Telescope go to [i]mplementations' })

        vim.keymap.set('n', '<leader>q', function()
            builtin.diagnostics({ bufnr = 0 })
        end, { desc = 'Telescope show diagnostics' })
    end,
}
