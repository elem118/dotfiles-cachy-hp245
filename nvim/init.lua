require 'options'
require 'keymaps'
require 'plugins.setup'
function gh(repo) return 'https://github.com/' .. repo end
require 'plugins.core'
require 'telescope_setup'
require 'lsp_setup'
require 'formatting'
require 'autocomplete'
require 'treesitter_setup'

-- ============================================================
-- SECTION 10: MY PLUGINS
-- ============================================================
do
  -- require 'kickstart.plugins.debug'
  -- require 'kickstart.plugins.neo-tree'
  -- require 'kickstart.plugins.gitsigns' -- adds gitsigns recommended keymaps
  require 'plugins.nvim-autopairs'
  require 'plugins.indent-blankline'
  require 'plugins.haskell-tools'
  require 'plugins.haskell-vim'
  require 'plugins.nvim-lint'
  require 'plugins.conjure'
  require 'plugins.nvim-paredit'
  require 'plugins.vim-remotions'
  require 'plugins.vim-tmux-navigator'
  require 'plugins.flash'
  require 'plugins.oil'
  require 'plugins.nvim-dap'
  require 'plugins.nvim-parinfer'
  require 'plugins.rainbow-delimeters'
  -- require 'plugins.ElmCast_elm-vim'
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- =======================================
-- MY SCRIPTS
-- =======================================
require 'scripts.tmux_reload'
require 'scripts.haskell_treesitter_stop'
require 'scripts.waybar_reload'
require 'scripts.kmonad_reload'
require 'scripts.remove_trailing_spaces'
