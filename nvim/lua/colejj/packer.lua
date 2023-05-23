-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- finder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
      'junegunn/fzf.vim',
      requires = { {'junegunn/fzf'} }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {
	  'imNel/monorepo.nvim',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope.nvim'}}
  }

  -- THEMES & APPEARANCE
  -- Themes
  --  use({
  --    'frenzyexists/aquarium-vim'
  --  })
  --  use 'sam4llis/nvim-tundra'
  -- use { "catppuccin/nvim", name = "catppuccin" }
  use { "ellisonleao/gruvbox.nvim" }
  -- File Icons 
  use 'nvim-tree/nvim-web-devicons'
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  -- CODING
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  -- local windows switching
  use ('theprimeagen/harpoon')
  -- local branches and changes
  use ('mbbill/undotree')
  -- git
  use ('tpope/vim-fugitive')
  -- autopairs
  use ('jiangmiao/auto-pairs')
  -- autopairs for html
  use ('alvan/vim-closetag')
  -- null ls
  use('jose-elias-alvarez/null-ls.nvim')
  -- commenting
  use ('numToStr/Comment.nvim')

  -- LSP 
  use {
     'VonHeikemen/lsp-zero.nvim',
     branch = 'v1.x',
     requires = {
       -- LSP Support
       {'neovim/nvim-lspconfig'},             -- Required
       {                                      -- Optional
         'williamboman/mason.nvim',
         run = function()
           pcall(vim.cmd, 'MasonUpdate')
         end,
       },
       {'williamboman/mason-lspconfig.nvim'}, -- Optional

       -- Autocompletion
       {'hrsh7th/nvim-cmp'},         -- Required
       {'hrsh7th/cmp-nvim-lsp'},     -- Required
       {'hrsh7th/cmp-buffer'},       -- Optional
       {'hrsh7th/cmp-path'},         -- Optional
       {'saadparwaiz1/cmp_luasnip'}, -- Optional
       {'hrsh7th/cmp-nvim-lua'},     -- Optional

       -- Snippets
       {'L3MON4D3/LuaSnip'},             -- Required
       {'rafamadriz/friendly-snippets'}, -- Optional
     }
  }

  -- Debugger
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "nvim-telescope/telescope-dap.nvim"
end)
