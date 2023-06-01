return {
	i = {
		["<C-s>"] = { "<Esc>:w<CR>", desc = "Save" },
	},
	n = {
		["c"] = { '"_c', desc = "Change Without Cut" },
		["cx"] = { "c", desc = "Change With Cut" },
		["cc"] = { '"_cc', desc = "Change Without Cut" },
		["ccx"] = { "cc", desc = "Change With Cut" },
		["C"] = { '"_C', desc = "Change Without Cut" },
		["Cx"] = { "C", desc = "Change With Cut" },
		["d"] = { '"_d', desc = "Delete Without Cut" },
		["dx"] = { "d", desc = "Delete With Cut" },
		["dd"] = { '"_dd', desc = "Delete Without Cut" },
		["ddx"] = { "dd", desc = "Delete With Cut" },
		["D"] = { '"_D', desc = "Delete Without Cut" },
		["Dx"] = { "D", desc = "Delete With Cut" },
		["<Leader>P"] = { ":Telescope projects<cr>", desc = "Project Management" },
		["<Leader>v"] = { ":OverseerToggle<cr>", desc = "Overseer Toggle" },
		-- [";"] = { "close", desc = "Close Window" },
		["U"] = { "<C-r>", desc = "Redo" },
		["H"] = { ":bprevious<CR>", desc = "Go to previous buffer" },
		["L"] = { ":bnext<CR>", desc = "Go to next buffer" },
		["<Left>"] = { ":tabprevious<CR>", desc = "Go to previous tab" },
		["<Right>"] = { ":tabNext<CR>", desc = "Go to next tab" },
		["[t"] = { ":tabnext<CR>", desc = "Go to next tab" },
		["]t>"] = { ":tabnext<CR>", desc = "Go to next tab" },
		-- "Matt" commands
		["md"] = { "V:'<,'>t'><cr>", desc = "Duplicate Line" },
		["ms"] = { ":%s/", desc = "Global Substitute" },
		["mS"] = { ":%S/", desc = "Global Subvert" },
		["mc"] = { ":%s/@+/", desc = "Global Substitute Clipboard" },
		["mC"] = { ":%S/@+/", desc = "Global Subvert Clipboard" },
		["mp"] = { ":put<cr>", desc = "Paste On New Line Below" },
		["mP"] = { ":put!<cr>", desc = "Paste On New Line Above" },
		["<leader>\\"] = {
			function()
				local buffer_directory = vim.fn.expand("%:p:h")
				local cmd = "tmux split-window -v -c " .. vim.fn.shellescape(buffer_directory)
				vim.fn.system(cmd)
			end,
			desc = "New Vertical Tmux Pane At Buffer CWD",
		},
		["<leader>|"] = {
			function()
				local buffer_directory = vim.fn.expand("%:p:h")
				local cmd = "tmux split-window -h -c " .. vim.fn.shellescape(buffer_directory)
				vim.fn.system(cmd)
			end,
			desc = "New Horizontal Tmux Pane At Buffer CWD",
		},
		["<Leader>Ay"] = {
			cmd = "ggVGy",

			desc = "Yank All",
		},
		["<Leader>Ad"] = {
			cmd = "ggVGd",

			desc = "Delete All",
		},
		["<Leader>Av"] = {
			cmd = "ggVG",

			desc = "Select All",
		},
		["bc"] = {
			cmd = "VaB",
			desc = "Block Select {}",
		},
		["bp"] = {
			cmd = "Vab",
			desc = "Block Select ()",
		},
		["bs"] = {
			cmd = "Va[",
			desc = "Block Select []",
		},
		["sx"] = {
			cmd = "Va<",
			desc = "Block Select []",
		},
		--block yank

		["bcy"] = {
			cmd = "VaBVy",
			desc = "Block Yank {}",
		},
		["bpy"] = {
			cmd = "VabVy",
			desc = "Block Yank ()",
		},
		["bsy"] = {
			cmd = "Va[Vy",
			desc = "Block Yank []",
		},
		["bxy"] = {
			cmd = "Va<Vy",
			desc = "Block Yank <>",
		},
		--block cut

		["bcx"] = {
			cmd = "VaBVx",
			desc = "Block Cut {}",
		},
		["bpx"] = {
			cmd = "VabVx",
			desc = "Block Cut ()",
		},
		["bsx"] = {
			cmd = "Va[Vx",
			desc = "Block Cut []",
		},
		["bxx"] = {
			cmd = "Va<Vx",
			desc = "Block Cut <>",
		},
		--block delete

		["bcd"] = {
			cmd = "VaBVd",
			desc = "Block Delete {}",
		},
		["bpd"] = {
			cmd = "VabVd",
			desc = "Block Delete ()",
		},
		["bsd"] = {
			cmd = "Va[Vd",
			desc = "Block Delete []",
		},
		["bxd"] = {
			cmd = "Va<Vd",
			desc = "Block Delete <>",
		},
		-- neoest
		["<leader>t"] = {
			name = "Neotest",
			f = { ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Test File" },
			a = { ":lua require('neotest').run.run(vim.fn.getcwd())<cr>", "Test All" },
			n = { ":lua require('neotest').run.run()<cr>", "Debug Nearest" },
			d = {
				name = "Debug",
				f = { ":lua require('neotest').run.run({vim.fn.expand('%'), strategy='dap'})<cr>", "Test File" },
				a = { ":lua require('neotest').run.run({vim.fn.getcwd(), strategy='dap'})<cr>", "Test File" },
				n = { ":lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
				g = { ":lua require('dap-go').debug_test()<CR>", desc = "Debug Test" },
			},
			o = { ":lua require('neotest').output_panel.toggle()<cr>", "Output Panel" },
			s = { ":lua require('neotest').summary.toggle()<cr>", "Summary Panel" },
		},
		["<leader>td"] = { ":lua require('dap-go').debug_test()<CR>", desc = "Debug Test" },
		-- auto open dash when no files
		["<leader>c"] = {
			function()
				local bufs = vim.fn.getbufinfo({ buflisted = true })
				require("astronvim.utils.buffer").close(0)
				if require("astronvim.utils").is_available("alpha-nvim") and not bufs[2] then
					require("alpha").start(true)
				end
			end,
			desc = "Close buffer",
		},
		-- overseer
		["<leader>r"] = {
			name = "Overseer",
			r = { ":OverseerRun<CR>", "Run" },
			t = { ":OverseerTaskAction<CR>", "Task Action" },
			a = { ":OverseerQuickAction<CR>", "Quick Action" },
			c = { ":OverseerRunCmd<CR>", "Run Command" },
			i = { ":OverseerInfo<CR>", "Info" },
			b = {
				name = "Bundle",
				s = { ":OverseerSaveBundle<CR>", "Save Bundle" },
				d = { ":OverseerDeleteBundle<CR>", "Delete Bundle" },
				l = { ":OverseerLoadBundle<CR>", "Load Bundle" },
			},
		},
		["<leader>N"] = {
			name = "Notes",
			i = { ":Neorg index<cr>", "Index" },
			j = { ":Neorg journal<cr>", "Journal" },
		},
		["<leader>l"] = {
			i = {
				name = "Implement",
				g = {
					"<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>",
					desc = "Go Implement Interface",
				},
			},
			m = {
				":LspRestart<cr>",
				desc = "Go Implement Interface",
			},
		},
		["<leader>fl"] = {
			name = "Flutter",
			o = { ":FlutterOutlineToggle<cr>", "Flutter Outline Toggle" },
			c = { ":Telescope flutter commands<cr>", "Flutter Commands" },
			d = { ":FlutterDevices<cr>", "Flutter Devices" },
			e = { ":FlutterEmulators<cr>", "Flutter Emulators" },
			q = { ":FlutterQuit<cr>", "Flutter Quit" },
			g = { ":FlutterPubGet<cr>", "Flutter Pub Get" },
			u = { ":FlutterPubUpgrade<cr>", "Flutter Pub Upgrade" },
			r = { ":FlutterRun<cr>", "Flutter Run" },
			l = { ":FlutterReload<cr>", "Flutter Reload" },
		},
	},
	v = {
		["p"] = { '"_dP', desc = "Better Paste" },
		["d"] = { '"_d', desc = "Delete Without Cut" },
		["dx"] = { "d", desc = "Delete Without Cut" },
		["c"] = { '"_c', desc = "Change Without Cut" },
		["cx"] = { "c", desc = "Change Without Cut" },
		["md"] = { ":'<,'>t'><cr>", desc = "Duplicate Selection" },
		["ms"] = { ":s/", desc = "Selection Substitute" },
		["mS"] = { ":S/", desc = "Selection Subvert" },
		["mc"] = { ":%s/@+/", desc = "Global Substitute Clipboard" },
		["mC"] = { ":%S/@+/", desc = "Global Subvert Clipboard" },
	},
}
