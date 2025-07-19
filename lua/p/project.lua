return {
    -- https://github.com/Zeioth/project.nvim
    "Zeioth/project.nvim",
    lazy = false,
    config = function()
        require("project_nvim").setup {
            manual_mode = false,
            silent_chdir = true,

            detection_methods = { "lsp", "pattern" },
            patterns = {
                ".git",
                "configure",
                "Makefile",
                "meson_options.txt",
                "Cargo.toml",
            },

            show_hidden = false, -- otherwise, shows .git and that's gross
            scope_chdir = "global",
        }

        -- allows you to tab-complete :Telescope projects
        require("telescope").load_extension("projects")

        -- HACK: force cwd change on startup (mitigates lazy (or more likely me)
        -- being dumb)
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                local ok, project = pcall(require, "project_nvim.project")
                if ok then
                    local root = project.get_project_root()
                    if root then
                        vim.cmd("cd " .. root)
                    end
                end
            end
        })
    end
}
