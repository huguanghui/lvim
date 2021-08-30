local M = {}

M.config = function ()
  lvim.plugins = {
    {"editorconfig/editorconfig-vim"},
    {"folke/tokyonight.nvim"},
    {"psliwka/vim-smoothie"},
    {
      -- 快速移动
      'justinmk/vim-sneak',
      -- event = "BufWinEnter",
      setup = function ()
        require("user.sneak").setup()
      end,
    },
    {
      "babaybus/DoxygenToolkit.vim",
      event = "VimEnter",
      config = function ()
        require("user.doxygen").setup()
      end,
    },
    {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
    },
  }
end

return M
