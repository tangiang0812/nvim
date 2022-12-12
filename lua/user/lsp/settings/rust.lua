-- Update this path
local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local opts = {
  adapter = require('rust-tools.dap').get_codelldb_adapter(
    codelldb_path, liblldb_path),

}

return opts
