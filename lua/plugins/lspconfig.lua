return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- lua lspconfig
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      local keymap = vim.keymap

      -- related keymaps
      keymap.set("n", "[d", vim.diagnostic.goto_prev) -- navigate to prev problem
      keymap.set("n", "]d", vim.diagnostic.goto_next) -- navigate to next problem

      local telescope_builtin = require("telescope.builtin")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts) -- show details
          vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
          vim.keymap.set(
            { "n", "v" },
            "<space>ca",
            vim.lsp.buf.code_action,
            opts
          )
          vim.keymap.set("n", "gr", telescope_builtin.lsp_references, opts)
        end,
      })
    end,
  },
}
