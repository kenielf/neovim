require("toggleterm").setup({
    direction = 'float',
    float_opts = {
        border = 'curved'
    }
})

vim.keymap.set({"n", "i", "t"}, "<C-t>", "<CMD>ToggleTerm<CR>", { noremap = true })
