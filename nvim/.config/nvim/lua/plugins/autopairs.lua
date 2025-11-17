return {
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
}
