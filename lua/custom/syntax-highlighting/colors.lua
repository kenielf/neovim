--require("colorizer").setup({
--    nil, {names = false, mode='foreground' }
--})
require("colorizer").setup({
    buftypes = {
        "*",
        -- exclude prompt and popup buftypes from highlight
        "!prompt",
        "!popup",
    },
    user_default_options = { RGB = false, names = false, mode = 'foreground' }
})
