require("packer").startup(function()
  -- Packer can manage itself
  use { "wbthomason/packer.nvim" }

  use { "ellisonleao/gruvbox.nvim" }
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" }
  }
  use {
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = { "kyazdani42/nvim-web-devicons" }
  }

  use { "neovim/nvim-lspconfig" }

  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }

  use { "hrsh7th/vim-vsnip" }
  use { "hrsh7th/cmp-vsnip" }

  use { "nvim-treesitter/nvim-treesitter" }

  use { "terrortylor/nvim-comment" }

  use { "itchyny/vim-cursorword" }

  use { "MattesGroeger/vim-bookmarks" }

  use { "editorconfig/editorconfig-vim" }

  use { "rmagatti/auto-session" }

  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }

  use { "nvim-telescope/telescope-file-browser.nvim" }
end)

require("gruvbox").setup()

require('lualine').setup()

require("bufferline").setup{}

require("lspconfig").tsserver.setup{}

require("cmp").setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-Space>'] = require("cmp").mapping.complete(),
    ['<C-e>'] = require("cmp").mapping.close(),
    ['<CR>'] = require("cmp").mapping.confirm {
      behavior = require("cmp").ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if require("cmp").visible() then
        require("cmp").select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if require("cmp").visible() then
        require("cmp").select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = require("cmp").config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "cmdline" },
    { name = "vsnip" },
  })
})

require("nvim-treesitter.configs").setup{}

require('nvim_comment').setup()

require('auto-session').setup()

require("telescope").setup({
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  }
})
