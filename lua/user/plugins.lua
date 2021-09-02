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
      "simrat39/symbols-outline.nvim",
      -- cmd = "SymbolsOutline",
      config = function()
        require("user.outline").config()
      end,
    },
    {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup()
      end,
      cmd = "Trouble",
    },
    {
      "danymat/neogen",
      config = function()
        require("neogen").setup {
          enabled = true,
        }
      end,
      event = "BufRead",
      requires = "nvim-treesitter/nvim-treesitter",
    },
  }
end

return M
