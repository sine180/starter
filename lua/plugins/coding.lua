local in_vscode = vim.g.vscode ~= nil

return {
  {
    "echasnovski/mini.ai",
    opts = {},
  },
  {
    "echasnovski/mini.surround",
    opts = {},
  },
  {
    "echasnovski/mini.comment",
    cond = not in_vscode,
    opts = {},
  },
  {
    "echasnovski/mini.move",
    cond = not in_vscode,
    opts = {},
  },
  {
    "echasnovski/mini.pairs",
    cond = not in_vscode,
    opts = {},
  },

  {
    "tpope/vim-repeat",
  },
  {
    "gbprod/yanky.nvim",
    opts = {
      highlight = {
        on_put = false,
        on_yank = false,
      },
    },
    keys = {
      {
        "p",
        "<Plug>(YankyPutAfter)",
        mode = { "n", "x" },
        desc = "Put after",
      },
      {
        "P",
        "<Plug>(YankyPutBefore)",
        mode = { "n", "x" },
        desc = "Put before",
      },
      {
        "gp",
        "<Plug>(YankyGPutAfter)",
        mode = { "n", "x" },
        desc = "Put after and leave cursor",
      },
      {
        "gP",
        "<Plug>(YankyGPutBefore)",
        mode = { "n", "x" },
        desc = "Put before and leave cursor",
      },
      {
        "[y",
        "<Plug>(YankyCycleForward)",
        desc = "Cycle yank history forward",
      },
      {
        "]y",
        "<Plug>(YankyCycleBackward)",
        desc = "Cycle yank history backward",
      },
    },
  },

  {
    url = "https://codeberg.org/andyg/leap.nvim",
    keys = {
      {
        "gs",
        function()
          require("leap").leap({
            target_windows = { vim.fn.win_getid() },
          })
        end,
        mode = { "n", "x", "o" },
        desc = "Leap forward",
      },
      {
        "gS",
        function()
          require("leap").leap({
            backward = true,
            target_windows = { vim.fn.win_getid() },
          })
        end,
        mode = { "n", "x", "o" },
        desc = "Leap backward",
      },
    },
  },
}