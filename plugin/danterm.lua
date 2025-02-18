local t_opts = {silent = true}
vim.keymap.set('t', '<C-n>', '<C-\\><C-N>', t_opts)
vim.keymap.set('t', '<C-h>', '<cmd>Danterm<CR>')
vim.keymap.set('n', '<leader>dt', '<cmd>Danterm<CR>')

local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

local function dan_term(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)
  local screen_width = vim.o.columns
  local screen_height = vim.o.lines
  local col = math.floor((screen_width - width) / 2)
  local row = math.floor((screen_height - height) / 2)

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded', -- optional, choose 'none', 'single', 'double', etc.
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

vim.api.nvim_create_user_command("Danterm", function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = dan_term { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.term()
      vim.api.nvim_input("i")
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end, {})
