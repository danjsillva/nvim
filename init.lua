-- Config
vim.g.mapleader = " "

vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")
vim.cmd("highlight! link SignColumn LineNr")
vim.cmd("highlight! link GitSignsAdd LineNr")
vim.cmd("highlight! link GitSignsChange LineNr")
vim.cmd("highlight! link GitSignsDelete LineNr")

vim.o.compatible = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = "yes:1"

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmatch = true

vim.o.tabstop = 2                 -- amount of screen space a Tab character can occupy
vim.o.shiftwidth = 2              -- number of characters that will be used to indent a line
vim.o.expandtab = true            -- controls whether or not to turn a Tab character into spaces

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 4

vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"

vim.o.swapfile = false
vim.o.hidden = true
vim.o.lazyredraw = true

require("plugins")

vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "", numhl ="DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl ="DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "", numhl ="DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "", numhl ="DiagnosticSignError" })

vim.diagnostic.config({
  signs = true,
  underline = false,
  virtual_text = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 500
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })]]
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.hover(nil, { focus = false })]]

-- Mapping
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { noremap = true })
vim.keymap.set("n", "<F12>", ":so %<CR>:PackerSync<CR>", { noremap = true })

vim.keymap.set("n", "<C-s>", ":Prettier<CR>:w<CR>", { noremap = true })
vim.keymap.set("n", "<C-q>", ":q<CR>", { noremap = true })
vim.keymap.set("n", "<C-f>", "*N", { noremap = true })

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true })

vim.keymap.set("n", "<C-=>", "<Cmd>BufferLineMoveNext<CR>", { noremap = true })
vim.keymap.set("n", "<C-->", "<Cmd>BufferLineMovePrev<CR>", { noremap = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })

vim.keymap.set("n", "x", '"_x', { noremap = true })

vim.keymap.set("n", "<Leader>qq", ":bd<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>ww", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<Leader>wq", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<Leader>we", ":vsplit<CR><C-w>w:b#<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>=", ":Prettier<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>bb", ":NvimTreeFindFileToggle<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>bv", ":NvimTreeFindFile<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>bc", ":NvimTreeCollapse<CR>gg", { noremap = true })
vim.keymap.set("n", "<Leader>bn", "<cmd>lua nvim-tree.api.fs.copy.filename<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>uu", ":UndotreeToggle<CR>:UndotreeFocus<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>dw", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>de", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>da", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>dd", "<cmd>lua vim.diagnostic.open_float({ width = 80 })<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>ds", ":Telescope diagnostics<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>pp", ":Telescope find_files<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>po", ":Telescope oldfiles<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>fd", ":vsplit<CR> :Telescope lsp_implementations<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fs", ":vsplit<CR> :Telescope lsp_definitions<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fe", ":Telescope lsp_references<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fw", ":Telescope lsp_document_symbols<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>ff", ":Telescope current_buffer_fuzzy_find<CR>", { noremap = true })
vim.keymap.set("v", "<Leader>ff", "y :Telescope current_buffer_fuzzy_find default_text=<C-R>+<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep<CR>", { noremap = true })
vim.keymap.set("v", "<Leader>fg", "y :Telescope live_grep default_text=<C-R>+<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fr", ":Telescope resume<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fh", ":Telescope search_history<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>gg", ":DiffviewOpen<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gf", ":DiffviewFileHistory<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gq", ":DiffviewClose<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>gp", ":!git pull<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gP", ":!git push origin HEAD<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>gh", ":Gitsigns stage_hunk<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gH", ":Gitsigns undo_stage_hunk<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gb", ":Gitsigns stage_buffer<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gd", ":Gitsigns diffthis<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>ss", "<cmd>lua require('spectre').open_visual()<CR>", { noremap = true })
vim.keymap.set("v", "<Leader>ss", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", { noremap = true })

