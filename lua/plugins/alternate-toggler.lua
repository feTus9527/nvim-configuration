return {
  {
    "rmagatti/alternate-toggler",
    config = function()
      require("alternate-toggler").setup({
        alternates = {
          ["==="] = "!==",
          ["=="] = "!=",
          ["error"] = "warn",
        },
      })

      vim.keymap.set("n", "<leader>i", "<cmd>ToggleAlternate<cr>")
    end,
  },
}
