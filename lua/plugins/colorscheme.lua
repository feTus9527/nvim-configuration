return {
  {
    "sainnhe/everforest",
    priority = 1000,
    config = function()
      vim.g.everforest_diagnostic_line_height = 1
      vim.cmd([[colorscheme everforest]])
    end,
  },
}
