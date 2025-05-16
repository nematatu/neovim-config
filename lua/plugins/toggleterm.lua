return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup {
            size = 20,
            open_mapping = [[<leader>tt]],
            hide_numbers = true,
            shade_filetypes = {},
            autochdir = false,
            shade_terminals = true,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            persist_mode = true,
            direction = 'float', -- 通常の開き方はfloat
            close_on_exit = false,
            clear_env = false,
            shell = '/bin/zsh',
            auto_scroll = true,
            float_opts = {
                border = 'curved',
                winblend = 3,
                title_pos = 'center',
            },
            winbar = {
                enabled = false,
                name_formatter = function(term)
                    return term.name
                end
            },
        }

        local Terminal = require('toggleterm.terminal').Terminal

        -- Lazygit terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
        function _lazygit_toggle()
            lazygit:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

        -- Diffview
        function _diffview_toggle()
            vim.cmd("DiffviewOpen")
        end

        vim.api.nvim_set_keymap("n", "<leader>dv", "<cmd>lua _diffview_toggle()<CR>", { noremap = true, silent = true })

        -- Bottom terminal（水平分割で開く）
        local bottom_term = Terminal:new({
            direction = "horizontal",
            hidden = true,
            size = 5, -- ★ここで高さ指定
        })

        function _bottom_term_toggle()
            bottom_term:toggle()
        end

        -- Insert と Normal 両モードで <leader>tb を有効化
        vim.keymap.set({ "n", "i" }, "<leader>tb", function() _bottom_term_toggle() end,
            { noremap = true, silent = true })

        -- Terminalモードから <ESC> でノーマルに戻る
        vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], { silent = true })
    end
}
