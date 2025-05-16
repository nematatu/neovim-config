local opts = { noremap = true, silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>k", ":w<CR>", { noremap = true, silent = true })
-- New tab
keymap("n", "te", ":tabedit", opts)
-- 新しいタブを一番右に作る
keymap("n", "gn", ":tabnew<Return>", opts)
-- move tab
keymap("n", "gh", "gT", opts)
keymap("n", "gl", "gt", opts)

-- Split window
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)

-- 全選択
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- NormalとVisualでヤンクせずに削除
keymap("n", "x", '"_x', opts)
keymap("v", "x", '"_x', opts)

-- Yで行末までコピー
keymap("n", "Y", "y$", opts)

-- <Space>q で強制終了
keymap("n", "<Space>q", ":<C-u>q!<Return>", opts)

-- ESC*2 でハイライトやめる
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jj", "<ESC>", opts)

-- コンマ, : の後に自動的にスペースを挿入
keymap("i", ",", ",<Space>", opts)
keymap("i", ":", ":<Space>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- ビジュアルモード時vで行末まで選択
keymap("v", "v", "$h", opts)

-- 0番レジスタを使いやすくした
keymap("v", "<C-p>", '"0p', opts)

-- フォーマッタ
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ctx)
        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end,
            { noremap = true, silent = true })
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
        vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
        vim.keymap.set('n', 'gb', '<C-t>')
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
        vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
        vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
        vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
        vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
        vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
        vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    end,
}
)

-- ファイル切り替え
vim.keymap.set("n", "<C-s>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<C-f>", "<cmd>bnext<CR>")

-- init.lua に記述
vim.api.nvim_set_keymap('', '<ScrollWheelUp>', '1<C-Y>', opts)
vim.api.nvim_set_keymap('', '<ScrollWheelDown>', '1<C-E>', opts)
vim.api.nvim_set_keymap('i', '<ScrollWheelUp>', '<Esc>1<C-Y>i', opts)
vim.api.nvim_set_keymap('i', '<ScrollWheelDown>', '<Esc>1<C-E>i', opts)

vim.keymap.set("n", "<leader>si", function() require("sidebar-nvim").toggle() end, { desc = "Toggle sidebar" })

-- 次のエラーにジャンプ（下方向）
vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- 前のエラーにジャンプ（上方向）
vim.keymap.set("n", "<leader>ep", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "<leader>dy", function()
    local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
    local col = vim.fn.col('.') - 1

    for _, diag in ipairs(diagnostics) do
        if col >= diag.col and col <= diag.end_col then
            vim.fn.setreg("+", diag.message)
            print("Copied: " .. diag.message)
            return
        end
    end

    print("No diagnostic under cursor.")
end, { desc = "Yank diagnostic under cursor" })
