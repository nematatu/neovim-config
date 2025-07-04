return {
    "AckslD/nvim-anywise-reg.lua",
    -- `opts`テーブル内に設定を記述します
    opts = {
        -- このプラグインの機能を有効にするオペレーター (y:ヤンク, d:削除, c:変更)
        operators = { "y", "d", "c" },

        -- 対象としたいテキストオブジェクト
        -- {{'i', 'a'}, {'w', 'f', 'p'}} と書くと、
        -- iw, aw, if, af, ip, ap のすべてが対象になります。
        textobjects = {
            { "i", "a" },
            -- w:単語, W:単語(スペース区切り), p:段落, f:関数, c:クラスなど
            -- お使いのテキストオブジェクトに合わせて追加・削除してください
            { "w", "W", "p", "f", "c" },
        },

        -- このプラグインの機能で貼り付けを行うキー
        paste_keys = {
            ["p"] = "p",
            ["P"] = "P",
        },

        -- :RegData コマンドを有効にするか (デバッグ用)
        register_print_cmd = true,
    },
}
