local M = {}

M.config = function()
  vim.g.vimwiki_list = {
    {
      path = "~/vimwiki/work/",
      syntax = "markdown",
      ext = ".md",
    },
    {
      path = "~/vimwiki/personal/",
      syntax = "markdown",
      ext = ".md",
    },
    {
      path = "~/vimwiki/linuxc/",
      syntax = "markdown",
      ext = ".md",
    },
  }
  vim.g.vimwiki_listsyms = " ✗○◐✓"
end

return M
