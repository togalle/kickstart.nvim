return {
  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'

      -- Key mappings for VimTeX
      vim.keymap.set('n', '<leader>lv', '<cmd>VimtexView<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>lc', '<cmd>VimtexCompile<CR>', { noremap = true, silent = true })
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'micangl/cmp-vimtex',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        mapping = {
          ['<CR>'] = cmp.mapping.confirm { select = true }, -- Confirm selection with Enter
          ['<Down>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, -- Navigate down with Down arrow
          ['<Up>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, -- Navigate up with Up arrow
          ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, -- Optional: Use Ctrl+n for next
          ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, -- Optional: Use Ctrl+p for previous
        },
        sources = {
          { name = 'vimtex' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'nvim_lsp' },
        },
      }
    end,
  },
}
