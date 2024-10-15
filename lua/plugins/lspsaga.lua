return {
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      local keymap = vim.keymap

      keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
      keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>")
      keymap.set("n", "<leader>o", "<cmd>Lspsaga outline")

      require("lspsaga").setup({
        ui = {
          border = "rounded",
        },
        lightbulb = {
          enable = false,
        },
      })

      local telescope_builtin = require("telescope.builtin")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = "v:lua.lsp.omnifunc"

          local opts = { buffer = ev.buf }
          keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
          keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
          keymap.set(
            { "n", "v" },
            "<space>ca",
            "<cmd>Lspsaga code_action<cr>",
            opts
          )
          keymap.set("n", "gr", telescope_builtin.lsp_references, opts)
        end,
      })

      keymap.set("n", "<space>k", "<cmd>Lspsaga hover_doc<cr>", {
        silent = true,
      })
      vim.fn.sign_define({
        {
          name = "DiagnosticSignError",
          text = "",
          texthl = "DiagnosticSignError",
          linehl = "ErrorLine",
        },
        {
          name = "DiagnosticSignWarn",
          text = "",
          texthl = "DiagnosticSignWarn",
          linehl = "WarningLine",
        },
        {
          name = "DiagnosticSignInfo",
          text = "",
          texthl = "DiagnosticSignInfo",
          linehl = "InfoLine",
        },
        {
          name = "DiagnosticSignHint",
          text = "",
          texthl = "DiagnosticSignHint",
          linehl = "HintLine",
        },
      })
    end,
  },
}
