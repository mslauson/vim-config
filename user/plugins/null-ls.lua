return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.completion.spell,
					null_ls.builtins.completion.luasnip,

					null_ls.builtins.code_actions.gomodifytags,
					null_ls.builtins.code_actions.impl,
					null_ls.builtins.code_actions.gitsigns,
					null_ls.builtins.code_actions.gitrebase,
					null_ls.builtins.code_actions.eslint_d,
					null_ls.builtins.code_actions.refactoring,
					null_ls.builtins.code_actions.shellcheck,

					null_ls.builtins.diagnostics.eslint_d,
					null_ls.builtins.diagnostics.dotenv_linter,
					-- null_ls.builtins.diagnostics.golangci_lint,
					-- null_ls.builtins.diagnostics.gospel,
					-- null_ls.builtins.diagnostics.revive,
					null_ls.builtins.diagnostics.jshint,
					null_ls.builtins.diagnostics.jsonlint,
					null_ls.builtins.diagnostics.ktlint,
					null_ls.builtins.diagnostics.ltrs,
					null_ls.builtins.diagnostics.luacheck,
					null_ls.builtins.diagnostics.markdownlint,
					null_ls.builtins.diagnostics.npm_groovy_lint.with({
						filetypes = { "groovy", "Jenkinsfile" }
					}),
					null_ls.builtins.diagnostics.pmd.with({
						extra_args = {
							"--rulesets",
							"category/java/bestpractices.xml,category/jsp/bestpractices.xml" -- or path to self-written ruleset
						},
						filetypes = { "jsp", "jspf" }
					}),
					null_ls.builtins.diagnostics.tsc,
					null_ls.builtins.diagnostics.yamllint,
					null_ls.builtins.diagnostics.zsh,
					null_ls.builtins.diagnostics.stylelint,

					null_ls.builtins.formatting.fourmolu,
					null_ls.builtins.formatting.dart_format,
					null_ls.builtins.formatting.eslint_d,
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.fixjson,
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.golines,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.goimports,
					null_ls.builtins.formatting.jq,
					null_ls.builtins.formatting.ktlint,
					null_ls.builtins.formatting.markdownlint,
					null_ls.builtins.formatting.markdown_toc,
					null_ls.builtins.formatting.npm_groovy_lint.with({
						filetypes = { "groovy", "Jenkinsfile" }
					}),
					null_ls.builtins.formatting.pg_format,
					null_ls.builtins.formatting.rustfmt,
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.sqlformat,
					null_ls.builtins.formatting.stylelint,
					null_ls.builtins.formatting.xmllint,
					null_ls.builtins.formatting.xq,
					null_ls.builtins.formatting.yq,
				},
			})
		end,
		requires = { "nvim-lua/plenary.nvim" },
	},
}
