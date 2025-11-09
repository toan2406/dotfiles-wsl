-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out,                            'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Setup other settings
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

-- See :h clipboard-wsl
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

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = false })
vim.api.nvim_set_keymap('n', '<Space>', ':', { noremap = true })
vim.api.nvim_set_keymap('v', '<Space>', ':', { noremap = true })
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', { noremap = true })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local bufmap = function(mode, rhs, lhs)
      vim.keymap.set(mode, rhs, lhs, { buffer = event.buf })
    end

    bufmap('n', '<leader>lf', '<CMD>lua vim.lsp.buf.format({ async = true })<CR>')
  end,
})

vim.lsp.enable('luals')

-- Setup lazy.nvim
require('lazy').setup({
  defaults = {
    lazy = false,
  },
  spec = {
    { import = 'plugins' },
  },
  install = {
    colorscheme = { 'gruvbox' }
  },
  checker = {
    enabled = false
  },
  change_detection = {
    enabled = false
  },
})
