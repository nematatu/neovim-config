-- launch-test.lua
vim.lsp.start({
  name = "lua_ls", -- 管理上の名前
  cmd = { "lua-language-server" }, -- Language server を起動するためのコマンド
  root_dir = vim.fs.dirname(vim.fs.find({ ".luarc.json" }, { upward = true })[1]), -- プロジェクトのルートディレクトリを検索する
})
