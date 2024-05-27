--- Custom Keybinds ---
-- Toggle file as executable
local function is_executable(file)
    local type = vim.fn.getftype(file)

    if file ~= nil and type == "file" then
        local permissions = vim.fn.getfperm(file)
        if permissions ~= nil then
            if string.match(permissions, "x", 3) then
                return true
            end
        end
    end
end

local function toggle_executable()
    local file = vim.fn.expand("%:p")
    if is_executable(file) then
        vim.cmd [[ silent !chmod -x % ]]  -- is executable
    else
        vim.cmd [[ silent !chmod +x % ]]  -- is not executable
    end
end

vim.keymap.set("n", "<leader><S-x>", function() toggle_executable() end,
    {desc="Toggles the file's executable flag.", silent=true})

