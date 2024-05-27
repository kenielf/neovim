local M = {}
-- Start Module

-- Get all buffers
M.list_active_bufs = function()
    local buffers = vim.api.nvim_list_bufs()
    local active_buffers = {}
    for k, buf in pairs(buffers) do
        if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, 'buflisted') then
            table.insert(active_buffers, buf)
        end
    end

    return active_buffers
end

-- Smartly delete buffers
M.smart_bufdelete = function()
    local active_buffers = M.list_active_bufs()

    if #active_buffers <= 1 then
        local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
        if not (string.len(bufname) < 1) then
            vim.cmd [[ silent! enew | bd# ]]
        end
    else
        vim.cmd [[ silent! bp | bd# ]]
    end
end

-- End module
return M
