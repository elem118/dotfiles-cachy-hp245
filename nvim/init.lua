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
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug'
  -- require 'kickstart.plugins.indent_line'
  -- require 'kickstart.plugins.lint'
  -- require 'kickstart.plugins.autopairs'
  -- require 'kickstart.plugins.neo-tree'
  -- require 'kickstart.plugins.gitsigns' -- adds gitsigns recommended keymaps
  require 'plugins.lucas-reineke_indent-blankline'
  require 'plugins.mrcjkb_haskell-tools'
  vim.pack.add { gh 'neovimhaskell/haskell-vim' }
  vim.pack.add { gh 'mfussenegger/nvim-dap' }
  require 'plugins.Olical_conjure'
  vim.pack.add { gh 'gpanders/nvim-parinfer' }
  vim.pack.add { gh 'HiPhish/rainbow-delimiters.nvim' }
  require 'plugins.julienvincent_nvim-paredit'
  require 'plugins.vds2212_vim-remotions'
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- =======================================
-- MY SCRIPTS
-- =======================================
require 'scripts.tmux'
require 'scripts.haskell_treesitter_stop'
require 'scripts.waybar_reload'
require 'scripts.kmonad_reload'
