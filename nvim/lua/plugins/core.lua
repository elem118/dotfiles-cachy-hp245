
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
  -- setting the colors of the which window, floating windows and pmenus
  vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("WhichKeyHighlight", { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "#1e1e2e", fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#45475a", bg = "#1e1e2e" })
    vim.api.nvim_set_hl(0, "WhichKeyTitle", { fg = "#a6e3a1" })
    -- Apply the same colors to all floating windows (LSP, diagnostics, etc)
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e", fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#45475a", bg = "#1e1e2e" })
    -- Apply the same colors to all pmenus
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1e1e2e", fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "PmenuKind", { bg = "#1e1e2e", fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "teal", fg = "black" })
    vim.api.nvim_set_hl(0, "PmenuKindSel", { bg = "teal", fg = "black" })
    vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "#45475a", bg = "#1e1e2e" })
    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1e1e2e" })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "steelblue" })
  end,
  })

  -- Trigger bespoke colorscheme once at load
  vim.api.nvim_exec_autocmds("ColorScheme", {})

  vim.pack.add { gh 'folke/tokyonight.nvim' }
  require('tokyonight').setup {
    styles = {
      comments = { italic = false }, -- Disable italics in comments
    },
  }

  -- vim.cmd.colorscheme 'tokyonight-night'
  vim.cmd.colorscheme 'quiet'

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

  require('mini.tabline').setup()
end
