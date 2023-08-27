local M = {}

M.config = function()
  local status_ok, incl = pcall(require, "incline")
  if not status_ok then
    return
  end

  incl.setup {
    window = {
      zindex = 49,
      winhighlight = {
        inactive = {
          Normal = "Directory",
        },
      },
      width = "fit",
      padding = { left = 2, right = 1 },
      placement = { vertical = "top", horizontal = "right" },
      margin = {
        horizontal = 0,
      },
    },
    hide = {
      cursorline = false,
      focused_win = true,
      only_win = false,
    },
    render = "basic",
  }
end

return M
