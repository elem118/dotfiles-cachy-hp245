vim.pack.add { gh 'christoomey/vim-tmux-navigator' }

-- keymaps
vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<cr>', { noremap = true })
vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<cr>', { noremap = true })
vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<cr>', { noremap = true })
vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<cr>', { noremap = true })
vim.keymap.set('n', '<C-\\>', '<cmd>TmuxNavigatePrevious<cr>', { noremap = true })
