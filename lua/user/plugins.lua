local M = {}

M.config = function()
	lvim.plugins = {
		{
			"Pocco81/Catppuccino.nvim",
			config = function()
				require("user/theme").catppuccino()
			end,
			cond = function()
				local _time = os.date("*t")
				return (_time.hour >= 7 and _time.hour < 11)
			end,
		},
		{
			"folke/tokyonight.nvim",
			config = function()
				require("user/theme").tokyonight()
				vim.cmd([[
      colorscheme tokyonight
      ]])
			end,
			cond = function()
				local _time = os.date("*t")
				return (_time.hour >= 0 and _time.hour < 7) or (_time.hour >= 11 and _time.hour < 17)
			end,
		},
		{
			"NTBBloodbath/doom-one.nvim",
			config = function()
				vim.g.doom_one_italic_comments = true
				vim.cmd([[
      colorscheme doom-one
      ]])
			end,
			cond = function()
				local _time = os.date("*t")
				return (_time.hour >= 17 and _time.hour < 21)
			end,
		},
		{ "editorconfig/editorconfig-vim" },
		{ "folke/tokyonight.nvim" },
		{ "psliwka/vim-smoothie" },
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
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup()
			end,
			event = "BufRead",
		},
		{
			"tzachar/cmp-tabnine",
			run = "./install.sh",
			requires = "hrsh7th/nvim-cmp",
			config = function()
				local tabnine = require("cmp_tabnine.config")
				tabnine:setup({
					max_lines = 1000,
					max_num_results = 10,
					sort = true,
				})
			end,
			disable = not lvim.builtin.tabnine.active,
		},
		{
			"lukas-reineke/indent-blankline.nvim",
			setup = function()
				require("user.indent_blankline").setup()
			end,
			event = "BufRead",
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
				require("neogen").setup({
					enabled = true,
				})
			end,
			event = "BufRead",
			requires = "nvim-treesitter/nvim-treesitter",
		},
		{
			"akinsho/bufferline.nvim",
			config = function()
				require("user.bufferline").config()
			end,
			requires = "nvim-web-devicons",
			disable = not lvim.builtin.fancy_bufferline.active,
		},
	}
end

return M
