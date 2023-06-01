return {
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				file_ignore_patterns = {
					"node_modules/.*",
					".git/.*",
					".idea/.*",
					".vscode/.*",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		},
	},
	{
		"edolphin-ydf/goimpl.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim" } },
		config = function()
			require("telescope").load_extension("goimpl")
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		requires = { "kkharji/sqlite.lua" },
	},
	{
		"nvim-telescope/telescope-media-files.nvim",
		event = "VeryLazy",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					media_files = {
						-- filetypes whitelist
						-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
						filetypes = { "png", "webp", "jpg", "jpeg" },
						-- find command (defaults to `fd`)
						find_cmd = "rg",
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		event = "VeryLazy",
		config = function()
			require('telescope').load_extension('dap');
			local wk = require("which-key");

			local opts = {
				mode = "n", -- NORMAL mode
				prefix = "<leader>dt",
				buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
				silent = true, -- use `silent` when creating keymaps
				noremap = true, -- use `noremap` when creating keymaps
				nowait = true, -- use `nowait` when creating keymaps
			}
			local mappings = {
				c = { "<cmd>Telescope dap commands<cr>", "Commands" },
				s = { "<cmd>Telescope dap configurations<cr>", "Configurations" },
				l = { "<cmd>Telescope dap list_breakpoints<cr>", "List Breakpoints" },
				v = { "<cmd>Telescope dap variables<cr>", "Variables" },
				f = { "<cmd>Telescope dap frames<cr>", "Frames" },
			}
			wk.register(mappings, opts)
		end
	}
}
