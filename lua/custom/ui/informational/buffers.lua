local bufferline = require('bufferline')
bufferline.setup({
    options = {
        --style_preset = bufferline.style_preset.default,
        -- highlights = require("catpuccin.groups.integrations.bufferline").get(),
        themable = true,
        mode = "buffers",                    -- set to "tabs" to only show tabpages instead
        numbers = "ordinal",
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        indicator = {
            icon = '>',                      -- this should be omitted if indicator style is not 'icon'
            style = 'icon',
        },
        buffer_close_icon = 'X',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true,  -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = "nvim-lsp",
        --diagnostics_update_in_insert = false,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        color_icons = true,              -- whether or not to add the filetype icon highlights
        -- get_element_icon = function(element)
        --     -- element consists of {filetype: string, path: string, extension: string, directory: string}
        --     -- This can be used to change how bufferline fetches the icon
        --     -- for an element e.g. a buffer or a tab.
        --     -- e.g.
        --     local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
        --     print(icon, hl)
        --     return icon, hl
        -- end,
        -- show_buffer_icons = true,        -- disable filetype icons for buffers
        show_buffer_icons = false,        -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        -- show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
        persist_buffer_sort = true,   -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thick",
        padding = 2,
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' }
        },
        -- sort_by = 'tabs',
        -- offset
        offsets = {
           {
                filetype = "neo-tree",
                text = "File Explorer",
                text_align = "left",
                highlight = "BufferLineFill",
                separator = false,
                padding = 0,
           },
           {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                highlight = "BufferLineFill",
                separator = false,
                padding = 1,
            }
        },
    }
})

-- Transparency Support

-- Binds
vim.keymap.set("n", "<C-Left>", "<Cmd>:bp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "<Cmd>:bn<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-Up>", "<Cmd>:bp|bd #<CR>", { noremap = true, silent = true })
local delete = require("custom.extras.buffer-utils").smart_bufdelete
vim.keymap.set("n", "<C-Up>", delete, { noremap = true, silent = true })

