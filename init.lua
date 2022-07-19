require("plugins")

vim.g.mapleader = " "

vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

vim.o.compatible = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.showmatch = true
vim.o.signcolumn = 'yes:1'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 4

vim.o.mouse = "a"
vim.o.clipboard = 'unnamedplus'

vim.o.swapfile = false
vim.o.hidden = true
vim.o.lazyredraw = true

-- Mapping

vim.api.nvim_set_keymap("n", "<Leader>dw", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>dd", "<cmd>lua vim.lsp.buf.implementation()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>dr", "<cmd>lua vim.lsp.buf.rename()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>da", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fb",
  ":Telescope file_browser<CR>",
  { noremap = true }
)
