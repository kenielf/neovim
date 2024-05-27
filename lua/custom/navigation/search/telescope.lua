--local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.setup({
    extensions = {
        project = {
            base_dirs = {
                '~/Projects',
                '~/.scripts',
            },
            hidden_files = true, -- default: false
        }
    },
})

require('telescope').load_extension('project')
require('telescope').load_extension('luasnip')

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffer" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
vim.keymap.set("n", "<leader>fp", "<CMD>Telescope project<CR>", { desc = "Find Projects" })

--- LSP ---
vim.keymap.set("n", "<leader>fd", "<CMD>Telescope diagnostics<CR>", { desc = "Find diagnostics" })

--- Git ---
vim.keymap.set("n", "<leader>fGb", "<CMD>Telescope git_branches<CR>", { desc = "List Branches" })
vim.keymap.set("n", "<leader>fGc", "<CMD>Telescope git_bcommits<CR>", { desc = "List Branch Commits" })
vim.keymap.set("n", "<leader>fGC", "<CMD>Telescope git_commits<CR>", { desc = "List All Commits" })
vim.keymap.set("n", "<leader>fGs", "<CMD>Telescope git_stash<CR>", { desc = "" })
