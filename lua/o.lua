local o = vim.opt

-- Colors
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("highlight StatusLine   guibg=NONE")
        vim.cmd("highlight StatusLineNC guibg=NONE")
    end,
})

-- Line numbers
o.number = false
o.relativenumber = false
o.fillchars:append({ eob = "." })

-- Misc
o.mouse = "a"
o.clipboard = "unnamedplus"
o.termguicolors = true
o.cmdheight = 0
o.statusline = "%= %l,%c %m"

-- Tabs
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.smartindent = true

-- Invisibles
o.list = true
o.listchars = {
    tab = "> ",
    trail = "-",
}

-- View
o.textwidth = 80
o.scrolloff = 2

-- History
o.undolevels = 5000
o.history = 500
o.undofile = true
o.undodir = vim.fn.expand("~/.local/cache/nvim/undo")

-- Autocommand for Typst
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function()
        o.expandtab = true
        o.shiftwidth = 4
        o.tabstop = 4
        o.smartindent = true
    end,
})
