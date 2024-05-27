local neogit = require('neogit')
neogit.setup({
    commit_editor = {
        kind = "split",
    },
    commit_view = {
        kind = "split",
        verify_commit = true
    },
    integrations = {
        telescope = true,
    }
})

vim.keymap.set("n", "<leader><S-g>o", function() neogit.open() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader><S-g>l", function() neogit.open({ "log" }) end, { desc = "Git Log" })
vim.keymap.set("n", "<leader><S-g>s", function() neogit.open({ "stash" }) end, { desc = "Git Stash" })
