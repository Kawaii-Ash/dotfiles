require('nvim-treesitter.configs').setup {
  highlight = { enable = true },
  indent = { enable = true },
  additional_vim_regex_highlighting = false,
}
vim.opt.foldmethod = 'expr'
--vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldenable = false
