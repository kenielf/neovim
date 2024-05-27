require("cord").setup({
    usercmds = true,
    timer = {
        enable = true,
        interval = 2500,
        reset_on_idle = false,
        reset_on_change = false,
    },
    editor = {
        image = nil,
        client = "neovim",
        tooltip = "How do I close this?"
    },
    display = {
        show_time = true,
        show_repository = false,
        show_cursor_position = false,
        swap_fields = false,
        workspace_blacklist = {},
    },
    lsp = {
        show_problem_count = true,
    },
    idle = {
        enable = false,
    },
    text = {
        viewing = "On {}",
        editing = "On {}",
        file_browser = "Browsing {}",
        plugin_manager = "Managing Plugins",
        lsp_manager = "Configuring LSP",
        workspace = "In {}",
    }
})

