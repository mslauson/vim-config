return {
	{
		"m4xshen/smartcolumn.nvim",
		event = { "InsertEnter", "User AstroFile" },
		opts = {},
	},
	{
		"tpope/vim-abolish",
		event = { "InsertEnter", "User AstroFile" },
	},
	{
		"svermeulen/vim-cutlass",
		enabled = false,
		event = "VeryLazy",
	},
	{
		"alexghergh/nvim-tmux-navigation",
		lazy = false,
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true, -- defaults to false
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
					last_active = "<C-\\>",
					next = "<C-Space>",
				},
			})
		end,
	},
}
