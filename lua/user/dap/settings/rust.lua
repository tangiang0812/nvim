local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

--[[ local status_ok2, dapui = pcall(require, "dapui") ]]
--[[ if not status_ok2 then ]]
--[[   return ]]
--[[ end ]]

--[[ local status_ok3, rt = pcall(require, "rust-tools") ]]
--[[ if not status_ok3 then ]]
--[[   return ]]
--[[ end ]]

-- Update this path
--[[ local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/' ]]
--[[ local codelldb_path = extension_path .. 'adapter/codelldb' ]]
--[[ local liblldb_path = extension_path .. 'lldb/lib/liblldb.so' ]]

dap.adapters.codelldb = {
  type = 'server',
  host = '127.0.0.1',
  port = 13000, -- 💀 Use the port printed out or specified with `--port`
  -- User codelldb with any kin
  --[[ type = 'server', ]]
  --[[ port = "${port}", ]]
  --[[ id = "rdb", ]]
  --[[ executable = { ]]
  --[[   command = 'codelldb', ]]
  --[[   args = { "--port", "${port}" }, ]]
  --[[   detached = true, ]]
  --[[ }, ]]
}

dap.configurations.rust = {
  {
    -- The first three options are required by nvim-dap
    type = "codelldb",
    request = "launch",
    name = "Launch file",

    -- Options below are for CodeLLDB
    cwd = "${workspaceFolder}",
    program = function()
      local workspaceRoot = require("lspconfig").rust_analyzer.get_root_dir()
      local workspaceName = vim.fn.fnamemodify(workspaceRoot, ":t")

      return vim.fn.input("Path to executable: ", workspaceRoot .. "/target/debug/" .. workspaceName, "file")
    end,
    stopOnEntry = false,
    sourceLanguages = { "rust" },
  },
}

