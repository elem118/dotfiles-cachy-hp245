vim.pack.add { gh 'folke/flash.nvim' }

local flash = require("flash")

-- default settings
flash.setup
{
  modes = {
    char = {
      enabled = false,
    }
  }
}

-- {
--   "folke/flash.nvim",
--   event = "VeryLazy",
--   ---@type Flash.Config
--   opts = {},
--   keys = {
--     { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
--     { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
--     { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
--     { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
--     { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
--   },
-- }

vim.keymap.set({'n','x','o'}, 't', flash.jump, {desc='Flash'})
vim.keymap.set({'n','x','o'}, 'T', flash.treesitter, {desc='Flash'})

-- setup colors
vim.api.nvim_set_hl(0, 'FlashLabel', { fg = 'white', bg ='purple', bold = true })
