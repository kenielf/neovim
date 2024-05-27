-- Setup with custom options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    auto_reload_on_write = true,
	respect_buf_cwd = true,
    prefer_startup_root = false,
    hijack_unnamed_buffer_when_opening = true,
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    view = {
        adaptive_size = false,
        side = "left",
        width = 35,
        preserve_window_proportions = true,
    },
    renderer = {
        group_empty = true,
        root_folder_label = false,
        highlight_git = false,
        highlight_opened_files = "none",
        add_trailing = true,

        indent_markers = {
            enable = true,
        },

        icons = {
            padding = "  ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },

            glyphs = {
                default = "󰈚",
                symlink = "",
                folder = {
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                    symlink_open = "",
                    arrow_open = "",
                    arrow_closed = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    filters = {
        dotfiles = true,
    },
    git = {
        enable = true,
        ignore = true,
    },
    filesystem_watchers = {
        enable = true,
    },
    actions = {
        open_file = {
            resize_window = true,
        },
    },
})

-- Binds
vim.keymap.set('n', '<M-1>', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true, })

-- Autoopen
local function open_nvim_tree(data)
    -- Check if the opened buffer is a file or a directory
    local is_file = vim.fn.filereadable(data.file) == 1

    -- Check if the opened buffer is a directory
    local is_directory= vim.fn.isdirectory(data.file) == 1

    if not is_file and not is_directory then
        return
    else
        if is_directory then
            --vim.cmd.bw(data.buf)
            vim.cmd.cd(data.file)
        end

        -- Open the tree
        require("nvim-tree.api").tree.toggle({update_root=true, focus=false})
    end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

--Autoclose by @marvinth01
vim.api.nvim_create_autocmd("QuitPre", {
    callback = function()
        local tree_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match("NvimTree_") ~= nil then
                table.insert(tree_wins, w)
            end
            if vim.api.nvim_win_get_config(w).relative ~= '' then
                table.insert(floating_wins, w)
            end
        end
        if 1 == #wins - #floating_wins - #tree_wins then
            -- Should quit, so we close all invalid windows.
            for _, w in ipairs(tree_wins) do
                vim.api.nvim_win_close(w, true)
            end
        end
    end
})

