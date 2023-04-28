local M = {}

M.config = function()
  local status_ok, typst = pcall(require, "typst")
  if not status_ok then
    return
  end

  typst.setup {
  }

end

return M
