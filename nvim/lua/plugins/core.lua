
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
  -- setting the colors of the which window
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
  -- vim.api.nvim_create_autocmd("ColorScheme", {
  -- group = vim.api.nvim_create_augroup("UnderstateFul", { clear = true }),
  -- callback = function()
  --   -- Base floating windows (which-key, LSP, etc)
  --   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e", fg = "#cdd6f4" })
  --   vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#45475a", bg = "#1e1e2e" })
  --   -- Selection & Visual Mode (muted blue)
  --   vim.api.nvim_set_hl(0, "Visual", { bg = "#313244", fg = "NONE" })
  --   vim.api.nvim_set_hl(0, "VisualNOS", { bg = "#313244" })
  --   -- Cursor Line (very subtle)
  --   vim.api.nvim_set_hl(0, "CursorLine", { bg = "#262735" })
  --   vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#89b4fa", bg = "#262735" })
  --   -- Line Numbers (muted gray)
  --   vim.api.nvim_set_hl(0, "LineNr", { fg = "#45475a" })
  --   -- Scrollbar / Scrollbar Background
  --   vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#262735" })
  --   vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#45475a" })
  --   -- Completion Menu (understated)
  --   vim.api.nvim_set_hl(0, "Pmenu", { bg = "#262735", fg = "#bac2de" })
  --   vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#313244", fg = "#a6e3a1", bold = true })
  --   vim.api.nvim_set_hl(0, "PmenuKind", { bg = "#262735", fg = "#89b4fa" })
  --   vim.api.nvim_set_hl(0, "PmenuExtra", { bg = "#262735", fg = "#74c7ec" })
  --   -- Search Highlights (muted)
  --   vim.api.nvim_set_hl(0, "Search", { bg = "#313244", fg = "#f5e0dc" })
  --   vim.api.nvim_set_hl(0, "IncSearch", { bg = "#45475a", fg = "#eba0ac" })
  --   -- Diagnostics (muted colors)
  --   vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#f38ba8" })      -- soft red
  --   vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#f9e2af" })       -- soft yellow
  --   vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#89b4fa" })       -- soft blue
  --   vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#a6e3a1" })       -- soft green
  --   -- Status Line (understated)
  --   vim.api.nvim_set_hl(0, "StatusLine", { bg = "#262735", fg = "#bac2de" })
  --   vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1e1e2e", fg = "#45475a" })
  --   -- Spell Check (subtle underlines)
  --   vim.api.nvim_set_hl(0, "SpellBad", { sp = "#f38ba8", undercurl = true })
  --   vim.api.nvim_set_hl(0, "SpellCap", { sp = "#89b4fa", undercurl = true })
  --   vim.api.nvim_set_hl(0, "SpellLocal", { sp = "#74c7ec", undercurl = true })
  --   -- Folded (muted)
  --   vim.api.nvim_set_hl(0, "Folded", { bg = "#262735", fg = "#89b4fa" })
  --   -- Tab Bar (understated)
  --   vim.api.nvim_set_hl(0, "TabLine", { bg = "#262735", fg = "#45475a" })
  --   vim.api.nvim_set_hl(0, "TabLineSel", { bg = "#313244", fg = "#cdd6f4" })
  --   vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#1e1e2e" })
  -- end,
  -- })
  -- Trigger it once at load
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

  -- require('mini.jump2d').setup()
  -- vim.keymap.set(
  --   { 'n', 'x', 'o' },
  --   '<CR>',
  --   -- '<Cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<CR>'
  --   '<Cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.query)<CR>'
  -- )
  --  Check out: https://github.com/nvim-mini/mini.nvim
  -- vim.keymap.set({ 'n', 'x', 'o' }, '<CR>', function()
  --   MiniJump2d.start(MiniJump2d.builtin_opts.query)
  -- end, { desc = 'Sneak-like 2-char jump' })
  require('mini.jump2d').setup({
    view = {
      dim = true,
      n_steps_ahead = 2,
    },
    hooks = {
      before_start = function() vim.cmd("normal! m'") end,  -- sets the ' mark for Ctrl-O
    },
  })
  local function two_char_spotter()
    local ok1, c1 = pcall(vim.fn.getcharstr)
    if not ok1 or c1 == '\27' then return function() return {} end end
    local ok2, c2 = pcall(vim.fn.getcharstr)
    if not ok2 or c2 == '\27' then return function() return {} end end

    local query = c1 .. c2
    local pattern = vim.pesc(query)

    -- the below produces errors so is commented out
    -- Respect smartcase: lowercase query = case-insensitive, any uppercase = case-sensitive
    -- if vim.o.ignorecase and vim.o.smartcase and query:match('%u') == nil then
    --   pattern = '\\c' .. pattern
    -- end
    return MiniJump2d.gen_spotter.pattern(pattern)
  end
  vim.keymap.set({ 'n', 'x', 'o' }, '<CR>', function()
    MiniJump2d.start({
      spotter = two_char_spotter(),
      allowed_windows = { current = true, not_current = true }
    })
  end, { desc = 'Sneak-like 2-char jump' })
end
