return {
  -- dir = "/Users/danchadwick/Projects/neovim/ahoy.nvim",
  "calcu1on/ahoy.nvim",
  config = function()
    local ahoy = require('ahoy')
    vim.keymap.set('n', '<leader>sf', function() ahoy.save_file() end)
  end
}

