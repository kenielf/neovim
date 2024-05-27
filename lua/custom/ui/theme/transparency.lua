local transparent = require("transparent").setup({ -- Optional, you don't have to run setup.
    groups = { -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'WinSeparator', 'Pmenu',
        -- 'SignColumn',
        -- 'CursorLine', 'CursorLineNr',
        -- 'StatusLine', 'StatusLineNC',
        -- 'EndOfBuffer',

        -- Extra
        -- "LazyNormal",
        -- "NormalFloat", "FloatBorder",
        -- "TreesitterContext",

        "TelescopeMatching", "TelescopeSelection", "TelescopePromptTitle",
        "TelescopePromptPrefix", "TelescopePromptCounter", "TelescopePromptNormal",
        "TelescopePromptBorder", "TelescopeResultsTitle", "TelescopeResultsNormal",
        "TelescopeResultsBorder", "TelescopePreviewTitle", "TelescopePreviewNormal",
        "TelescopePreviewBorder",

        "CmpItemKind", "CmpItemAbbr", "CmpItemAbbrMatch",
    },
})

-- Add Extra Group
--vim.g.transparent_groups = vim.list_extend(
--    vim.g.transparent_groups or {}, { "ExtraGroup
--)

-- Extend even farther
--vim.g.transparent_groups = vim.list_extend(
--  vim.g.transparent_groups or {},
--  vim.tbl_map(function(v)
--    return v.hl_group
--  end, vim.tbl_values(require('bufferline.config').highlights))
--)

-- vim.cmd [[ TransparentEnable ]]
-- Disable transparency by default
vim.cmd [[ TransparentDisable ]]
vim.keymap.set("n", "<leader><s-t>", "<CMD>TransparentToggle<CR>", { desc = "Toggles transparency." })
