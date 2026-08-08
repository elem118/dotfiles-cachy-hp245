
-- ============================================================
-- SECTION 2: KEYMAPS
-- basic keymaps
-- ============================================================
do

  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

  vim.keymap.set('n', '<leader>cd', '<cmd>Ex<CR>', { desc = 'Open Netrw' })

  -- Diagnostic Config & Keymaps
  --  See `:help vim.diagnostic.Opts`
  vim.diagnostic.config {
    update_in_insert = false,
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many', wrap = true },
    underline = { severity = { min = vim.diagnostic.severity.WARN } },

    -- Can switch between these as you prefer
    virtual_text = false, -- Text shows up at the end of the line
    virtual_lines = true, -- Text shows up underneath the line, with virtual lines

    -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
    jump = {
      on_jump = function(_, bufnr)
        vim.diagnostic.open_float {
          bufnr = bufnr,
          scope = 'cursor',
          focus = false,
        }
      end,
    },
  }

  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

  vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

  --  See `:help wincmd` for a list of all window commands
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

  vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
  vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
  vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
  vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

  vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
  })

  vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste overwrite without altering register" })
  vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete into black hole register" })
  vim.keymap.set("n", "<leader>dd", '"_dd', { desc = "Delete line into black hole register" })
  vim.keymap.set("n", "<leader>D", '"_D', { desc = "Delete to EOL into black hole register" })
  vim.keymap.set("x", "<leader>d", '"_d', { desc = "Delete selection into black hole register" })
  vim.keymap.set("x", "<leader>x", '"_x', { desc = "Delete selection into black hole register" })

  vim.keymap.set("n", "<leader>rcv", ":e $MYVIMRC<CR>", { desc = "Configure neovim" })
  vim.keymap.set("n", "<leader>rch", ":e ~/.config/hypr/hyprland.lua<CR>", { desc = "Configure Hyprland" })
  vim.keymap.set("n", "<leader>rcz", ":e ~/.zshrc<CR>", { desc = "Configure zsh" })
  vim.keymap.set("n", "<leader>rct", ":e ~/.tmux.conf<CR>", { desc = "Configure tmux" })
  vim.keymap.set("n", "<leader>rck", ":e ~/.config/kmonad/elempad_2.kbd<CR>", { desc = "Configure kmonad config" })

  vim.keymap.set("n", "<leader>pwd", ":lcd %:h<CR>", { desc = "Change directory of current window to current file location" })

end

