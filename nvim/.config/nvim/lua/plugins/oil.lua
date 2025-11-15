return {
  {
    'stevearc/oil.nvim',
    opts = {},
    lazy = false,
    config = function()
      local oil = require('oil')

      oil.setup({
        columns = {
          -- 'icon',
          'permissions',
          'size',
          'mtime',
        },
        keymaps = {
          ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
          ['<C-s>'] = { 'actions.select', opts = { horizontal = true } },
          ['<C-t>'] = { 'actions.select', opts = { tab = true } },
          ['<Esc>'] = { 'actions.close', mode = 'n' },
        },
        float = {
          padding = 0,
          border = 'rounded',
          win_options = {
            winhighlight = 'NormalFloat:OilFloat',
          },
          override = function(conf)
            conf.height = conf.height - 1
            return conf
          end,
        },
        view_options = {
          show_hidden = true,
        },
      })

      vim.api.nvim_set_hl(0, 'OilFloat', { ctermbg = 'black', ctermfg = 'white' })

      vim.keymap.set('n', '<leader>e', oil.toggle_float, { desc = 'Open parent directory' })
    end,
  },
}
