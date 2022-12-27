require("packer").startup(function()
  use { "wbthomason/packer.nvim" }
  use { "nvim-lua/plenary.nvim" }

  use { "morhetz/gruvbox" }
  use { "nvim-tree/nvim-web-devicons" }
  use { "nvim-tree/nvim-tree.lua" }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/bufferline.nvim", tag = "v2.*" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "norcalli/nvim-colorizer.lua" }

  use { "tpope/vim-surround" }
  use { "windwp/nvim-autopairs" }
  use { "windwp/nvim-ts-autotag" }
  use { "windwp/nvim-spectre" }

  use { "neovim/nvim-lspconfig" }
  use { "onsails/lspkind.nvim" }

  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }

  use { "nvim-treesitter/nvim-treesitter" }
  use { "prettier/vim-prettier" }
  use { "terrortylor/nvim-comment" }
  use { "itchyny/vim-cursorword" }
  use { "MattesGroeger/vim-bookmarks" }
  use { "editorconfig/editorconfig-vim" }
  use { "rmagatti/auto-session" }

  use { "nvim-telescope/telescope.nvim" }

  use { "lewis6991/gitsigns.nvim" }
  use { "sindrets/diffview.nvim" }
  use { "mbbill/undotree" }
end)

require("nvim-tree").setup({
  renderer = {
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = true
      }
    }
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
})

require("lualine").setup({
  options = {
    section_separators = { left = "", right = ""},
    component_separators = { left = "ﱤ", right = "ﱣ"},
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff"},
    lualine_c = {"filename"},
    lualine_x = {"diagnostics"},
    lualine_y = {"filetype"},
    lualine_z = {"progress", "location"}
  },
})

require("bufferline").setup({
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text="File Explorer",
        separator= true,
        text_align = "left"
      }
    },
    mode = "buffers",
    separator_style = "thin",
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = true,
    show_close_icon = false,
    indicator = {
      style = 'none'
    },
    tab_size = 24,
    diagnostics = "nvim_lsp",
    custom_areas = {
      right = function()
        local result = {}
        
        return result
      end,
    }

  },
  highlights = {
    buffer_selected = { italic = false },
    offset_separator = {
      fg = red,
      bg = green,
    },

  },
})

require("indent_blankline").setup {
  show_current_context = true,
}

require("colorizer").setup()

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

require("spectre").setup()

require("lspconfig").tsserver.setup{}

require("cmp").setup({
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
  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        path = "[Path]",
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

require("gitsigns").setup({
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = "<author>, <author_time:%d/%m/%Y> - <summary>",
})

require("diffview").setup({})

