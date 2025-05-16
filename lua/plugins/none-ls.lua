return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "javascript", "typescript", "typescriptreact", "json", "css", "html", "markdown",
          },
        }),
      },
    })
  end,
}
