return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        use_treesitter = true,
        style = {
          { fg = "#806d9c" },
        },
      },
      indent = {
        enable = true,
        use_treesitter = true,
        style = {
          { fg = "#c21f30" },
        },
      },
      line_num = {
        enable = false,
      },
      blank = {
        enable = false,
      },
    })
  end
}
