require('hlslens').setup()

-- Set incremental search
vim.opt.incsearch = true

-- Common options
local kopts = { noremap = true, silent = true }

-- Next and Previous
vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)

-- Clear
vim.api.nvim_set_keymap('n', '<Leader>C', '<Cmd>noh<CR>', kopts)

