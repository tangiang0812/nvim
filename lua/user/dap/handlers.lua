M = {}

local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

local status_ok2, dapui = pcall(require, "dapui")
if not status_ok2 then
  return
end

M.setup = function()
  dapui.setup({
    layouts = {
      {
        elements = {
          -- Elements can be strings or table with id and size keys.
          "scopes",
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
    },
    controls = {
      -- Requires Neovim nightly (or 0.8 when released)
      enabled = false,
      -- Display controls in this element
    },
  })

  dap.defaults.fallback.external_terminal = {
    command = '/usr/bin/alacritty';
    args = { '-e' };
  }

  dap.defaults.fallback.focus_terminal = true

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

--[[ local status_ok3, rt = pcall(require, "rust-tools") ]]
--[[ if not status_ok3 then ]]
--[[   return ]]
--[[ end ]]

M.on_attach = function(_, bufnr)
  --[[ local opts = { noremap = true, silent = true } ]]
  -- Hover actions
  --[[ vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr }) ]]
  -- Code action groups
  --[[ vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr }) ]]

  --[[ vim.api.nvim_set_keymap("n", '<leader>dk', "<cmd>RustDebuggables<cr>", opts) ]]
  vim.keymap.set("n", '<leader>dk', function() dap.continue() end)
  vim.keymap.set("n", '<leader>dt', function() dap.terminate() end)

  --[[ vim.keymap.set("n", '<leader>dl', function() dap.disconnect() dap.run_last() end) ]]
  vim.keymap.set("n", '<leader>dl', function() dap.run_last() end)
  -- this will cause problems, use the line above as temporary solution

  vim.keymap.set("n", '<leader>db', function() dap.toggle_breakpoint() end)
  --[[ vim.keymap.set("n", '<leader>du', function() dapui.toggle({ reset = true }) end) ]]
  vim.keymap.set("n", '<leader>du', function() dapui.toggle() end)

end


M.dap = {
  --[[ adapter = require('rust-tools.dap').get_codelldb_adapter( ]]
  --[[   codelldb_path, liblldb_path), ]]

  --[[ adapter = dap.adapters.codelldb ]]
}

return M
