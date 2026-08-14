
vim.pack.add { gh 'mrcjkb/haskell-tools.nvim' }

-- keybinds
-- ~/.config/nvim/after/ftplugin/haskell.lua
local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr, }
-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
vim.keymap.set('n', '<leader>hc', vim.lsp.codelens.run, opts)
-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set('n', '<leader>hs', ht.hoogle.hoogle_signature, opts)
-- Evaluate all code snippets
vim.keymap.set('n', '<leader>hea', ht.lsp.buf_eval_all, opts)
-- Toggle a GHCi repl for the current package/repo
vim.keymap.set('n', '<leader>hrr', ht.repl.toggle, opts)
-- Toggle a GHCi repl for the current buffer/file
vim.keymap.set('n', '<leader>hrf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, opts)
vim.keymap.set('n', '<leader>hrq', ht.repl.quit, opts)

-- fast-tags
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*.hs",
--   callback = function()
--     vim.fn.jobstart("fast-tags -R .", { detach = true })
--   end,
-- })
