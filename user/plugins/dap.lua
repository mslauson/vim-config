local function findMainClass()
	local handle = io.popen(
		[[grep -rnl . -e "public%s+static%s+void%s+main%s*%(" --include="*.java" | xargs grep -l "public%s+class"]]
	)
	local result = handle:read("*a")
	handle:close()

	local mainClass = result:match("^(.-)\n")
	return mainClass or ""
end

local function loadEnvVars()
	local envFile = io.open(".env", "r")
	if envFile then
		for line in envFile:lines() do
			local key, value = line:match("^%s*(.-)%s*=%s*(.-)%s*$")
			if key and value then
				os.setenv(key, value)
			end
		end
		envFile:close()
	end
end

local function find_main_go()
	local handle = io.popen("find . -name main.go")
	local result = handle:read("*a")
	handle:close()
	-- Expecting the result in './path/to/main.go\n' format, so removing trailing newline character
	result = result:sub(1, -2)
	return result
end

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "theHamsta/nvim-dap-virtual-text", config = true },
		{ "jbyuki/one-small-step-for-vimkind" },
		{
			"rcarriga/nvim-dap-ui",
			config = function()
				require("dapui").setup({
					layouts = {
						{
							elements = {
								-- Elements can be strings or table with id and size keys.
								{ id = "scopes", size = 0.25 },
								"breakpoints",
								"stacks",
								"watches",
							},
							size = 40, -- 40 columns
							position = "right",
						},
						{
							elements = {
								"repl",
								"console",
							},
							size = 0.25, -- 25% of total lines
							position = "bottom",
						},
					},
				})
			end,
		},
		{
			"leoluz/nvim-dap-go",
			config = function()
				require("dap-go").setup({
					-- Additional dap configurations can be added.
					-- dap_configurations accepts a list of tables where each entry
					-- represents a dap configuration. For more details do:
					-- :help dap-configuration
					dap_configurations = {
						{
							-- Must be "go" or it will be ignored by the plugin
							type = "go",
							name = "Attach remote",
							mode = "remote",
							request = "attach",
						},
						{
							type = "go",
							request = "launch",
							name = "Debug Main",
							mode = "debug",
							program = find_main_go(),
						},
					},
					-- delve configurations
					delve = {
						-- time to wait for delve to initialize the debug session.
						-- default to 20 seconds
						initialize_timeout_sec = 20,
						-- a string that defines the port to start delve debugger.
						-- default to string "${port}" which instructs nvim-dap
						-- to start the process in a random available port
						port = "${port}",
					},
				})
			end,
		},
	},
	config = function(_, _)
		vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
		vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })

		-- Catppuccin
		local sign = vim.fn.sign_define

		sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
		local dap = require("dap")

		-- loadEnvVars()

		-- local mainClass = findMainClass()

		dap.configurations.java = {
			{
				type = "java",
				name = "Debug (Attach)",
				request = "attach",
				hostName = "localhost",
				port = 5005,
			},
			-- {
			--   type = "java",
			--   request = "launch",
			--   name = "Debug Env File",
			--   cwd = "${workspaceFolder}",
			--   console = "internalConsole",
			--   mainClass = mainClass,
			--   args = {
			--     "--spring.profiles.active=" .. os.getenv("SPRING_PROFILE"),
			--     "--server.port=" .. os.getenv("SERVER_PORT")
			--     "--management.server.port=" .. os.getenv("MANAGEMENT_SERVER_PORT")
			--   }
			-- }
		}

		dap.adapters.nlua = function(callback, config)
			callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
		end
	end,
}
