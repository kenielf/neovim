-- From: https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#emulating-vims-fold-commands
local renderer = require ("neo-tree.ui.renderer")

local M = {}
-- Expand a node and load filesystem info if needed.
M.open_dir = function(state, dir_node)
    local fs = require "neo-tree.sources.filesystem"
    fs.toggle_directory(state, dir_node, nil, true, false)
end

-- Expand a node and all its children, optionally stopping at max_depth.
M.recursive_open = function(state, node, max_depth)
    local max_depth_reached = 1
    local stack = { node }
    while next(stack) ~= nil do
        node = table.remove(stack)
        if node.type == "directory" and not node:is_expanded() then
            M.open_dir(state, node)
        end

        local depth = node:get_depth()
        max_depth_reached = math.max(depth, max_depth_reached)

        if not max_depth or depth < max_depth - 1 then
            local children = state.tree:get_nodes(node:get_id())
            for _, v in ipairs(children) do
                table.insert(stack, v)
            end
        end
    end

    return max_depth_reached
end

--- Open the fold under the cursor, recursing if count is given.
M.neotree_zo = function(state, open_all)
    local node = state.tree:get_node()

    if open_all then
        M.recursive_open(state, node)
    else
        M.recursive_open(state, node, node:get_depth() + vim.v.count1)
    end

    renderer.redraw(state)
end

--- Recursively open the current folder and all folders it contains.
M.neotree_zO = function(state)
    M.neotree_zo(state, true)
end

-- The nodes inside the root folder are depth 2.
local MIN_DEPTH = 2

--- Close the node and its parents, optionally stopping at max_depth.
M.recursive_close = function(state, node, max_depth)
    if max_depth == nil or max_depth <= MIN_DEPTH then
        max_depth = MIN_DEPTH
    end

    local last = node
    while node and node:get_depth() >= max_depth do
        if node:has_children() and node:is_expanded() then
            node:collapse()
        end
        last = node
        node = state.tree:get_node(node:get_parent_id())
    end

    return last
end

--- Close a folder, or a number of folders equal to count.
M.neotree_zc = function(state, close_all)
    local node = state.tree:get_node()
    if not node then
        return
    end

    local max_depth
    if not close_all then
        max_depth = node:get_depth() - vim.v.count1
        if node:has_children() and node:is_expanded() then
            max_depth = max_depth + 1
        end
    end

    local last = M.recursive_close(state, node, max_depth)
    renderer.redraw(state)
    renderer.focus_node(state, last:get_id())
end

-- Close all containing folders back to the top level.
M.neotree_zC = function(state)
    M.neotree_zc(state, true)
end

--- Open a closed folder or close an open one, with an optional count.
M.neotree_za = function(state, toggle_all)
    local node = state.tree:get_node()
    if not node then
        return
    end

    if node.type == "directory" and not node:is_expanded() then
        M.neotree_zo(state, toggle_all)
    else
        M.neotree_zc(state, toggle_all)
    end
end

--- Recursively close an open folder or recursively open a closed folder.
M.neotree_zA = function(state)
    M.neotree_za(state, true)
end

--- Set depthlevel, analagous to foldlevel, for the neo-tree file tree.
M.set_depthlevel = function(state, depthlevel)
    if depthlevel < MIN_DEPTH then
        depthlevel = MIN_DEPTH
    end

    local stack = state.tree:get_nodes()
    while next(stack) ~= nil do
        local node = table.remove(stack)

        if node.type == "directory" then
            local should_be_open = depthlevel == nil or node:get_depth() < depthlevel
            if should_be_open and not node:is_expanded() then
                M.open_dir(state, node)
            elseif not should_be_open and node:is_expanded() then
                node:collapse()
            end
        end

        local children = state.tree:get_nodes(node:get_id())
        for _, v in ipairs(children) do
            table.insert(stack, v)
        end
    end

    vim.b.neotree_depthlevel = depthlevel
end

--- Refresh the tree UI after a change of depthlevel.
-- @bool stay Keep the current node revealed and selected
M.redraw_after_depthlevel_change = function(state, stay)
    local node = state.tree:get_node()

    if stay then
        require("neo-tree.ui.renderer").expand_to_node(state.tree, node)
    else
        -- Find the closest parent that is still visible.
        local parent = state.tree:get_node(node:get_parent_id())
        while not parent:is_expanded() and parent:get_depth() > 1 do
            node = parent
            parent = state.tree:get_node(node:get_parent_id())
        end
    end

    renderer.redraw(state)
    renderer.focus_node(state, node:get_id())
end

--- Update all open/closed folders by depthlevel, then reveal current node.
M.neotree_zx = function(state)
    M.set_depthlevel(state, vim.b.neotree_depthlevel or MIN_DEPTH)
    M.redraw_after_depthlevel_change(state, true)
end

--- Update all open/closed folders by depthlevel.
M.neotree_zX = function(state)
    M.set_depthlevel(state, vim.b.neotree_depthlevel or MIN_DEPTH)
    M.redraw_after_depthlevel_change(state, false)
end

-- Collapse more folders: decrease depthlevel by 1 or count.
M.neotree_zm = function(state)
    local depthlevel = vim.b.neotree_depthlevel or MIN_DEPTH
    M.set_depthlevel(state, depthlevel - vim.v.count1)
    M.redraw_after_depthlevel_change(state, false)
end

-- Collapse all folders. Set depthlevel to MIN_DEPTH.
M.neotree_zM = function(state)
    M.set_depthlevel(state, MIN_DEPTH)
    M.redraw_after_depthlevel_change(state, false)
end

-- Expand more folders: increase depthlevel by 1 or count.
M.neotree_zr = function(state)
    local depthlevel = vim.b.neotree_depthlevel or MIN_DEPTH
    M.set_depthlevel(state, depthlevel + vim.v.count1)
    M.redraw_after_depthlevel_change(state, false)
end

-- Expand all folders. Set depthlevel to the deepest node level.
M.neotree_zR = function(state)
    local top_level_nodes = state.tree:get_nodes()

    local max_depth = 1
    for _, node in ipairs(top_level_nodes) do
        max_depth = math.max(max_depth, M.recursive_open(state, node))
    end

    vim.b.neotree_depthlevel = max_depth
    M.redraw_after_depthlevel_change(state, false)
end

return M
