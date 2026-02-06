-- relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 space indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.o.splitright = true

-- diagnostics at the end of line
vim.diagnostic.config {
    virtual_text = true,
}
