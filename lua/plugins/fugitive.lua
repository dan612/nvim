return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>")
    vim.keymap.set("n", "<leader>gvd", "<cmd>Gvdiff<CR>")
    vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>")
    vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>")
  end
}
