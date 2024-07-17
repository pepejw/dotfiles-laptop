-- LAZY.NVIM SETUP
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
vim.g.mapleader = " "
-- plugin setup
require("lazy").setup({
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000,

  "nvim-lua/plenary.nvim",

  "nvim-telescope/telescope.nvim",
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },

  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  "ggandor/leap.nvim",

  "norcalli/nvim-colorizer.lua",

  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {},

  "lewis6991/gitsigns.nvim",

  'akinsho/toggleterm.nvim',
  version = "*",
  config = true,

  "jinh0/eyeliner.nvim",

  "kkharji/sqlite.lua",

  "danielfalk/smart-open.nvim",
  branch = "0.2.x",
  config = function()
    require("telescope").load_extension("smart_open")
  end,
  dependencies = {
    "kkharji/sqlite.lua",
  },

  "ray-x/guihua.lua",

  "neovim/nvim-lspconfig",

  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()
  end,
  event = { "CmdlineEnter" },
  ft = { "go", 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries

  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }
})


vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
vim.opt.termguicolors = true
require("telescope").setup()
require('leap').create_default_mappings()
require("colorizer").setup()
require("everforest").load()
require("lualine").setup {
  options = { theme = "everforest" }
}
