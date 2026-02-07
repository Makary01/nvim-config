return {
    'stevearc/oil.nvim',
    opts = {
        confirmation = {
            border = 'double',
        },
        keymaps = {
            ["<C-p>"] = false,
            ["<M-p>"] = "actions.preview",
        },
    },
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
}
