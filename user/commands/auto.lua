local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_create_user_command
local namespace = vim.api.nvim_create_namespace

local utils = require("astronvim.utils")
local is_available = utils.is_available
local astroevent = utils.event

autocmd({ "InsertLeave", "TextChanged" }, {
	desc = "Save on Insert Leave",
	pattern = "*.*",
	callback = function()
		vim.cmd.wa()
	end,
})

autocmd({ "BufWritePost" }, {
	desc = "Sync Maven Dependency On Pom Update",
	pattern = "pom.xml",
	callback = function()
		if is_available("mvn") then
			utils.execute_command("mvn dependency:resolve")
		else
			print("Maven (mvn) is not installed or not available in PATH")
		end
	end,
})

-- Trigger Maven dependency download when pom.xml is modified

-- local nvim_create_autocmd = function(event, triggers, operations)
-- 	vim.api.nvim_command("autocmd " .. event .. " " .. triggers .. " " .. operations)
-- end
-- nvim_create_autocmd("InsertLeave,TextChanged", "*.*", "w")
