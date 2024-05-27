local ignore_common = {
    "NvimTree",
    "neo-tree", "neo-tree-popup",
    "notify", "help"
}

require("lualine").setup({
    options = {
        globalstatus = true,
        always_divide_middle = true,
        --section_separators = '', --component_separators = '',
        -- theme = "",
        disabled_filetypes = {
            tabline = ignore_common
            --winbar = { "neo-tree", "neo-tree-popup", "notify"},
        },
        ignore_focus = ignore_common,
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"filename"},
        lualine_c = {"branch", "diff", "diagnostics"},
        lualine_x = {"filetype"},
        --lualine_y = { {"fileformat", padding = { left = 0, right = 2 } }, "encoding" },
        lualine_y = {
            {
                "fileformat",
                --padding = { left = 1, right = 2 }
                symbols = {
                    unix = 'LF',
                    dos = 'CRLF',
                    mac = 'CR',
                }
            },
            "encoding",
        },
        lualine_z = {"location"},
        --lualine_a = {'mode'},
        --lualine_b = {'branch', 'diff', 'diagnostics'},
        --lualine_c = {'filename', navic},
        --lualine_x = {'encoding', 'fileformat', 'filetype'},
        --lualine_y = {'progress'},
        --lualine_z = {'location'}
    },
    -- tabline = {
    --     lualine_a = { "buffers" },
    --     lualine_x = {},
    --     lualine_y = {},
    --     lualine_z = { "tabs" },
    -- },
})

