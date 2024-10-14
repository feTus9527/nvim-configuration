return {
  {
    "rmagatti/alternate-toggler",
    config = function()
      alternates = {
        ["==="] = "!==",
        ["=="] = "!=",
        ["error"] = "warn",
      }

      vim.keymap.set("n", "<leader>i", "<cmd>ToggleAlternate<cr>")
    end,
  },
}
