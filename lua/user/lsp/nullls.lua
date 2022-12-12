local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local on_attach = require("user.lsp.handlers").on_attach

null_ls.setup({
  debug = false,
  sources = {
    --[[ null_ls.builtins.formatting.stylua, ]]
    --[[ null_ls.builtins.formatting.prettier, ]]
    null_ls.builtins.formatting.prettierd,
    --[[ null_ls.builtins.diagnostics.mypy, ]]
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.flake8.with({ extra_args = { "--max-line-length", "160", "--ignore=H403" } }),
    --[[ null_ls.builtins.diagnostics.djlint, ]]
    null_ls.builtins.formatting.djlint.with({ extra_args = { "--indent", "2"} }),
  },
  on_attach = on_attach
})
