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

        function vim.getVisualSelection()
            vim.cmd('noau normal! "vy"')
            local text = vim.fn.getreg('v')
            vim.fn.setreg('v', {})

            text = string.gsub(text, "\n", "")
            if #text > 0 then
                return text
            else
                return ''
            end
        end

        vim.keymap.set('v', '<leader>ff', function()
            local text = vim.getVisualSelection()
            builtin.live_grep({ default_text = text })
        end, { silent = true, noremap = true, desc = 'Telescope live grep (selection)' })

        vim.keymap.set('n', '<leader>fb', ':Telescope current_buffer_fuzzy_find<cr>', opts)
        vim.keymap.set('v', '<leader>fb', function()
            local text = vim.getVisualSelection()
            builtin.current_buffer_fuzzy_find({ default_text = text })
        end, { silent = true, noremap = true })

        vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = 'Telescope go to [d]efinition' })
        vim.keymap.set("n", "gr", builtin.lsp_references, { desc = 'Telescope go to [r]eferences' })
        vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = 'Telescope go to [i]mplementations' })

        vim.keymap.set("n", "<space>en", function()
            builtin.find_files {
                cwd = vim.fn.stdpath("config")
            }
        end)

        vim.keymap.set('n', '<leader>q', function()
            builtin.diagnostics({ bufnr = 0 })
        end, { desc = 'Telescope show diagnostics' })
    end,
}
