vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>gg", vim.cmd.LazyGit)
vim.keymap.set("n", "<leader>nt", function()
  vim.cmd("tabnew")
end)
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set syntax=on")
vim.cmd("set number")
vim.cmd("set nu")
vim.cmd("set relativenumber")
vim.cmd("set rnu")
vim.cmd("set number relativenumber")
vim.cmd("set nu rnu")
vim.api.nvim_set_option("clipboard","unnamed")
vim.api.nvim_create_user_command("DiagnosticsToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })
