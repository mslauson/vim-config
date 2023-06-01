return {
	{
		"akinsho/org-bullets.nvim",
		config = function()
			require("org-bullets").setup({
				concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
				symbols = {
					-- list symbol
					list = "•",
					-- headlines can be a list
					headlines = { "◉", "○", "✸", "✿" },
					-- or a function that receives the defaults and returns a list
					-- headlines = function(default_list)
					-- 	table.insert(default_list, "♥")
					-- 	return default_list
					-- end,
					checkboxes = {
						half = { "", "OrgTSCheckboxHalfChecked" },
						done = { "✓", "OrgDone" },
						todo = { "˟", "OrgTODO" },
					},
				},
			})
		end,
	},
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true, -- or `opts = {}`
	},
	{ "dhruvasagar/vim-table-mode" },
	{ "michaelb/sniprun",          run = "bash ./install.sh" },
}
