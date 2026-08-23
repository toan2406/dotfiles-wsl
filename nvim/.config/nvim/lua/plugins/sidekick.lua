return {
  {
    'folke/sidekick.nvim',
    lazy = false,
    config = function()
      require('sidekick').setup({
        nes = {
          enabled = false,
        },
        cli = {
          mux = {
            enabled = true,
            backend = 'tmux',
          },
          win = {
            wo = {
              -- winhighlight = 'Normal:Normal',
            },
            keys = {
              nav_left  = { '<C-w>h', '<C-\\><C-n><C-w>h', expr = false, desc = 'navigate to the left window' },
              nav_down  = { '<C-w>j', '<C-\\><C-n><C-w>j', expr = false, desc = 'navigate to the below window' },
              nav_up    = { '<C-w>k', '<C-\\><C-n><C-w>k', expr = false, desc = 'navigate to the above window' },
              nav_right = { '<C-w>l', '<C-\\><C-n><C-w>l', expr = false, desc = 'navigate to the right window' },
            },
          },
        },
      })

      vim.keymap.set('n', '<leader>ac',
        function() require('sidekick.cli').toggle({ name = 'claude', focus = true }) end,
        { desc = 'Sidekick Toggle Claude' })

      vim.keymap.set('n', '<leader>as',
        function() require('sidekick.cli').send({ name = 'claude', msg = '{file}' }) end,
        { desc = 'Send File' })

      vim.keymap.set('x', '<leader>as',
        function() require('sidekick.cli').send({ name = 'claude', msg = '{selection}' }) end,
        { desc = 'Send Visual Selection' })
    end,
  },
}
