require("gitblame").setup({
    enabled = true,
    virtual_text_column = 80,
    delay = 100,
    highlight_group = "CursorLine",
    message_template = "<author>, <date> - <summary>",
    message_when_not_committed = "Not Commited"
    -- set_extmark_options = {
    --     { "priority": 100 },
    -- },
})
