local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--Remap space as leader key
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

-- Install your plugins here
lazy.setup({
  -- My plugins here

  "wbthomason/packer.nvim", -- Have packer manage itself
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  "numToStr/Comment.nvim",
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  "windwp/nvim-ts-autotag",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "kyazdani42/nvim-web-devicons",

  -- Rust
  "simrat39/rust-tools.nvim",

  -- Colorschemes
  -- "marko-cerovac/material.nvim",
  "folke/tokyonight.nvim",

  -- Lualine
  "nvim-lualine/lualine.nvim",

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- path completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  --[[ "hrsh7th/cmp-nvim-lsp", commit = "f93a6cf9761b096ff2c28a4f0defe941a6ffffb5", ]]
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  {
    "akinsho/toggleterm.nvim",
    --[[ tag = "v2.*", ]]
  },

  -- NVimtree
  {
    "kyazdani42/nvim-tree.lua",
    tag = "nightly" -- optional, updated every week. (see issue #1193)
  },

  -- Debug
  {
    "mfussenegger/nvim-dap",
    --[[ tag = "0.3.*", ]]
  },
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim", -- simple to use language server installer
  "williamboman/mason-lspconfig.nvim", -- kind of connect mason and lspconfig
  "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
  },

  -- Telescope
  "nvim-telescope/telescope.nvim",
  {
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    --[[ build = "make" ]]

  },

  -- Git
  "lewis6991/gitsigns.nvim",

  -- Dashboard
  "glepnir/dashboard-nvim",

  -- Tabline
  --[[ use { ]]
  --[[ 	"akinsho/bufferline.nvim", ]]
  --[[ 	tag = "v2.*", ]]
  --[[ 	requires = "kyazdani42/nvim-web-devicons" ]]
  --[[ } ]]

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
},
{
  ui = {
    border = "rounded",
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "鈴 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
  }
})
