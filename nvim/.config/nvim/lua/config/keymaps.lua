vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = false })
vim.api.nvim_set_keymap('n', '<Space>', ':', { noremap = true })
vim.api.nvim_set_keymap('v', '<Space>', ':', { noremap = true })
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', { noremap = true })
