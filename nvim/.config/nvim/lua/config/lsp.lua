vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local bufmap = function(mode, rhs, lhs)
      vim.keymap.set(mode, rhs, lhs, { buffer = event.buf })
    end

    bufmap('n', '<leader>lf', '<CMD>lua vim.lsp.buf.format({ async = true })<CR>')
  end,
})

vim.lsp.enable('luals')
