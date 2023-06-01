return {
	"AstroNvim/astrocommunity",
	event = "VeryLazy",
	-- { import = "astrocommunity.debugging.nvim-bqf" },
	-- { import = "astrocommunity.code-runner.overseer-nvim" },
	{ import = "astrocommunity.code-runner.sniprun" },
	{ import = "astrocommunity.bars-and-lines.scope-nvim" },
	-- { import = "astrocommunity.colorscheme.gruvbox" },
	-- { import = "astrocommunity.colorscheme.kanagawa" },
	-- { import = "astrocommunity.colorscheme.tokyonight" },
	-- { import = "astrocommunity.colorscheme.oxocarbon" },
	-- { import = "astrocommunity.colorscheme.nightfox" },
	-- { import = "astrocommunity.colorscheme.rose-pine" },
	-- { import = "astrocommunity.editing-support.auto-save-nvim" },
	{ import = "astrocommunity.editing-support.mini-splitjoin" },
	{ import = "astrocommunity.editing-support.dial-nvim" },
	-- { import = "astrocommunity.editing-support.refactoring-nvim" },
	{ import = "astrocommunity.editing-support.todo-comments-nvim" },
	{ import = "astrocommunity.editing-support.nvim-regexplainer" },
	{ import = "astrocommunity.editing-support.neogen" },
	{ import = "astrocommunity.editing-support.nvim-ts-rainbow" },
	{ import = "astrocommunity.editing-support.zen-mode-nvim" },
	{ import = "astrocommunity.file-explorer.oil-nvim" },
	{ import = "astrocommunity.markdown-and-latex.glow-nvim" },
	{ import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
	-- { import = "astrocommunity.media.drop-nvim" },
	-- { "drop.nvim",                                                       opts = { theme = "stars" } },
	{ import = "astrocommunity.media.pets-nvim" },
	{ import = "astrocommunity.media.presence-nvim" },
	{ import = "astrocommunity.media.vim-wakatime" },
	-- { import = "astrocommunity.note-taking.neorg" },
	{ import = "astrocommunity.pack.java" },
	{
		"nvim-jdtls",
		opts = function(_, opts)
			vim.cmd([[
  command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)
  command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)
  command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
  command! -buffer JdtJol lua require('jdtls').jol()
  command! -buffer JdtBytecode lua require('jdtls').javap()
  command! -buffer JdtJshell lua require('jdtls').jshell()
]])


			vim.api.nvim_set_keymap('n', '<leader>jo', "<Cmd>lua require'jdtls'.organize_imports()<CR>", { noremap = true })
			vim.api.nvim_set_keymap('n', '<leader>jv', "<Cmd>lua require('jdtls').extract_variable()<CR>", { noremap = true })
			vim.api.nvim_set_keymap('v', '<leader>jv', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
				{ noremap = true })
			vim.api.nvim_set_keymap('n', '<leader>jc', "<Cmd>lua require('jdtls').extract_constant()<CR>", { noremap = true })
			vim.api.nvim_set_keymap('v', '<leader>jc', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>",
				{ noremap = true })
			vim.api.nvim_set_keymap('v', '<leader>jm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
				{ noremap = true })

			-- If using nvim-dap
			-- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
			vim.api.nvim_set_keymap('n', '<leader>df', "<Cmd>lua require'jdtls'.test_class()<CR>", { noremap = true })
			vim.api.nvim_set_keymap('n', '<leader>dn', "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", { noremap = true })
		end
	},
	{ import = "astrocommunity.pack.go" },
	{ import = "astrocommunity.pack.yaml" },
	{ import = "astrocommunity.pack.typescript" },
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.rust" },
	{ import = "astrocommunity.pack.vue" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.haskell" },
	{ import = "astrocommunity.pack.dart" },
	{
		"flutter-tools.nvim",
		opts = {
			debugger = {
				enabled = true,
				run_via_dap = true,
				exception_breakpoints = {},
			},
			-- outline = { auto_open = true },
			decorations = {
				statusline = { device = true, app_version = true },
			},
			widget_guides = { enabled = true, debug = true },
			dev_log = { enabled = false, open_cmd = "tabedit" },
		},
	},
	{ import = "astrocommunity.project.neoconf-nvim" },
	-- { import = "astrocommunity.project.nvim-spectre" },
	{ import = "astrocommunity.syntax.vim-easy-align" },
	{ import = "astrocommunity.syntax.hlargs-nvim" },
	{ import = "astrocommunity.motion.mini-move" },
	{ import = "astrocommunity.motion.nvim-surround" },
	-- { import = "astrocommunity.motion.mini-surround" },
	{ import = "astrocommunity.motion.mini-bracketed" },
	{ import = "astrocommunity.motion.mini-ai" },
	{ import = "astrocommunity.motion.leap-nvim" },
	-- { import = "astrocommunity.note-taking.obsidian-nvim" },
	{ import = "astrocommunity.utility.noice-nvim" },
	{ import = "astrocommunity.project.project-nvim" },
	{
		"project.nvim",
		opts = {
			show_hidden = true,
		},
	},
	{ import = "astrocommunity.diagnostics.lsp_lines-nvim" },
	{ import = "astrocommunity.diagnostics.trouble-nvim" },
	{ import = "astrocommunity.utility.neodim" },
	-- { import = "astrocommunity.completion.copilot-lua" },
	-- { import = "astrocommunity.completion.copilot-lua-cmp" },
	{ import = "astrocommunity.indent.indent-blankline-nvim" },
	{ import = "astrocommunity.indent.indent-tools-nvim" },
	{ import = "astrocommunity.indent.mini-indentscope" },
	{ import = "astrocommunity.bars-and-lines.statuscol-nvim" },
	{ import = "astrocommunity.scrolling.mini-animate" },
	{ import = "astrocommunity.scrolling.nvim-scrollbar" },
	-- { import = "astrocommunity.scrolling.cinnamon-nvim" },
	{ import = "astrocommunity.syntax.hlargs-nvim" },
	{ import = "astrocommunity.syntax.vim-easy-align" },
	{ import = "astrocommunity.terminal-integration.flatten-nvim" },
	{ import = "astrocommunity.color.headlines-nvim" },
	{ import = "astrocommunity.color.tint-nvim" },
	{ import = "astrocommunity.color.twilight-nvim" },
	-- { import = "astrocommunity.color.ccc-nvim" },
	{ import = "astrocommunity.test.nvim-coverage" },
	-- { import = "astrocommunity.test.neotest" },
	-- {
	-- 	"neotest",
	-- 	opts = {
	-- 		-- consumers = {
	-- 		-- 	overseer = require "neotest.consumers.overseer",
	-- 		-- },
	-- 		-- overseer = {
	-- 		--   enabled = true,
	-- 		--   force_default = false,
	-- 		-- },
	-- 		adapters = {
	-- 			require "neotest-dart" {
	-- 				command = "flutter", -- Command being used to run tests. Defaults to `flutter`
	-- 				-- Change it to `fvm flutter` if using FVM
	-- 				-- change it to `dart` for Dart only tests
	-- 				use_lsp = true, -- When set Flutter outline information is used when constructing test name.
	-- 			},
	-- 			require "neotest-go",
	-- 			require "neotest-vim-test" { allow_file_types = { "java" } },
	-- 			require "neotest-jest" {
	-- 				jestCommand = "npm test --",
	-- 				env = { CI = true },
	-- 				cwd = function(_) return vim.fn.getcwd() end,
	-- 			},
	-- 			require "neotest-vitest" {
	-- 				command = "vitest", -- Command being used to run tests. Defaults to `vtest`
	-- 				use_lsp = true,
	-- 			},
	--
	-- 		}
	-- 	}
	-- }
}
