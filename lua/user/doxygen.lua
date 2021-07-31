local M = {}

M.setup = function ()
  vim.g.DoxygenToolkit_paramTag_pre="@Param "
  vim.g.DoxygenToolkit_returnTag="@Returns   "
  vim.g.DoxygenToolkit_authorName="guanghui hu"
  vim.g.DoxygenToolkit_licenseTag="My own license"
  vim.g.DoxygenToolkit_commentType="C++"
end

return M
