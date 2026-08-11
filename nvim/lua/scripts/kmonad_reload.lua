vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = vim.fn.expand('~') .. '/.config/kmonad/*',
  command = '!sudo systemctl restart keyboard',
  })
