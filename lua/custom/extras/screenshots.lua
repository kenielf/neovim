local mocha = require("catppuccin.palettes").get_palette("mocha")
local flavour = require("catppuccin").flavour

require("silicon").setup({
    font = "0xProto=24;Noto Color Emoji=24",
    theme = "Catppuccin-" .. flavour,
    background = mocha.crust,
    background_image = nil,
    shadow_color = nil,
    shadow_blur_radius = 0,
    pad_horiz = 40,
    pad_vert = 40,
    no_round_corner = true,
    no_window_controls = true,
    no_line_number = false,
    to_clipboard = true,
    -- window_title = function ()
    --     return vim.fn.fnamemodify(
    --         vim.api.nvim_buf_get_name(
    --             vim.api.nvim_get_current_buf()
    --         ),
    --         ":t"
    --     )
    -- end
})

local visual_silicon = function()
    -- Get positions and define the start and end of the selection
    local positions = { vim.fn.getpos('v')[2], vim.fn.getpos('.')[2] }
    local l_start = vim.fn.min(positions)
    local l_end = vim.fn.max(positions)

    -- Take a screenshot
    vim.cmd(l_start .. "," .. l_end .. "Silicon")
end


vim.keymap.set(
    "n", "<leader>sc", "<CMD>Silicon<CR>",
    { desc = "Take a screenshot of the entire file" }
)

vim.keymap.set(
    "v", "<leader>sc", visual_silicon,
    { desc = "Take a screenshot of the selected code" }
)
