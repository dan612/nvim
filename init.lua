require("dan.core")
-- Lazy VIM --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
vim.cmd.colorscheme('catppuccin')
local dap = require('dap')
require('telescope').load_extension('dap')

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" }
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9003,
    log = true,
  },
  {
    name = "listen for Xdebug docker",
    type = "php",
    request = "launch",
    port = 9003,
    -- this is where your file is in the container
    pathMappings = {
      ["/var/www/html/web"] = "${workspaceFolder}"
    }
  }
}

vim.keymap.set('n', '<leader>?', function() dap.continue() end)
vim.keymap.set('n', '<leader>N', function() dap.step_over() end)
vim.keymap.set('n', '<leader>n', function() dap.step_into() end)
vim.keymap.set('n', '<leader>E', function() dap.step_out() end)
vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>B', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<leader>dl', function() dap.run_last() end)
-- vim.keymap.set({'n', 'v'}, '<leader>dh', function()
--   require('dap.ui.widgets').hover()
-- end)
-- vim.keymap.set({'n', 'v'}, '<leader>dp', function()
--   require('dap.ui.widgets').preview()
-- end)
-- vim.keymap.set('n', '<leader>df', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.frames)
-- end)
vim.keymap.set('n', '<leader>db', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end

-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end

-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

