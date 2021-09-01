local M = {}

M.config = function ()
  lvim.plugins = {
    {"editorconfig/editorconfig-vim"},
    {"folke/tokyonight.nvim"},
    {"psliwka/vim-smoothie"},
    {
       -- 快速移动
      "phaazon/hop.nvim",
      event = "BufRead",
      config = function()
        require("user.hop").config()
      end,
    },
    {
      -- 搜索替换
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function()
        require("user.spectre").config()
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
    {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup()
      end,
      cmd = "Trouble",
    },
  }
end

return M
