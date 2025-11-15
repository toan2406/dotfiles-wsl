vim.o.hidden = true
vim.o.modeline = false
vim.o.swapfile = false
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.ruler = true
vim.o.number = true
vim.o.relativenumber = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.colorcolumn = '80'
vim.o.listchars = 'eol:¬,tab:>·,trail:~,extends:>,precedes:<'
vim.o.list = true
vim.o.scrolloff = 10
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'
vim.o.lazyredraw = true
vim.o.termguicolors = true
vim.o.background = 'dark'

-- See `:h clipboard-wsl`
vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] =
    'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] =
    'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}

vim.g.mapleader = ','

vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
