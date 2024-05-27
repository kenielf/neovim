vim.cmd [[set termguicolors]]
local dracula = require("dracula")
local custom_colors = {
    bg = "#282A37",
    fg = "#F8F8F2",
    selection = "#44475A",
    comment = "#6272A4",
    red = "#FF5555",
    orange = "#FFB86C",
    yellow = "#F1FA8C",
    green = "#50fa7b",
    purple = "#BD93F9",
    cyan = "#8BE9FD",
    pink = "#FF79C6",
    bright_red = "#FF6E6E",
    bright_green = "#69FF94",
    bright_yellow = "#FFFFA5",
    bright_blue = "#D6ACFF",
    bright_magenta = "#FF92DF",
    bright_cyan = "#A4FFFF",
    bright_white = "#FFFFFF",
    menu = "#21222C",
    visual = "#3E4452",
    gutter_fg = "#4B5263",
    nontext = "#3B4048",
    white = "#ABB2BF",
    black = "#191A21",
    lualine_bg = "#44475a"
}

dracula.setup({
    -- show the '~' characters after the end of buffers
    show_end_of_buffer = true, -- default false

    -- use transparent background
    transparent_bg = false, -- default false

    -- set custom lualine background color
    lualine_bg_color = custom_colors.lualine_bg, -- default nil

    -- set italic comment
    italic_comment = true, -- default false

    -- colors = custom_colors,
    colors = {
        bg = custom_colors.bg,
    },

    -- overrides the default highlights with table see `:h synIDattr`
    overrides = {
        -- Floating Borders
        -- FloatBorder = { fg = colors.purple, bg = colors.bg },
        -- TreeSitter Context
        -- TreesitterContext = { bg = "None" },

        -- -- NvimTree
        NvimTreeNormal = { fg = custom_colors.fg, bg = custom_colors.menu, },
        NvimTreeVertSplit = { fg = custom_colors.bg, bg = custom_colors.bg, },
        NvimTreeRootFolder = { fg = custom_colors.purple,  },
        NvimTreeGitDirty = { fg = custom_colors.orange, },
        NvimTreeGitNew = { fg = custom_colors.bright_green, },
        NvimTreeImageFile = { fg = custom_colors.pink, },
        NvimTreeFolderIcon = { fg = custom_colors.purple, },
        NvimTreeIndentMarker = { fg = custom_colors.purple, },
        NvimTreeEmptyFolderName = { fg = custom_colors.comment, },
        NvimTreeFolderName = { fg = custom_colors.fg, },
        NvimTreeSpecialFile = { fg = custom_colors.pink, underline = true, },
        NvimTreeOpenedFolderName = { fg = custom_colors.fg, },
        NvimTreeCursorLine = { bg = custom_colors.selection, },
        NvimTreeIn = { bg = custom_colors.selection, },

        -- -- Neo Tree
        NeoTreeNormal = { fg = custom_colors.fg, bg = custom_colors.menu, },
        NeoTreeNormalNC = { fg = custom_colors.fg, bg = custom_colors.menu, },
        NeoTreeTitleBar = { fg = custom_colors.fg, bg = custom_colors.menu },
        NeoTreeDirectoryName = { fg = custom_colors.fg },
        NeoTreeGitUnstaged = { fg = custom_colors.bright_magenta },
        NeoTreeGitModified = { fg = custom_colors.bright_magenta },
        NeoTreeGitUntracked = { fg = custom_colors.bright_green },
        NeoTreeDirectoryIcon = { fg = custom_colors.purple },
        NeoTreeIndentMarker = { fg = custom_colors.nontext },
        NeoTreeDotfile = { fg = custom_colors.bg },
        NeoTreeTabInactive = { bg = custom_colors.bg },
        NeoTreeTabSeparatorInactive = { fg = custom_colors.menu, bg = custom_colors.bg },
        NeoTreeTabActive = { bg = custom_colors.menu },
        NeoTreeTabSeparatorActive = { fg = custom_colors.bg, bg = custom_colors.menu },

        -- -- Bufferline
        BufferLineFill = { bg = custom_colors.black, },
        BufferLineSeparator = { fg = custom_colors.black, bg = custom_colors.menu },
        BufferLineBackground = { bg = custom_colors.menu },
        BufferLineDevIconDefault = { bg = custom_colors.menu },

        -- Selected Buffers
        BufferLineBufferSelected = { bg = custom_colors.bg },
        BufferLineIndicatorSelected = { bg = custom_colors.bg, fg = custom_colors.purple, },
        BufferLineNumbersSelected = { bg = custom_colors.bg },
        BufferLineModifiedSelected = { bg = custom_colors.bg, fg = custom_colors.yellow },
        BufferLineCloseButtonSelected = { bg = custom_colors.bg, fg = custom_colors.fg },
        BufferLineDevIconDefaultSelected = { bg = custom_colors.bg },

        -- Visible Buffers
        BufferLineBufferVisible = { bg = custom_colors.menu },
        BufferLineIndicatorVisible = { bg = custom_colors.menu },
        BufferLineNumbersVisible = { bg = custom_colors.menu },
        BufferLineModifiedVisible = { bg = custom_colors.menu, fg = custom_colors.yellow },
        BufferLineCloseButtonVisible = { bg = custom_colors.menu },

        -- Non visible buffers
        BufferLineBuffer = { bg = custom_colors.menu },
        BufferLineIndicator = { bg = custom_colors.menu },
        BufferLineNumbers = { bg = custom_colors.menu },
        BufferLineModified = { bg = custom_colors.menu, fg = custom_colors.yellow },
        BufferLineCloseButton = { bg = custom_colors.menu },
        --BufferLineDevIconLuaSelected = { bg = custom_colors.bg },

        -- Splits
        WinSeparator = { bg = custom_colors.bg, fg = custom_colors.bg },
        -- VertSplit = { bg = custom_colors.menu, fg = custom_colors.menu },
        -- StatusLine = { bg = custom_colors.bright_green },
        -- StatusLineNC = { bg = custom_colors.bright_magenta },

        -- -- Indentation
        IndentBlanklineContextStart = { sp = custom_colors.purple, underline = 1 },
        IndentBlanklineContextChar = { fg = custom_colors.purple, nocombine = 1 },

        -- Notify
        NotifyBackground = { bg = custom_colors.fg },

        -- Cursor Line
        CursorLine = { bg = custom_colors.selection },
        CursorLineNr = { bg = custom_colors.selection },
        CursorLineFold = { bg = custom_colors.selection },
        CursorLineSign = { bg = custom_colors.selection },

        -- Navic
        BarbecueNormal = { bg = custom_colors.bg, fg = custom_colors.bright_magenta },
        -- BarbecueDirname = { bg = custom_colors.bg, fg = custom_colors.bright_magenta },
        -- BarbecueBasename = { bg = custom_colors.bg, fg = custom_colors.bright_magenta },
        -- barbecue_ellipsis = { bg = custom_colors.bright_magenta },
        -- barbecue_separator = { bg = custom_colors.bright_magenta },
        -- barbecue_modified = { bg = custom_colors.bright_magenta },
        -- barbecue_context = { bg = custom_colors.bright_magenta },
    },
})

-- Set the colorscheme
vim.cmd [[ colorscheme dracula ]]
