-- Print variables function
P = function(v)
  print(vim.inspect(v))
  return v
end

-- Custom keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>gg", vim.cmd.LazyGit)
vim.keymap.set("n", "<leader>mv", function()
  vim.cmd("Markview splitToggle")
end)
vim.keymap.set('n', '<leader><leader>r', function()
  vim.cmd("w")
  vim.cmd("source %")
end)
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>nh", "<cmd>noh<CR>")
vim.keymap.set("n", "<leader>wq", "<cmd>wq!<CR>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

-- Terminal in neovim --
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('open-terminal', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
local job_id = 0
vim.keymap.set("n", "<leader>tt", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
  job_id = vim.bo.channel
end)

vim.keymap.set("n", "<leader>build", function()
  vim.fn.chansend(job_id, { "ls -lah<CR>" })
end)

-- General config
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
-- vim.cmd("set guicursor=n-v-c-i:block")
-- vim.cmd("set guicursor=a:blinkon100")
vim.api.nvim_set_option("clipboard","unnamed")

-- Command to turn off diagnostics, if crowding screen
vim.api.nvim_create_user_command("DiagnosticsToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })
vim.keymap.set("n", "<leader>dt", "<cmd>DiagnosticsToggle<CR>")
