-- ~/.config/nvim/lua/tmux_new_pane.lua
local M = {}

function M.tmux_new_pane_with_current_buffer_dir()
	local buffer_directory = vim.fn.expand("%:p:h")
	local cmd = "tmux split-window -c " .. vim.fn.shellescape(buffer_directory)
	vim.fn.system(cmd)
end

vim.cmd("command! TmuxNewPane lua M.tmux_new_pane_with_current_buffer_dir()")
return M
