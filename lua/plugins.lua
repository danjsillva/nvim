require("packer").startup(function()
  use { "wbthomason/packer.nvim" }
  use { "nvim-lua/plenary.nvim" }

  use { "morhetz/gruvbox" }
  use { "kyazdani42/nvim-web-devicons" }
  use { 'kyazdani42/nvim-tree.lua' }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/bufferline.nvim", tag = "v2.*" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "j-hui/fidget.nvim" }
  use { 'norcalli/nvim-colorizer.lua' }
  use { "windwp/nvim-autopairs" }
  use { "windwp/nvim-ts-autotag" }

  use { "neovim/nvim-lspconfig" }
  use { "onsails/lspkind.nvim" }

  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }
  use { 'tzachar/cmp-tabnine', run='./install.sh' }

  use { "hrsh7th/vim-vsnip" }
  use { "hrsh7th/cmp-vsnip" }

  use { "nvim-treesitter/nvim-treesitter" }
  use { "prettier/vim-prettier" }
  use { "terrortylor/nvim-comment" }
  use { "itchyny/vim-cursorword" }
  use { "MattesGroeger/vim-bookmarks" }
  use { "editorconfig/editorconfig-vim" }
  use { "rmagatti/auto-session" }

  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  use { 'lewis6991/gitsigns.nvim' }
  use { 'sindrets/diffview.nvim' }
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

require("indent_blankline").setup {
  show_current_context = true,
}

require("fidget").setup{}

require('colorizer').setup()

require("nvim-autopairs").setup()

require("nvim-ts-autotag").setup({
  filetypes = {
    "html",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "xml",
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
    { name = 'cmp_tabnine' },
    { name = "buffer" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "cmdline" },
    { name = "vsnip" },
  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
      vim_item.menu = ({
        cmp_tabnine = "[T9]",
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        path = "[Path]",
        cmdline = "[CMD]",
        vsnip = "[VSnip]",
      })[entry.source.name]
      return vim_item
    end,
  }
})

require("nvim-treesitter.configs").setup{
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "html",
    "javascript",
    "json",
    "lua",
    "scss",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },
  highlight = { enable = true },
  indent = { enable = true },
}

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

require('diffview').setup({})

require('git').setup({})

