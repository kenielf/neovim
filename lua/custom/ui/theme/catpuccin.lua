vim.cmd [[set termguicolors]]
local ucolors = require("catppuccin.utils.colors")
local mocha = require("catppuccin.palettes").get_palette("mocha")
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    -- background = { -- :h background
    --     light = "latte",
    --     dark = "mocha",
    -- },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "italic" },
        properties = { "italic" },
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        neogit = true,
        lsp_trouble = true,
        gitsigns = true,
        nvimtree = true,
        neotree = true,
        navic = {
            enabled = false,
            custom_bg = "NONE"
        },
        treesitter = true,
        treesitter_context = true,
        illuminate = {
            enabled = true,
            lsp = false,
        },
        mason = true,
        flash = true,
        noice = true,
        which_key = true,
        telescope = true,
        notify = true,
        indent_blankline = {
            enabled = true,
            scope_color = mocha.blue,
        },
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        native_lsp = {
            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                warnings = { "undercurl" },
                information = { "undercurl" },1
            },
            inlay_hints = {
                background = false,
            },
        }
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
