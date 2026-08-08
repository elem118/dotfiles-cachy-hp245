vim.pack.add{ gh 'vds2212/vim-remotions' }
vim.g.remotions_motions = {
  TtFf = {},  -- keep default f/t/F/T repeat behavior
  search = {
    backward = "N",
    forward = "n",
    backward_desc = "Previous match",
    forward_desc = "Next match",
  },
  para = {
    backward = "{", forward = "}",
    backward_desc = "Previous paragraph", forward_desc = "Next paragraph",
  },
  method = {
    backward = "[m", forward = "]m",
    backward_desc = "Previous method", forward_desc = "Next method",
  },
  sentence = { backward = "(", forward = ")" },
  change = { backward = "g,", forward = "g;" },
  class = { backward = "[[", forward = "]]" },
  classend = { backward = "[]", forward = "][" },
  methodend = { backward = "[M", forward = "]M" },
  line = { backward = "k", forward = "j", repeat_if_count = 1, repeat_count = 1 },
  char = { backward = "h", forward = "l", repeat_if_count = 1, repeat_count = 1 },
  word = { backward = "b", forward = "w", repeat_if_count = 1, repeat_count = 1 },
  fullword = { backward = "B", forward = "W", repeat_if_count = 1, repeat_count = 1 },
  wordend = { backward = "ge", forward = "e", repeat_if_count = 1, repeat_count = 1 },
  pos = { backward = "<C-i>", forward = "<C-o>" },
  page = { backward = "<C-u>", forward = "<C-d>" },
  pagefull = { backward = "<C-b>", forward = "<C-f>" },
  undo = { backward = "u", forward = "<C-r>", direction = 1 },
  linescroll = { backward = "<C-e>", forward = "<C-y>" },
  charscroll = { backward = "zh", forward = "zl" },
  vsplit = { backward = "<C-w><", forward = "<C-w>>" },
  hsplit = { backward = "<C-w>-", forward = "<C-w>+" },
  arg = { backward = "[a", forward = "]a" },
  buffer = { backward = "[b", forward = "]b" },
  location = { backward = "[l", forward = "]l" },
  quickfix = { backward = "[q", forward = "]q" },
  tag = { backward = "[t", forward = "]t" },
  diagnostic = {
    backward = "[d", forward = "]d",
    backward_desc = "Previous diagnostic", forward_desc = "Next diagnostic",
  },
}
-- Optional: repeat direction ; = forward in document, , = backward
vim.g.remotions_direction = 1

-- Optional: make ; / , also respect the original count
vim.g.remotions_repeat_count = 1
