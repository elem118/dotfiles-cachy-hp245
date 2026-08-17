vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = vim.fn.expand('~') .. '/.config/tmux/.tmux.conf',
  command = '!tmux source-file %',
  })
vim.api.nvim_create_autocmd({'BufEnter','BufWinEnter'}, {
  pattern = vim.fn.expand('~') .. '/.config/tmux/.tmux.conf',
  command = 'set syntax=on',
  })
