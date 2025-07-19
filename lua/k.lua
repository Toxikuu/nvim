local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- QOL binds
map("n", "<C-c>", "m`ggVGy``", { desc = "Copy file" })
map("n", ";", ":", { desc = "Enter command mode" })

-- Gotos
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- Unbind navigation nuisances
map({ "i", "n", "v" }, "<s-down>", "<down>", opts)
map({ "i", "n", "v" }, "<s-up>",   "<up>",   opts)

-- Better shifting
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)

-- Move lines
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-Up>",   ":m '>-2<CR>gv=gv", opts)

-- Splits
map("n", "sv", ":vsplit<cr>", opts)
map("n", "ss", ":split<cr>",  opts)

-- Buffers
map("n", "<s-tab>", ":bp<cr>", opts)
map("n", "<tab>",   ":bn<cr>", opts)

-- Move to window using <ctrl> arrow keys
map("n", "<C-Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })
map("n", "<C-Left>",  "<C-w>h", { desc = "Go to Left Window",  remap = true })
map("n", "<C-Down>",  "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-Up>",    "<C-w>k", { desc = "Go to Upper Window", remap = true })

-- Resize window using <ctrl-shift> arrow keys
map("n", "<C-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width"  })
map("n", "<C-S-Left>",  "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width"  })
map("n", "<C-S-Down>",  "<cmd>resize -2<cr>",          { desc = "Decrease Window Height" })
map("n", "<C-S-Up>",    "<cmd>resize +2<cr>",          { desc = "Increase Window Height" })

-- "Lazy shift finger" command abbreviations
-- https://superuser.com/questions/1060424/how-can-i-permanently-map-the-vim-command-w-to-w
vim.cmd([[
  cabbrev W w
  cabbrev Q q
  cabbrev X x
  cabbrev WQ wq
  cabbrev Wq wq
  cabbrev WQA wqa
  cabbrev WQa wqa
  cabbrev Wqa wqa
  cabbrev Qa qa
]])

-- Telescope mappings
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })

