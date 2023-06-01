return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		build = ":MasonToolsUpdate",
		opts = {
			ensure_installed = {
				"gofumpt",
				"golines",
				"gotests",
				"gitsigns",
				"impl",
				"json-to-struct",
				"jq",
				"sonarlint-language-server",
				"luacheck",
				"pyright",
				"rust-analyzer",
				"eslint_d",
				"prettierd",
				"solidity",
				"stylelint",
				"yq",
				"xq",
			},
			auto_update = true,
			run_on_start = false,
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"cssls",
				"dockerls",
				"gopls",
				"html",
				"jsonls",
				"custom_elements_ls",
				"marksman",
				"pyright",
				"golangci_lint_ls",
				"solc",
				"lua_ls",
				"stylelint_lsp",
				"tsserver",
				"vimls",
				"vtsls",
				"yamlls"
			},
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		enabled = false,
		event = "VeryLazy",
		dev = true,
		config = function()
			require("mason.null-ls").setup({
				ensure_installed = {
					"black",
					"eslint_d",
					"flake8",
					"hadolint",
					"isort",
					"protolint",
					"shfmt",
					"staticcheck",
					"stylua",
					"hadolint",
					"ansiblelint",
					"rustfmt",
					"gitsigns",
					"trim_whitespace",
					"todo_comments",
				},
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		branch = "func_or_extend",
		opts = {
			ensure_installed = {
				"js",
			},
		},
	},
}
