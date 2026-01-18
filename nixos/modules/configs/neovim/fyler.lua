local fyler = require("fyler")

fyler.setup()

vim.keymap.set(
    "n",
    "<C-n>",
    function() fyler.toggle({ kind = "split_left_most" }) end,
    { desc = "Toggle Fyler View" }
)
