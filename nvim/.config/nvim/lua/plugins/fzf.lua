return {
  {
    'ibhagwan/fzf-lua',
    event = 'VeryLazy',
    config = function()
      local fzf_lua = require('fzf-lua')

      fzf_lua.setup({
        defaults = {
          file_icons = false,
          git_icons = false,
          color_icons = false,
        },
        winopts = {
          backdrop = 100,
          row = 1,
          col = 0,
          width = 1,
          height = 0.5,
          border = 'rounded',
          preview = {
            default = 'cat',
            border = 'border',
            horizontal = 'right:50%',
          },
          treesitter = false,
        },
        fzf_opts = {
          ['--layout'] = 'default',
          ['--ansi'] = true,
        },
        files = {
          winopts = {
            fullscreen = true,
          },
        },
        grep = {
          rg_opts = '--column --line-number --no-heading --color=always --smart-case --hidden --max-columns=4096 -e',
          winopts = {
            fullscreen = true,
          },
        },
      })

      vim.keymap.set('n', '<leader>ff', fzf_lua.files, { desc = 'Fzf Files' })
      vim.keymap.set('n', '<leader>fg', function() fzf_lua.grep({ search = '' }) end, { desc = 'Fzf Grep' })
      vim.keymap.set('n', '<leader>fw', fzf_lua.grep_cword, { desc = 'Fzf Word' })
      vim.keymap.set('n', '<leader>fb', fzf_lua.buffers, { desc = 'Fzf Buffers' })

      vim.api.nvim_set_keymap('n', '<leader>p', '<leader>ff', { noremap = false })
      vim.api.nvim_set_keymap('n', '<leader>s', '<leader>fg', { noremap = false })
      vim.api.nvim_set_keymap('n', '<leader>b', '<leader>fb', { noremap = false })
      vim.api.nvim_set_keymap('n', '<leader>w', '<leader>fw', { noremap = false })
    end,
  },
}
