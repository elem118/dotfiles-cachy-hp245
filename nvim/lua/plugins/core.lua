
-- ============================================================
-- SECTION 4: UI / CORE UX PLUGINS
-- guess-indent, gitsigns, which-key, colorscheme, todo-comments, mini modules
-- ============================================================
do
  vim.pack.add { gh 'NMAC427/guess-indent.nvim' }
  require('guess-indent').setup {}

  vim.pack.add { gh 'lewis6991/gitsigns.nvim' }
  require('gitsigns').setup {
    signs = {
      add = { text = '+' }, ---@diagnostic disable-line: missing-fields
      change = { text = '~' }, ---@diagnostic disable-line: missing-fields
      delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
      topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
      changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
    },
  }

  vim.pack.add { gh 'folke/which-key.nvim' }
  require('which-key').setup {
    -- Delay between pressing a key and opening which-key (milliseconds)
    delay = 0,
    icons = { mappings = vim.g.have_nerd_font },
    -- Document existing key chains
    spec = {
      { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } }, -- Enable gitsigns recommended keymaps first
      { 'gr', group = 'LSP Actions', mode = { 'n' } },
    },
  }

  vim.pack.add { gh 'folke/tokyonight.nvim' }
  require('tokyonight').setup {
    styles = {
      comments = { italic = false }, -- Disable italics in comments
    },
  }

  vim.cmd.colorscheme 'tokyonight-night'

  vim.pack.add { gh 'folke/todo-comments.nvim' }
  require('todo-comments').setup { signs = false }

  vim.pack.add { gh 'nvim-mini/mini.nvim' }

  if vim.g.have_nerd_font then
    require('mini.icons').setup()
    -- Used for backwards compatibility with plugins that require `nvim-web-devicons` (e.g. telescope.nvim)
    MiniIcons.mock_nvim_web_devicons()
  end

  require('mini.ai').setup {
    -- mappings = {
    --   around_next = 'aa',
    --   inside_next = 'ii',
    -- },
    n_lines = 500,
  }

  require('mini.surround').setup({
    search_method = 'cover_or_nearest'
  })

  local statusline = require 'mini.statusline'
  -- Set `use_icons` to true if you have a Nerd Font
  statusline.setup { use_icons = vim.g.have_nerd_font }

  statusline.section_location = function() return '%2l:%-2v' end

  require('mini.jump2d').setup()
  -- vim.keymap.set(
  --   { 'n', 'x', 'o' },
  --   '<CR>',
  --   -- '<Cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<CR>'
  --   '<Cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.query)<CR>'
  -- )
  --  Check out: https://github.com/nvim-mini/mini.nvim
  vim.keymap.set({ 'n', 'x', 'o' }, '<CR>', function()
    MiniJump2d.start(MiniJump2d.builtin_opts.query)
  end, { desc = 'Sneak-like 2-char jump' })
end
