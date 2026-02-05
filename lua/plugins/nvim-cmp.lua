return { 
	'hrsh7th/nvim-cmp',
	dependencies = {
		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
	},
	config = function()
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
				border = 'double',
			}),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				['<C-p>'] = cmp.mapping.select_prev_item(),
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				['<C-e>'] = cmp.mapping.abort(),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
			}, {
				{ name = 'buffer' },
			})
		})

		-- Set up lspconfig.
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		vim.lsp.config('lspconfig', { capabilities = capabilities })
		vim.lsp.enable('lspconfig')	
	end,
}
