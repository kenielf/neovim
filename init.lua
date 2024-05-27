--- Custom Config by: Kenielf (https://github.com/kenielf) ---
--- Basic Configuration ---
-- Enable loader
vim.loader.enable()

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable hidden windows
vim.g.hidden = 1

-- Number sidebar
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable swapfile
vim.opt.swapfile = false

-- Lines
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"

-- Mouse
vim.opt.mouse = "a"

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.tabstop = 4        -- number of columns occupied by a tab
vim.opt.softtabstop = 4    -- tabstops as spaces
vim.opt.expandtab = true   -- converts tabs to white space
vim.opt.shiftwidth = 4     -- width for autoindents
vim.opt.autoindent = true  -- enable autoindent

--- Basic Keybinds ---
-- Leader Key
vim.g.mapleader = " "

-- Quick quit
vim.keymap.set("n", '<leader><s-q>', "<CMD>qa!<CR>", {silent = true})

-- Quick write
vim.keymap.set("n", "<leader><s-w>", "<CMD>w<CR>", {silent = true})

-- Quick delete
local delete = require("custom.extras.buffer-utils").smart_bufdelete
vim.keymap.set("n", "<leader><s-d>", delete, {silent = true})

--- Extended Configuration ---
local tty_env = os.getenv("DISPLAY")
if tty_env == nil or tty_env == "" then
    print("Minimal Configuration")
    --require("minimal.config")
else
    --vim.o.background = "light"
    --vim.opt.termguicolors = true
    require("custom.config")
end

