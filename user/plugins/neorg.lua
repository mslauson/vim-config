return {
	{
		"nvim-neorg/neorg",
		enabled = true,
		event = "VeryLazy",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.integrations.treesitter"] = {
						config = {
							configure_parsers = true,
							install_parsers = true,
						},
					},
					["core.completion"] = { config = { engine = "nvim-cmp" } },
					["core.integrations.telescope"] = {},
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/notes/personal",
								secretTime = "~/notes/secretTime",
								work = "~/notes/work",
							},
							default_workspace = "work",
						},
					},
				},
			})

			local neorg_callbacks = require("neorg.callbacks")

			neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
				-- Map all the below keybinds only when the "norg" mode is active
				keybinds.map_event_to_mode("norg", {
					n = { -- Bind keys in normal mode
						{ "<C-l>", "core.integrations.telescope.find_linkable" },
					},
					i = { -- Bind in insert mode
						{ "<C-l>", "core.integrations.telescope.insert_link" },
					},
				}, {
					silent = true,
					noremap = true,
				})
			end)
		end,
		run = ":Neorg sync-parsers",
		dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
	},
}
