-- python
lvim.lang.python.formatters = {
  {
    exe = "yapf",
  },
}

if lvim.builtin.dap.active then
  local dap_install = require "dap-install"
  dap_install.config("python_dbg", {})
end
