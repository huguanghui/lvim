local M = {}

M.config = function()
  require("chatgpt").setup {}
  local opts = { noremap = true, silent = true }
  local keymap = vim.keymap.set
  keymap("n", "<c-p>", "<cmd>ChatGPT<cr>", opts)
end

return M
