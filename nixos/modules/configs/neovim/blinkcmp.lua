local blink = require('blink.cmp')

blink.setup({
    completion = {
        menu = {
            --auto_show = false,
        },
    },
    sources = {
        default = {"lsp","path","buffer","emoji"},
        providers = {
            emoji = {
                module = "blink-emoji",
                name = "Emoji",
                score_offset = 15,
            },
        },
    },
    keymap = {
        preset = "default",
        --['<CR>'] = { 'accept', 'fallback' },
    },
})
