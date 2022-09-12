require("packer").startup(function()
  use { "wbthomason/packer.nvim" }

  use { "morhetz/gruvbox" }
  use { "kyazdani42/nvim-web-devicons" }
  use { 'kyazdani42/nvim-tree.lua' }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/bufferline.nvim", tag = "v2.*" }

  use { "neovim/nvim-lspconfig" }
  use { "onsails/lspkind.nvim" }

  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }

  use { "hrsh7th/vim-vsnip" }
  use { "hrsh7th/cmp-vsnip" }

  use { "nvim-treesitter/nvim-treesitter" }
  use { "prettier/vim-prettier" }
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

  use { 'lewis6991/gitsigns.nvim' }
  use { 'dinhhuy258/git.nvim' }
end)

require("nvim-tree").setup({
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    -- icons = {
    --   hint = "",
    --   info = "",
    --   warning = "",
    --   error = "",
    -- },
  },
})

require("lualine").setup({
  options = {
    section_separators = { left = '', right = ''},
    component_separators = { left = 'ﱤ', right = 'ﱣ'},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {'diagnostics'},
    lualine_y = {'filetype'},
    lualine_z = {'progress', 'location'}
  },
})

require("bufferline").setup({
  options = {
    mode = "buffers",
    separator_style = "thin",
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = true,
    show_close_icon = false,
  },
})

require("lspconfig").tsserver.setup{}

require("cmp").setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-Space>"] = require("cmp").mapping.complete(),
    ["<C-e>"] = require("cmp").mapping.close(),
    ["<Esc>"] = require("cmp").mapping.close(),
    ["<CR>"] = require("cmp").mapping.confirm {
      behavior = require("cmp").ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = function(fallback)
      if require("cmp").visible() then
        require("cmp").select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
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
  }),
  formatting = {
    format = require("lspkind").cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
    })
  }
})

require("nvim-treesitter.configs").setup{}

require("nvim_comment").setup()

require("auto-session").setup()

require("telescope").setup({
  extensions = {
    file_browser = {
      hijack_netrw = true,
    },
  }
})

require("telescope").load_extension("file_browser")

require('gitsigns').setup({
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%d/%m/%Y> - <summary>',
})

require('git').setup()
