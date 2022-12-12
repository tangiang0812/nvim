local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end


--[[ dap.configurations.rust = { ]]
--[[   { ]]
--[[     name = "Launch file", ]]
--[[     type = "rt_lldb", ]]
--[[     request = "launch", ]]
--[[     program = function() ]]
--[[       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/guessing_game', 'file') ]]
--[[     end, ]]
--[[     cwd = '${workspaceFolder}', ]]
--[[     stopOnEntry = false, ]]
--[[   }, ]]
--[[ } ]]

local status_ok2, dapui = pcall(require, "dapui")
if not status_ok2 then
  return
end

dapui.setup({
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  }
})


--[[ dap.listeners.after.event_initialized["dapui_config"] = function() ]]
--[[   dapui.open {} ]]
--[[ end ]]
--[[ dap.listeners.before.event_terminated["dapui_config"] = function() ]]
--[[   dapui.close {} ]]
--[[ end ]]
--[[ dap.listeners.before.event_exited["dapui_config"] = function() ]]
--[[   dapui.close {} ]]
--[[ end ]]
