return {
    "RRethy/base16-nvim",
    config = function()
        local theme = require("t.monoxrom")
        require("base16-colorscheme").setup(theme)

        require("base16-colorscheme").with_config({
            telescope = true,
            indentblankline = true,
            notify = false,
        })
    end,
}
