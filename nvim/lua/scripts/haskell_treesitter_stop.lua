vim.api.nvim_create_autocmd({'BufAdd', 'BufCreate', 'BufEnter', 'BufNew', 'BufWinEnter'}, {
  pattern = '*.hs',
  command = 'lua vim.treesitter.stop()',
})
