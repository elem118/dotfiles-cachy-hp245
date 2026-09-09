
vim.pack.add { gh 'mrcjkb/haskell-tools.nvim' }

-- keybinds
-- ~/.config/nvim/after/ftplugin/haskell.lua
local ht = require('haskell-tools')
-- local bufnr = vim.api.nvim_get_current_buf()
-- local opts = { noremap = true, silent = true, buffer = bufnr, }
-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default

-- Evaluate codelens expression
vim.keymap.set('n', '<leader>hc', vim.lsp.codelens.run, { desc = 'Evaluate codelens expression' })

-- Display code actions
vim.keymap.set('n', '<leader>ha', vim.lsp.buf.code_action, { desc = 'Code actions' })

-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set('n', '<leader>hsd', ht.hoogle.hoogle_signature, { desc = 'Hoogle Search this definition' })

-- Evaluate all code snippets
vim.keymap.set('n', '<leader>hea', ht.lsp.buf_eval_all, { desc = 'Evaluate all codelens snippets' })

-- Toggle a GHCi repl for the current package/repo
vim.keymap.set('n', '<leader>hrr', ht.repl.toggle, { desc = 'Toggle ghci repl for current repo' })

-- Toggle a GHCi repl for the current buffer/file
vim.keymap.set('n', '<leader>hrf', function()
  -- ht.repl.toggle(vim.api.nvim_buf_get_name(0))
  local current_file = vim.api.nvim_buf_get_name(0)
  -- Toggle repl for the current package (initializes in repo root)
  ht.repl.toggle()
  -- Load the current file into the repl
  ht.repl.load_file(current_file)
end, { desc = 'Toggle ghci repl for current file' })

vim.keymap.set('n', '<leader>hq', ht.repl.quit, { desc = 'Quit current repl' })

-- uncomment the following with care because the nvim process might crash when treesitter and tags are active for *.hs
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
vim.keymap.set('n', '<leader>hrt', ht.repl.cword_type, { desc = 'Type of word under cursor' })
vim.keymap.set('n', '<leader>hri', ht.repl.cword_info, { desc = 'Ghci info on word' })

-- this does not seem to work
-- vim.g.haskell_tools = {
--   tools = {
--     repl = {
--       auto_focus = true,  -- This automatically focuses the cursor in the repl
--     },
--   },
-- }

-- setup with telescope
require('telescope').load_extension('ht')

vim.keymap.set('n', '<leader>hsf', ':Telescope ht package_hsfiles<CR>', {desc='Search Haskell files in repo'})
vim.keymap.set('n', '<leader>hsg', ':Telescope ht package_hsgrep<CR>', {desc='Grep in Haskell files in repo'})
