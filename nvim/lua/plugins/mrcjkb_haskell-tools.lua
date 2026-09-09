
vim.pack.add { gh 'mrcjkb/haskell-tools.nvim' }

-- keybinds
-- ~/.config/nvim/after/ftplugin/haskell.lua
local ht = require('haskell-tools')
-- local bufnr = vim.api.nvim_get_current_buf()
-- local opts = { noremap = true, silent = true, buffer = bufnr, }
-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
vim.keymap.set('n', '<leader>hc', vim.lsp.codelens.run, { desc = 'Evaluate codelens expression' })
-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set('n', '<leader>hs', ht.hoogle.hoogle_signature, { desc = 'Hoogle Search this definition' })
-- Evaluate all code snippets
vim.keymap.set('n', '<leader>hea', ht.lsp.buf_eval_all, { desc = 'Evaluate all code snippets' })
-- Toggle a GHCi repl for the current package/repo
vim.keymap.set('n', '<leader>hrr', ht.repl.toggle, { desc = 'Toggle ghci repl for current repo' })
-- Toggle a GHCi repl for the current buffer/file
vim.keymap.set('n', '<leader>hrf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, { desc = 'Toggle ghci repl for current file' })
vim.keymap.set('n', '<leader>hq', ht.repl.quit, { desc = 'Quit current repl' })

-- fast-tags
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*.hs",
--   callback = function()
--     vim.fn.jobstart("fast-tags -R .", { detach = true })
--   end,
-- })

-- Custom keymaps
vim.keymap.set('n', '<leader>hg', ':!ghc %<cr>', { desc = 'Compile current buffer'})
vim.keymap.set('n', '<leader>hx', ':split<cr>:resize 10<cr>:term runhaskell %<cr>i', { desc = 'Execute current buffer'})
