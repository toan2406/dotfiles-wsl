return {
  {
    'ggandor/leap.nvim',
    keys = {
      {
        's',
        function()
          require('leap').leap({
            target_windows = vim.tbl_filter(
              function(win) return vim.api.nvim_win_get_config(win).focusable end,
              vim.api.nvim_tabpage_list_wins(0)
            )
          })
        end,
      },
    },
    config = function()
      require('leap').add_default_mappings()

      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    end,
  },

  {
    'b3nj5m1n/kommentary',
    event = 'VeryLazy',
    config = function()
      vim.g.kommentary_create_default_mappings = false

      vim.keymap.set('n', '<leader>cc', '<Plug>kommentary_line_default')
      vim.keymap.set('n', '<leader>c', '<Plug>kommentary_motion_default')
      vim.keymap.set('v', '<leader>c', '<Plug>kommentary_visual_default<Esc>')

      require('kommentary.config').configure_language('default', {
        prefer_single_line_comments = true,
      })
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      local npairs = require('nvim-autopairs')

      npairs.setup()

      npairs.get_rule("'")[1]:with_pair(function()
        if vim.bo.filetype == 'reason' then
          return false
        end
      end)

      npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
    end,
  },

  {
    'numToStr/Navigator.nvim',
    event = 'VeryLazy',
    config = function()
      local map = vim.keymap.set
      local opts = { remap = false, silent = true }

      require('Navigator').setup({
        auto_save = nil,
        disable_on_zoom = false,
      })

      map('n', '<C-w>h', '<CMD>lua require("Navigator").left()<CR>', opts)
      map('n', '<C-w>j', '<CMD>lua require("Navigator").down()<CR>', opts)
      map('n', '<C-w>k', '<CMD>lua require("Navigator").up()<CR>', opts)
      map('n', '<C-w>l', '<CMD>lua require("Navigator").right()<CR>', opts)
    end,
  },
}
