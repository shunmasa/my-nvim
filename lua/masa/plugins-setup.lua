local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end


return packer.startup(function(use)
 


  use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

-- preferred colorscheme
 use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
--	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
  use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
  use("folke/tokyonight.nvim")
  use("EdenEast/nightfox.nvim")
	use("szw/vim-maximizer") -- maximizes and restores current window
	--   new lpugin --
  
	use("ghillb/cybu.nvim")
  
--move file
 -- use('kovetskiy/neovim-move')

	--which-key
	use("folke/which-key.nvim")
  --
	use("akinsho/toggleterm.nvim")
	use("akinsho/bufferline.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("goolord/alpha-nvim")
	use("moll/vim-bbye")
	-- indentline
	use("lukas-reineke/indent-blankline.nvim")
	-- esuential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vs-code like icons
	use("nvim-tree/nvim-web-devicons")
  

  --for-json-schemas
	use("b0o/schemastore.nvim")
  
	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
  use({ "nvim-telescope/telescope-file-browser.nvim" })
	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- Colorschemes
	--use("folke/tokyonight.nvim")
	use("lunarvim/darkplus.nvim")
	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion/
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	--use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use("hrsh7th/cmp-nvim-lua")
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	use("williamboman/nvim-lsp-installer")
	use("RRethy/vim-illuminate")
	-- formatting & linting/?
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- rust
	use("simrat39/rust-tools.nvim")
	use("simrat39/inlay-hints.nvim")
	use("lvimuser/lsp-inlayhints.nvim")

  use {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('crates').setup()
    end,
}
	-- Debugging
	use("mfussenegger/nvim-dap")
	use("ravenxrz/DAPInstall.nvim")
	use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")
	use("p00f/clangd_extensions.nvim") 
   

   --- Github Copilot
  use ("github/copilot.vim")

  -- history 
  use { 'm42e/lgh.nvim',
        requires = {
            "nvim-telescope/telescope.nvim",
        },
    }
  -- winbar stuff
	use("SmiteshP/nvim-navic")
	use({
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker")
		end,
	})
  use({
		"utilyre/barbecue.nvim",
		-- branch = "feature/truncation",
	})

	use("max397574/better-escape.nvim")
  use("folke/zen-mode.nvim")
  use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	})
  use({
    "christoomey/vim-tmux-navigator",
    config = function()
      require("masa.plugins.tmux").setup()
    end,
    --disable = not dvim.builtin.filetypes.tmux,
  })

   -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    config = function()
      require("masa.plugins.markdown").setup()
    end,
    --disable = not dvim.builtin.filetypes.markdown.active,
  })
  use({
    "mzlogin/vim-markdown-toc",
    --disable = not dvim.builtin.filetypes.markdown.active,
  })
  use({
    "dkarter/bullets.vim",
    --disable = not dvim.builtin.filetypes.markdown.active,
  })
--chat-gpt
   use({
  "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        -- optional configuration
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
})
  -- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

		-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	if packer_bootstrap then
		require("packer").sync()
	end
end)
