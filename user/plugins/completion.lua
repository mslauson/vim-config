local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "User AstroFile",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = false,
				},
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		event = "User AstroFile",
		after = { "copilot.lua" },
		config = function()
			-- lspkind.lua
			local lspkind = require("lspkind")
			lspkind.init({
				symbol_map = {
					Copilot = "",
				},
			})

			vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
			require("copilot_cmp").setup()
		end,
	},
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	opts = {
	-- 		sources = {
	-- 			{ name = "copilot", group_index = 2 },
	-- 			-- Other Sources
	-- 			{ name = "nvim_lsp", group_index = 2 },
	-- 			{ name = "path", group_index = 2 },
	-- 			{ name = "luasnip", group_index = 2 },
	-- 			{ name = "nvim_lua", group_index = 2 },
	-- 			{ name = "buffer", group_index = 2 },
	-- 			{ name = "neorg", group_index = 2 },
	-- 		},
	-- 		-- mapping = {
	-- 		-- 	["<Tab>"] = vim.schedule_wrap(function(fallback)
	-- 		-- 		if cmp.visible() and has_words_before() then
	-- 		-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
	-- 		-- 		else
	-- 		-- 			fallback()
	-- 		-- 		end
	-- 		-- 	end),
	-- 		-- },
	-- 		sorting = {
	-- 			priority_weight = 2,
	-- 			comparators = {
	--
	-- 				copilotComparators.prioritize,
	-- 				-- Below is the default comparitor list and order for nvim-cmp
	-- 				cmp.config.compare.offset,
	-- 				-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
	-- 				cmp.config.compare.exact,
	-- 				cmp.config.compare.score,
	-- 				cmp.config.compare.recently_used,
	-- 				cmp.config.compare.locality,
	-- 				cmp.config.compare.kind,
	-- 				cmp.config.compare.sort_text,
	-- 				cmp.config.compare.length,
	-- 				cmp.config.compare.order,
	-- 			},
	-- 		},
	-- 	},
	-- },
	{
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = require("plugins.configs.luasnip"),
		},
		{
			"hrsh7th/nvim-cmp",
			commit = "a9c701fa7e12e9257b3162000e5288a75d280c28", -- https://github.com/hrsh7th/nvim-cmp/issues/1382
			dependencies = {
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lsp",
			},
			event = "InsertEnter",
			opts = function()
				local cmp = require("cmp")
				local snip_status_ok, luasnip = pcall(require, "luasnip")
				local lspkind_status_ok, lspkind = pcall(require, "lspkind")
				if not snip_status_ok then
					return
				end
				local border_opts = {
					border = "single",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
				}

				local function has_words_before()
					local line, col = unpack(vim.api.nvim_win_get_cursor(0))
					return col ~= 0
						and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
				end

				return {
					enabled = function()
						if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then
							return false
						end
						return vim.g.cmp_enabled
					end,
					preselect = cmp.PreselectMode.None,
					formatting = {
						fields = { "kind", "abbr", "menu" },
						format = lspkind_status_ok and lspkind.cmp_format(astronvim.lspkind) or nil,
					},
					snippet = {
						expand = function(args)
							luasnip.lsp_expand(args.body)
						end,
					},
					duplicates = {
						nvim_lsp = 1,
						luasnip = 1,
						cmp_tabnine = 1,
						buffer = 1,
						path = 1,
					},
					confirm_opts = {
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					},
					window = {
						completion = cmp.config.window.bordered(border_opts),
						documentation = cmp.config.window.bordered(border_opts),
					},
					mapping = {
						["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
						["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
						["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
						["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
						["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
						["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
						["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
						["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
						["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
						["<C-y>"] = cmp.config.disable,
						["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
						["<CR>"] = cmp.mapping.confirm({ select = false }),
						["<Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_next_item()
							elseif luasnip.expand_or_jumpable() then
								luasnip.expand_or_jump()
							elseif has_words_before() then
								cmp.complete()
							else
								fallback()
							end
						end, { "i", "s" }),
						["<S-Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_prev_item()
							elseif luasnip.jumpable(-1) then
								luasnip.jump(-1)
							else
								fallback()
							end
						end, { "i", "s" }),
					},
					sources = cmp.config.sources({
						{ name = "copilot", group_index = 2, priority = 1250 },
						{ name = "nvim_lsp", priority = 1000 },
						{ name = "neorg", priority = 850 },
						{ name = "luasnip", priority = 750 },
						{ name = "buffer", priority = 500 },
						{ name = "path", priority = 250 },
					}),
					-- sorting = {
					-- priority_weight = 2,
					-- 	comparators = {
					--
					-- 		copilotComparators.prioritize,
					-- 		-- Below is the default comparitor list and order for nvim-cmp
					-- 		cmp.config.compare.offset,
					-- 		-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
					-- 		cmp.config.compare.exact,
					-- 		cmp.config.compare.score,
					-- 		cmp.config.compare.recently_used,
					-- 		cmp.config.compare.locality,
					-- 		cmp.config.compare.kind,
					-- 		cmp.config.compare.sort_text,
					-- 		cmp.config.compare.length,
					-- 		cmp.config.compare.order,
					-- 	},
					-- },
				}
			end,
		},
	},
}
