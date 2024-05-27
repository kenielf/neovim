require("neoscroll").setup()

local t         = {}

-- Syntax: t[keys] = {function, {function arguments}}
t["<C-S-Up>"]   = { "scroll", { "-vim.wo.scroll", "true", "100", nil } }
t["<C-S-Down>"] = { "scroll", { "vim.wo.scroll", "true", "100", nil } }
t["<C-y>"]      = { "scroll", { "-0.10", "false", "100", nil } }
t["<C-e>"]      = { "scroll", { "0.10", "false", "100", nil } }
t["zt"]         = { "zt", { "50" } }
t["zz"]         = { "zz", { "50" } }
t["zb"]         = { "zb", { "50" } }

require("neoscroll.config").set_mappings(t)
