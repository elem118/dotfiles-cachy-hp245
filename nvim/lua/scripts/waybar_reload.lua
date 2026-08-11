vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = vim.fn.expand('~') .. '/.config/waybar/*',
  command = '!reload waybar',
  })
