return {
  {
    "sainnhe/everforest",
    priority = 1000,
    config = function()
      vim.g.everforest_diagnostic_line_height = 1
      vim.cmd([[colorscheme everforest]])
      -- vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
      -- vim.cmd([[highlight NonText guibg=NONE ctermbg=NONE]])
    end,
  },
}
