require("which-key").setup()

vim.keymap.set("n", "<leader>?", "<CMD>WhichKey<CR>", {desc = "Shows Keymaps"})
