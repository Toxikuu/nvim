return {
    -- https://github.com/folke/todo-comments.nvim
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        signs = true,

        keywords = {
            FIX = {
                icon = "X",
                color = "error",
                alt = { "FIXME", "BUG", "ISSUE" },
            },
            TODO = {
                icon = "*",
                color = "info",
            },
            HACK = {
                icon = "!",
                color = "warning",
            },
            WARN = {
                icon = "!",
                color = "warning",
                alt = { "WARNING" },
            },
            PERF = {
                icon = "%",
            },
            NOTE = {
                icon = "i",
                color = "hint",
                alt = { "INFO" },
            },
            TEST = {
                icon = "T",
                color = "test",
            },
        },
    },
}
