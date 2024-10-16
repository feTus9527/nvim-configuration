return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local api = require("typescript-tools.api")
      require("typescript-tools").setup({
        handlers = {
          ["textDocument/publishDiagnostics"] = api.filter_diagnostics({ 6133 }) -- ignore 6133: LSP disgnostics
        },
        settings = {
          tsserver_file_preferences = {
            importModuleSpecifierPreference = "non-relative",
          },
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.ts,*.tsx,*.js,*.jsx",
        callback = function(args)
          vim.cmd("TSToolsAddMissingImports sync")
          vim.cmd("TSToolsOrganizeImports sync")
          require("conform").format({ bufnr = args.bufnr })
        end,
      })
    end,
  },
}
