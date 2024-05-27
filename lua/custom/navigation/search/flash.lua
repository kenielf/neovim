local flash = require("flash")
flash.setup({
    mode = "fuzzy",
    incremental = true,
    exclude = {
        "notify",
        "cmp_menu",
        "noice",
        "flash_prompt",
        function(win)
            -- exclude non-focusable windows
            return not vim.api.nvim_win_get_config(win).focusable
        end,
    },
})

vim.keymap.set({ "n", "x", "o" }, "<leader>s", function() flash.jump() end, {desc = "Flash"})
vim.keymap.set({ "n", "x", "o" }, "<leader><S-s>", function() flash.treesitter() end, {desc = "Flash Treesitter"})
vim.keymap.set("o", "<leader>r", function() flash.remote() end, {desc = "Remote Flash"})
vim.keymap.set({"o", "x"}, "<leader><S-r>", function() flash.treesitter_search() end, {desc = "Treesitter Search"})
vim.keymap.set("c", "<C-s>", function() flash.toggle() end, {desc = "Toggle Flash Search"})
