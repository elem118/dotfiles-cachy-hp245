vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = vim.fn.expand('~') .. '/.tmux.conf',
  command = '!tmux source-file %',
  })
